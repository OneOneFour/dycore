!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!                                                                   !!
!!                   GNU General Public License                      !!
!!                                                                   !!
!! This file is part of the Flexible Modeling System (FMS).          !!
!!                                                                   !!
!! FMS is free software; you can redistribute it and/or modify       !!
!! it and are expected to follow the terms of the GNU General Public !!
!! License as published by the Free Software Foundation.             !!
!!                                                                   !!
!! FMS is distributed in the hope that it will be useful,            !!
!! but WITHOUT ANY WARRANTY; without even the implied warranty of    !!
!! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the     !!
!! GNU General Public License for more details.                      !!
!!                                                                   !!
!! You should have received a copy of the GNU General Public License !!
!! along with FMS; if not, write to:                                 !!
!!          Free Software Foundation, Inc.                           !!
!!          59 Temple Place, Suite 330                               !!
!!          Boston, MA  02111-1307  USA                              !!
!! or see:                                                           !!
!!          http://www.gnu.org/licenses/gpl.txt                      !!
!!                                                                   !!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!                                                                   !!
!!                 Modified by Cegeon Chan 7/25/06                   !!
!!                                                                   !!
!!       The goal is to reproduce the background equilibrium         !!
!!       temperature used by Polvani and Kushner (2002)              !!
!!                                                                   !!
!!       The troposphere is identical to Held and Suarez (with       !!
!!       an asymmetry) and the stratosphere is from the              !!
!!       US Standard Atmosphere - the latitudinal variation is       !!
!!       is supplied by a weighting function that generates a        !!
!!       a polar vortex                                              !!
!!                                                                   !!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!                                                                   !!
!!                 Modified by Daniela Domeisen  10/20/10            !!
!!                                                                   !!
!!                 Including the sponge layer from                   !!
!!                 Kushner&Polvani02 which was implemented in        !!
!!                 spectral_damping.f90 before.                      !!
!!                 Using the sponge layer from Ed Gerber (epg notes).!!
!!                                                                   !!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



module hs_forcing_mod

!-----------------------------------------------------------------------

use     constants_mod, only: KAPPA, CP_AIR, GRAV

use           fms_mod, only: error_mesg, FATAL, file_exist,       &
                             open_namelist_file, check_nml_error, &
                             mpp_pe, mpp_root_pe, close_file,     &
                             write_version_number, stdlog,        &
                             uppercase

use  time_manager_mod, only: time_type, get_time

use  diag_manager_mod, only: register_diag_field, send_data

use  field_manager_mod, only: MODEL_ATMOS, parse
use tracer_manager_mod, only: query_method, get_tracer_index

implicit none
private

!-----------------------------------------------------------------------
!---------- interfaces ------------

   public :: hs_forcing, hs_forcing_init

!-----------------------------------------------------------------------
!-------------------- namelist -----------------------------------------

   logical :: no_forcing = .false.

   real :: t_zero=315., t_strat=216.65, delh=60., delv=10., eps=-10., sigma_b=0.7
   real :: P00 = 1.e5

   real :: gamma = 0.004, P_T = 2.e4,t_us_tp = 216.65, R = 287., g=9.8 
   real :: h1 = 0.2, h2 = 0.054, h3 = 0.008565, h4 = .001094, h5 = 6.6046e-4

   real :: ka = -40. !  negative values are damping time in days
   real :: ks =  -4., kf = -1.

   logical :: do_conserve_energy = .true.

   real :: trflux = 1.e-5   !  surface flux for optional tracer
   real :: trsink = -4.     !  damping time for tracer

! epg: stratospheric drag parameters
   logical :: stratospheric_sponge = .true. ! turn on stratospheric drag
   logical :: damp_zonal_mean = .true.      ! if false, only anomalies from
                                             ! zonal mean are damped     
   real :: sponge_pbottom = 50.    !bottom of sponge layer, 
                                    !where damping is zero (Pa)
   real :: tau_sponge  = -0.5   !damping time scale for the sponge
                                !negative values are days 
!   real :: tka, tka_strat, tka_zonal_mean, tks, vkf, v_sponge
! epg: end of stratospheric drag parameters

!-----------------------------------------------------------------------

   namelist /hs_forcing_nml/  no_forcing, t_zero, t_strat, delh, delv, eps, &
                              sigma_b, ka, ks, kf, do_conserve_energy, &
                              trflux, trsink, stratospheric_sponge, &
                              damp_zonal_mean, sponge_pbottom, tau_sponge

!-----------------------------------------------------------------------

   character(len=128) :: version='$Id: hs_forcing.f90,v 10.0 2003/10/27 23:31:04 arl Exp $'
   character(len=128) :: tagname='$Name:  $'

 real :: tka, tka_strat, tka_zonal_mean, tks, vkf, v_sponge

!   real :: tka, tks, vkf
   real :: trdamp

   integer :: id_teq, id_tdt, id_udt, id_vdt,  &
              id_tdt_diss, id_diss_heat
   real    :: missing_value = -1.e10
   character(len=14) :: mod_name = 'hs_forcing'

   logical :: module_is_initialized = .false.

!-----------------------------------------------------------------------

contains

!#######################################################################

 subroutine hs_forcing ( is, ie, js, je, dt, Time, lat, p_half, p_full, &
                         u, v, t, r, um, vm, tm, rm, udt, vdt, tdt, rdt,&
                         mask, kbot )

!-----------------------------------------------------------------------
   integer, intent(in)                        :: is, ie, js, je
      real, intent(in)                        :: dt
 type(time_type), intent(in)                  :: Time
      real, intent(in),    dimension(:,:)     :: lat
      real, intent(in),    dimension(:,:,:)   :: p_half, p_full
      real, intent(in),    dimension(:,:,:)   :: u, v, t, um, vm, tm
      real, intent(in),    dimension(:,:,:,:) :: r, rm
      real, intent(inout), dimension(:,:,:)   :: udt, vdt, tdt
      real, intent(inout), dimension(:,:,:,:) :: rdt

      real, intent(in),    dimension(:,:,:), optional :: mask
   integer, intent(in),    dimension(:,:)  , optional :: kbot
!-----------------------------------------------------------------------
   real, dimension(size(t,1),size(t,2))           :: ps, diss_heat
   real, dimension(size(t,1),size(t,2),size(t,3)) :: ttnd, utnd, vtnd, teq, pmass
   real, dimension(size(r,1),size(r,2),size(r,3)) :: rst, rtnd
   integer :: i, j, k, kb, n
   logical :: used
   real    :: flux, sink, value
   character(len=128) :: scheme, params

!-----------------------------------------------------------------------
     if (no_forcing) return

     if (.not.module_is_initialized) call error_mesg ('hs_forcing','hs_forcing_init has not been called', FATAL)

!-----------------------------------------------------------------------
!     surface pressure

     if (present(kbot)) then
         do j=1,size(p_half,2)
         do i=1,size(p_half,1)
            kb = kbot(i,j)
            ps(i,j) = p_half(i,j,kb+1)
         enddo
         enddo
     else
            ps(:,:) = p_half(:,:,size(p_half,3))
     endif

!-----------------------------------------------------------------------
!     rayleigh damping of wind components near the surface

      call rayleigh_damping ( ps, p_full, u, v, utnd, vtnd, mask=mask )

      if (do_conserve_energy) then
         ttnd = -((um+.5*utnd*dt)*utnd + (vm+.5*vtnd*dt)*vtnd)/CP_AIR
         tdt = tdt + ttnd
         if (id_tdt_diss > 0) used = send_data ( id_tdt_diss, ttnd, Time, is, js)
       ! vertical integral of ke dissipation
         if ( id_diss_heat > 0 ) then
          do k = 1, size(t,3)
            pmass(:,:,k) = p_half(:,:,k+1)-p_half(:,:,k)
          enddo
          diss_heat = CP_AIR/GRAV * sum( ttnd*pmass, 3)
          used = send_data ( id_diss_heat, diss_heat, Time, is, js)
         endif
      endif

      udt = udt + utnd
      vdt = vdt + vtnd

      if (id_udt > 0) used = send_data ( id_udt, utnd, Time, is, js)
      if (id_vdt > 0) used = send_data ( id_vdt, vtnd, Time, is, js)

!-----------------------------------------------------------------------
!     thermal forcing for held & suarez (1994) benchmark calculation

      call newtonian_damping ( lat, ps, p_full, t, Time, ttnd, teq, mask )

      tdt = tdt + ttnd

      if (id_tdt > 0) used = send_data ( id_tdt, ttnd, Time, is, js)
      if (id_teq > 0) used = send_data ( id_teq, teq,  Time, is, js)

!-----------------------------------------------------------------------
!     -------- tracers -------

      do n = 1, size(rdt,4)
         flux = trflux
         sink = trsink
         if (query_method('tracer_sms', MODEL_ATMOS, n, scheme, params)) then
             if (uppercase(trim(scheme)) == 'NONE') cycle
             if (uppercase(trim(scheme)) == 'OFF') then
               flux = 0.; sink = 0.
             else
               if (parse(params,'flux',value) == 1) flux = value
               if (parse(params,'sink',value) == 1) sink = value
             endif
         endif
         rst = rm(:,:,:,n) + dt*rdt(:,:,:,n)
         call tracer_source_sink ( flux, sink, p_half, rst, rtnd, kbot )
         rdt(:,:,:,n) = rdt(:,:,:,n) + rtnd
      enddo

!-----------------------------------------------------------------------

 end subroutine hs_forcing

!#######################################################################

 subroutine hs_forcing_init ( axes, Time )

!-----------------------------------------------------------------------
!
!           routine for initializing the model with an
!              initial condition at rest (u & v = 0)
!
!-----------------------------------------------------------------------

           integer, intent(in) :: axes(4)
   type(time_type), intent(in) :: Time

!-----------------------------------------------------------------------
   integer  unit, io, ierr

!     ----- read namelist -----

      if (file_exist('input.nml')) then
         unit = open_namelist_file ( )
         ierr=1; do while (ierr /= 0)
            read  (unit, nml=hs_forcing_nml, iostat=io, end=10)
            ierr = check_nml_error (io, 'hs_forcing_nml')
         enddo
  10     call close_file (unit)
      endif

!     ----- write version info and namelist to log file -----

      call write_version_number (version,tagname)
      if (mpp_pe() == mpp_root_pe()) write (stdlog(),nml=hs_forcing_nml)

      if (no_forcing) return

!     ----- compute coefficients -----

      if (ka < 0.) ka = -86400.*ka
      if (ks < 0.) ks = -86400.*ks
      if (kf < 0.) kf = -86400.*kf
!epg: make sure the value of tau_sponge is in SI units
      if (tau_sponge < 0.) tau_sponge = -86400.*tau_sponge


      tka = 0.; if (ka > 0.) tka = 1./ka
      tks = 0.; if (ks > 0.) tks = 1./ks
      vkf = 0.; if (kf > 0.) vkf = 1./kf
!epg: this is for the stratospheric sponge
      v_sponge=0.; if (tau_sponge > 0.) v_sponge=1./tau_sponge

!     ----- for tracers -----

      if (trsink < 0.) trsink = -86400.*trsink
      trdamp = 0.; if (trsink > 0.) trdamp = 1./trsink

!     ----- register diagnostic fields -----

      id_teq = register_diag_field ( mod_name, 'teq', axes(1:3), Time, &
                      'equilibrium temperature', 'deg_K'   , &
                      missing_value=missing_value, range=(/100.,400./) )

      id_tdt = register_diag_field ( mod_name, 'tdt_ndamp', axes(1:3), Time, &
                      'newtonian damping', 'deg_K/sec' ,    &
                       missing_value=missing_value     )

      id_udt = register_diag_field ( mod_name, 'udt_rdamp', axes(1:3), Time, &
                      'rayleigh damping (zonal wind)', 'm/s2',       &
                       missing_value=missing_value     )

      id_vdt = register_diag_field ( mod_name, 'vdt_rdamp', axes(1:3), Time, &
                      'rayleigh damping (meridional wind)', 'm/s2',  &
                       missing_value=missing_value     )

      if (do_conserve_energy) then
         id_tdt_diss = register_diag_field ( mod_name, 'tdt_diss_rdamp', axes(1:3), &
                   Time, 'Dissipative heating from Rayleigh damping', 'deg_K/sec',&
                   missing_value=missing_value     )

         id_diss_heat = register_diag_field ( mod_name, 'diss_heat_rdamp', axes(1:2), &
                   Time, 'Integrated dissipative heating for Rayleigh damping', 'W/m2')
      endif

      module_is_initialized  = .true.

!-----------------------------------------------------------------------

 end subroutine hs_forcing_init

!#######################################################################

 subroutine hs_forcing_end 

!-----------------------------------------------------------------------
!
!       routine for terminating held-suarez benchmark module
!             (this routine currently does nothing)
!
!-----------------------------------------------------------------------
 module_is_initialized = .false.

 end subroutine hs_forcing_end

!#######################################################################

 subroutine newtonian_damping ( lat, ps, p_full, t, Time, tdt, teq, mask )

!-----------------------------------------------------------------------
!
!   routine to compute thermal forcing for held & suarez (1994)
!   benchmark calculation.
!
!-----------------------------------------------------------------------

real, intent(in),  dimension(:,:)   :: lat, ps
real, intent(in),  dimension(:,:,:) :: p_full, t
type(time_type), intent(in)         :: Time
real, intent(out), dimension(:,:,:) :: tdt, teq
real, intent(in),  dimension(:,:,:), optional :: mask
!-----------------------------------------------------------------------

          real, dimension(size(t,1),size(t,2)) :: &
     sin_lat, sin_lat_2, cos_lat_2, t_star, cos_lat_4, &
     tstr, sigma, the, tfactr, rps, p_norm
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          real, dimension(size(t,1),size(t,2)) :: w
          real, dimension(size(t,1),size(t,2),size(t,3)) :: t_us
       real, dimension(size(t,1),size(t,2),size(t,3)) :: tdamp
       real, dimension(size(t,1)*size(t,2),1) :: p_sum
       integer :: k,l,m, seconds, days
       real    :: tcoeff, pref, p, z
       real    :: As, An, time_in_days
!-----------------------------------------------------------------------
!------------latitudinal constants--------------------------------------

      sin_lat  (:,:) = sin(lat(:,:))
      sin_lat_2(:,:) = sin_lat(:,:)*sin_lat(:,:)
      cos_lat_2(:,:) = 1.0-sin_lat_2(:,:)
      cos_lat_4(:,:) = cos_lat_2(:,:)*cos_lat_2(:,:)

      t_star(:,:) = t_zero - delh*sin_lat_2(:,:) - eps*sin_lat(:,:)
      tstr  (:,:) = t_us_tp

        call get_time(Time, seconds, days)
        time_in_days=days+seconds/86400.
!print*,time_in_days
        if(time_in_days>1) then
        !print*,'cycle ',time_in_days
        As=max(0.0, sin(2*3.1416*(time_in_days-180.)/360.))
        An=max(0.0, sin(2*3.1416*time_in_days/360.))
        !print*,As
        w(:,:) = 0.5 * (As*(1-tanh((lat(:,:)+50*3.1416/180)/(10*3.1416/180)))   &
                       +An*(1+tanh((lat(:,:)-50*3.1416/180)/(10*3.1416/180))))
        else

        w(:,:) = 0.5 * (1-tanh((lat(:,:)+50*3.1416/180)/(10*3.1416/180)))
        end if
! lat weght coef = .5 for strat used by Polvani and Kushner (2002)
! 
!-----------------------------------------------------------------------

!-----------------------------------------------------------------------

      tcoeff = (tks-tka)/(1.0-sigma_b)
      pref = P00
      rps  = 1./ps

      do k = 1, size(t,3)

!  ----- compute equilibrium temperature (teq) -----
         p_norm(:,:) = p_full(:,:,k)/pref
         the   (:,:) = t_star(:,:) - delv*cos_lat_2(:,:)*log(p_norm(:,:))
         teq(:,:,k) = the(:,:)*(p_norm(:,:))**KAPPA
!         teq(:,:,k) = max( teq(:,:,k), tstr(:,:) )

! Take horz average - assume variations in are small compared to vert

p_sum=reshape(p_norm, (/ size(t,2)*size(t,1), 1/) )
p=sum(p_sum)/(size(t,2)*size(t,1))
!p_sum=0
!do l = 1, size(t,1)
!   do m = 1, size(t,2)
!      p_sum=p_sum+p_norm(l,m)
!    enddo
!enddo
!      p=p_sum/(size(t,2)*size(t,1))

               IF (p > h1) THEN
                  teq(:,:,k) = max(teq(:,:,k), tstr(:,:))
               ELSE IF (p < h1 .AND. p > h2) THEN   
                  t_us(:,:,k)=288. * 0.751865
                  teq(:,:,k)=(1-w(:,:))*t_us(:,:,k)+w(:,:)* &
                  t_us_tp*(p_full(:,:,k)/P_T)**(R*gamma/g)

               ELSE IF (p < h2 .AND. p > h3) THEN 
                  z = (exp(-log(p)/34.16319)-0.988626)*198903
                  t_us(:,:,k)=288*(0.682457 + z/288136)
                  teq(:,:,k)=(1-w(:,:))*t_us(:,:,k)+w(:,:)* & 
                  t_us_tp*(p_full(:,:,k)/P_T)**(R*gamma/g)

               ELSE IF (p < h3 .AND. p > h4) THEN 
                  z=(exp(-log(p)/12.20114)-0.898309)*55280
                  t_us(:,:,k)=288*(0.482561 + z/102906)
                  teq(:,:,k)=(1-w(:,:))*t_us(:,:,k)+w(:,:)* &
                  t_us_tp*(p_full(:,:,k)/P_T)**(R*gamma/g)

               ELSE IF (p < h4 .AND. p > h5) THEN 
!                  z=-((log(p/0.00109456)*7922)-46998)
                  t_us(:,:,k)=288*0.939268
                  teq(:,:,k)=(1-w(:,:))*t_us(:,:,k)+w(:,:)* &
                  t_us_tp*(p_full(:,:,k)/P_T)**(R*gamma/g)
         
               ELSE
!                  teq(:,:,k)=tstr(:,:)
!                  PRINT *, teq(:,:,k)
                  z=-((exp(log(p)/12.20114)-0.838263)*176142)
                 t_us(:,:,k)=288*(1.434843 - z / 102906)
                  teq(:,:,k)=(1-w(:,:))*t_us(:,:,k)+w(:,:)* &
                  t_us_tp*(p_full(:,:,k)/P_T)**(R*gamma/g)
      END IF


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!  ----- compute damping -----
         sigma(:,:) = p_full(:,:,k)*rps(:,:)
         where (sigma(:,:) <= 1.0 .and. sigma(:,:) > sigma_b)
           tfactr(:,:) = tcoeff*(sigma(:,:)-sigma_b)
           tdamp(:,:,k) = tka + cos_lat_4(:,:)*tfactr(:,:)
         elsewhere
           tdamp(:,:,k) = tka
         endwhere

      enddo

!*** note: if the following loop uses vector notation for all indices
!          then the code will not run ??????

      do k=1,size(t,3)
         tdt(:,:,k) = -tdamp(:,:,k)*(t(:,:,k)-teq(:,:,k))
      enddo

      if (present(mask)) then
         tdt = tdt * mask
         teq = teq * mask
      endif

!-----------------------------------------------------------------------

 end subroutine newtonian_damping

!#######################################################################

 subroutine rayleigh_damping ( ps, p_full, u, v, udt, vdt, mask )

!-----------------------------------------------------------------------
!
!           rayleigh damping of wind components near surface
!
!-----------------------------------------------------------------------

real, intent(in),  dimension(:,:)   :: ps
real, intent(in),  dimension(:,:,:) :: p_full, u, v
real, intent(out), dimension(:,:,:) :: udt, vdt
real, intent(in),  dimension(:,:,:), optional :: mask

!-----------------------------------------------------------------------

real, dimension(size(u,1),size(u,2)) :: sigma, vfactr, rps

integer :: i,j,k
real    :: vcoeff

! epg: these constants used for stratospheric sponge
real, dimension(size(u,2)) :: ubar, vbar
real, dimension(size(u,1),size(u,2)) :: ubars, vbars
!-----------------------------------------------------------------------
!----------------compute damping----------------------------------------

      vcoeff = -vkf/(1.0-sigma_b)
      rps = 1./ps

      do k = 1, size(u,3)

         sigma(:,:) = p_full(:,:,k)*rps(:,:)

         where (sigma(:,:) <= 1.0 .and. sigma(:,:) > sigma_b)
            vfactr(:,:) = vcoeff*(sigma(:,:)-sigma_b)
            udt(:,:,k)  = vfactr(:,:)*u(:,:,k)
            vdt(:,:,k)  = vfactr(:,:)*v(:,:,k)
         elsewhere
            udt(:,:,k) = 0.0
            vdt(:,:,k) = 0.0
         endwhere


! epg - stratospheric sponge -----------------------------------------

         ! Here an additional sponge may be added at the top of the 
         ! model's atmosphere (all pressures above pbottom).  Note
         ! p_full contains the instanteous pressure at each level 
         ! and location.
         if (stratospheric_sponge) then
            if (damp_zonal_mean) then ! damp full flow 
                  where (p_full(:,:,k) < sponge_pbottom)
                     vfactr(:,:) = -v_sponge*(sponge_pbottom-p_full(:,:,k))**2/(sponge_pbottom)**2
                     
                     udt(:,:,k) = udt(:,:,k) + vfactr(:,:)*u(:,:,k)
                     vdt(:,:,k) = vdt(:,:,k) + vfactr(:,:)*v(:,:,k)
                  endwhere
         !      endif
            else ! damp zonal anomalies
               ! This could be more efficient, as here I calculate the zonally
               ! averaged zonal wind for all layers (and most won't be damped).
               ! NOTE: this only works in parallel because the globe is divided
               !       into zonal slices, where each processor has all nx 
               !       longitudes at ny/nprocessors latitudes.
               ubar = sum(u(:,:,k),1)/size(u,1)
               vbar = sum(v(:,:,k),1)/size(v,1)
               ubars = spread(ubar,1,size(u,1))
               vbars = spread(vbar,1,size(v,1))
               where (p_full(:,:,k) < sponge_pbottom)
                  vfactr(:,:) = -v_sponge*(sponge_pbottom-p_full(:,:,k))**2/(sponge_pbottom)**2
                  ! damp deviations from the zonal mean
                  udt(:,:,k) = udt(:,:,k) + vfactr(:,:)*(u(:,:,k)-ubars)
                  vdt(:,:,k) = vdt(:,:,k) + vfactr(:,:)*(v(:,:,k)-vbars)
               endwhere
            
            endif
            
         endif
         ! epg - end, stratospheric sponge ------------------------------------
      enddo

      if (present(mask)) then
          udt = udt * mask
          vdt = vdt * mask
      endif

!-----------------------------------------------------------------------

 end subroutine rayleigh_damping

!#######################################################################

 subroutine tracer_source_sink ( flux, damp, p_half, r, rdt, kbot )

!-----------------------------------------------------------------------
      real, intent(in)  :: flux, damp, p_half(:,:,:), r(:,:,:)
      real, intent(out) :: rdt(:,:,:)
   integer, intent(in), optional :: kbot(:,:)
!-----------------------------------------------------------------------
      real, dimension(size(r,1),size(r,2),size(r,3)) :: source, sink
      real, dimension(size(r,1),size(r,2))           :: pmass

      integer :: i, j, kb
      real    :: rdamp
!-----------------------------------------------------------------------

      rdamp = damp
      if (rdamp < 0.) rdamp = -86400.*rdamp   ! convert days to seconds
      if (rdamp > 0.) rdamp = 1./rdamp

!------------ simple surface source and global sink --------------------

      source(:,:,:)=0.0

   if (present(kbot)) then
      do j=1,size(r,2)
      do i=1,size(r,1)
         kb = kbot(i,j)
         pmass (i,j)    = p_half(i,j,kb+1) - p_half(i,j,kb)
         source(i,j,kb) = flux/pmass(i,j)
      enddo
      enddo
   else
         kb = size(r,3)
         pmass (:,:)    = p_half(:,:,kb+1) - p_half(:,:,kb)
         source(:,:,kb) = flux/pmass(:,:)
   endif

     sink(:,:,:) = rdamp*r(:,:,:)
     rdt(:,:,:) = source(:,:,:)-sink(:,:,:)

!-----------------------------------------------------------------------

 end subroutine tracer_source_sink

!#######################################################################

end module hs_forcing_mod
