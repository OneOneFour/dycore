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
module spectral_damping_mod

use        fms_mod, only: mpp_pe, mpp_root_pe, error_mesg, FATAL, &
                          write_version_number

use transforms_mod, only: get_eigen_laplacian, get_spec_domain

implicit none

private

interface compute_spectral_damping
   module procedure  compute_spectral_damping_2d, compute_spectral_damping_3d 
end interface

real, allocatable, dimension(:,:) :: damping, damping_vor, damping_div, damping_eddy_sponge
real, allocatable, dimension(:)   :: damping_zmu_sponge, damping_zmv_sponge
logical :: module_is_initialized = .false.
integer :: ms, me, ns, ne, num_levels

character(len=128), parameter :: version = '$Id: spectral_damping.f90,v 10.0 2003/10/27 23:31:04 arl Exp $'
character(len=128), parameter :: tagname = '$Name:  $'

public :: spectral_damping_init, spectral_damping_end, compute_spectral_damping
public :: compute_spectral_damping_vor, compute_spectral_damping_div

contains
!----------------------------------------------------------------------------------------------------------------
subroutine spectral_damping_init (damping_coeff, damping_order, damping_option, num_fourier, num_spherical, &
                                  num_levels_in, eddy_sponge_coeff, zmu_sponge_coeff, zmv_sponge_coeff,     &
                                  damping_coeff_vor, damping_order_vor, damping_coeff_div, damping_order_div)

real,    intent(in) :: damping_coeff
integer, intent(in) :: damping_order, num_fourier, num_spherical, num_levels_in
real,    intent(in) :: eddy_sponge_coeff, zmu_sponge_coeff, zmv_sponge_coeff
character(len=*), intent(in) :: damping_option
real,    intent(in), optional :: damping_coeff_vor, damping_coeff_div
integer, intent(in), optional :: damping_order_vor, damping_order_div

real    :: damping_coeff_vor_local, damping_coeff_div_local
integer :: damping_order_vor_local, damping_order_div_local
real, dimension(0:num_fourier, 0:num_spherical) :: eigen
character(len=8) :: ch_tmp

if(module_is_initialized) return

call write_version_number(version, tagname)
num_levels = num_levels_in

call get_spec_domain(ms, me, ns, ne)

allocate(damping_zmu_sponge(0:num_spherical))
allocate(damping_zmv_sponge(0:num_spherical))
allocate(damping_eddy_sponge(0:num_fourier, 0:num_spherical))
allocate(damping    (0:num_fourier, 0:num_spherical))
allocate(damping_vor(0:num_fourier, 0:num_spherical))
allocate(damping_div(0:num_fourier, 0:num_spherical))

call get_eigen_laplacian(eigen)

if(present(damping_coeff_vor)) then
  damping_coeff_vor_local = damping_coeff_vor
else
  damping_coeff_vor_local = damping_coeff
endif

if(present(damping_coeff_div)) then
  damping_coeff_div_local = damping_coeff_div
else
  damping_coeff_div_local = damping_coeff
endif

if(present(damping_order_vor)) then
  damping_order_vor_local = damping_order_vor
else
  damping_order_vor_local = damping_order
endif

if(present(damping_order_div)) then
  damping_order_div_local = damping_order_div
else
  damping_order_div_local = damping_order
endif

if(trim(damping_option) == 'resolution_dependent') then
  damping    (:,:) = damping_coeff          *((eigen(:,:)/eigen(0,num_spherical-1))**damping_order          )
  damping_vor(:,:) = damping_coeff_vor_local*((eigen(:,:)/eigen(0,num_spherical-1))**damping_order_vor_local)
  damping_div(:,:) = damping_coeff_div_local*((eigen(:,:)/eigen(0,num_spherical-1))**damping_order_div_local)
else if(trim(damping_option) == 'resolution_independent') then
  damping    (:,:) = damping_coeff          *(eigen(:,:)**damping_order          )
  damping_vor(:,:) = damping_coeff_vor_local*(eigen(:,:)**damping_order_vor_local)
  damping_div(:,:) = damping_coeff_div_local*(eigen(:,:)**damping_order_div_local)
else
  call error_mesg('spectral_damping_init','"'//trim(damping_option)//'" is an invalid value for damping_option', FATAL)
end if
damping_zmu_sponge  =  zmu_sponge_coeff!*((eigen(0,:)/eigen(0,num_spherical-1))**damping_order)
damping_zmv_sponge  =  zmv_sponge_coeff!*((eigen(0,:)/eigen(0,num_spherical-1))**damping_order)
damping_eddy_sponge = eddy_sponge_coeff!*((eigen(:,:)/eigen(0,num_spherical-1))**damping_order)

module_is_initialized = .true.

return
end subroutine spectral_damping_init

!-----------------------------------------------------------------
!compute_spectral_damping_3d is local
subroutine compute_spectral_damping_3d(spec, dt_spec, current_dt)  

complex, intent(in), dimension(:,:,:) :: spec
real,    intent(in) :: current_dt
complex, intent(inout), dimension (:,:,:) :: dt_spec

real, dimension(size(spec,1),size(spec,2)) :: coeff

integer :: k

if(.not.module_is_initialized) then
  call error_mesg('compute_spectral_damping','initialization of spectral_damping not performed', FATAL)
end if

coeff = 1.0/(1.0 + damping(ms:me,ns:ne)*current_dt)

do k = 1, size(spec,3)
  dt_spec(:,:,k) =   coeff(:,:) * (dt_spec(:,:,k) - damping(ms:me,ns:ne)*spec(:,:,k))
end do

return
end subroutine compute_spectral_damping_3d
!-----------------------------------------------------------------
subroutine compute_spectral_damping_vor(vor, dt_vor, current_dt)

complex, intent(in), dimension(ms:me, ns:ne, num_levels) :: vor
real,    intent(in) :: current_dt
complex, intent(inout), dimension(ms:me, ns:ne, num_levels) :: dt_vor

real, dimension(ms:me, ns:ne) :: coeff, coef
real, dimension(ns:ne) :: cof

integer :: k, m, n
real, dimension(1:6) :: spf
real :: ind

! spf == sponge factor

if(.not.module_is_initialized) then
  call error_mesg('compute_spectral_damping_vor','initialization of spectral_damping not performed', FATAL)
end if

coeff = 1.0/(1.0 + damping_vor(ms:me,ns:ne)*current_dt)

do k = 1, size(vor,3)
  dt_vor(:,:,k) = coeff * (dt_vor(:,:,k) - damping_vor(ms:me,ns:ne)*vor(:,:,k))
end do

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!                                                                       !!
!!               Apply a sponge to the top 6 layers                      !!
!!      0.0095    0.0331    0.0745    0.1503    0.2784    0.4822 mb      !!
!!                                                                       !!
!!          with the following formula k=k_max*spf --  p_sp=.5mb         !!
!!                                                                       !!
!!            k_sp=.5 day^-1 and spf= ((p_sp-p)/p_sp)^2                  !!
!!   corrected: DD10/10           k_max=2/day                            !!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

spf(1)=0.9625
spf(2)=0.8722
spf(3)=0.7241
spf(4)=0.4892
spf(5)=0.1965
spf(6)=0.0013

!PRINT *,sp_factor(3)

!do n=ns,ne
!  do m=ms,me
    do k=1,6
    if(m /= 0) then
       coef=1./(1. + spf(k)*damping_eddy_sponge(:,:)*current_dt)
      dt_vor(:,:,k) = coef*(dt_vor(:,:,k) - spf(k)*damping_eddy_sponge(:,:)*vor(:,:,k))
!      PRINT *, ind
    endif
    enddo 
!  enddo
!enddo

if(ms == 0) then
!  do n=ns,ne
    do k=1,6 
       cof = 1. /(1. + spf(k)*damping_zmu_sponge(:)*current_dt)
       dt_vor(0,:,k) = cof*(dt_vor(0,:,k) - spf(k)*damping_zmu_sponge(:)*vor(0,:,k))
    enddo
!  enddo
endif

return
end subroutine compute_spectral_damping_vor
!-----------------------------------------------------------------

subroutine compute_spectral_damping_div(div, dt_div, current_dt)
complex, intent(in), dimension(ms:me, ns:ne, num_levels) :: div
real,    intent(in) :: current_dt
complex, intent(inout), dimension (ms:me, ns:ne, num_levels) :: dt_div

real, dimension(ms:me, ns:ne) :: coeff, coef
real, dimension(1:6) :: spf
real, dimension(ns:ne) :: cof


integer :: k, m, n

spf(1)=0.9625
spf(2)=0.8722
spf(3)=0.7241
spf(4)=0.4892
spf(5)=0.1965
spf(6)=0.0013




if(.not.module_is_initialized) then
  call error_mesg('compute_spectral_damping_div','initialization of spectral_damping not performed', FATAL)
end if

coeff = 1.0/(1.0 + damping_div(ms:me,ns:ne)*current_dt)

do k = 1, size(div,3)
  dt_div(:,:,k) = coeff * (dt_div(:,:,k) - damping_div(ms:me,ns:ne)*div(:,:,k))
end do

!do n=ns,ne
!  do m=ms,me
   do k=1,6
     coef=1./(1. + spf(k)*damping_eddy_sponge(:,:)*current_dt)
    if(m /= 0) then
      dt_div(:,:,k) = coef*(dt_div(:,:,k) - spf(k)*damping_eddy_sponge(:,:)*div(:,:,k))
    endif
   enddo
!  enddo
!enddo

if(ms == 0) then
!  do n=ns,ne
   do k=1,6
     cof=1./(1. + spf(k)*damping_zmv_sponge(:)*current_dt)
    dt_div(0,:,k) = cof*(dt_div(0,:,k) - spf(k)*damping_zmv_sponge(:)*div(0,:,k))
   enddo
!  enddo
endif

return
end subroutine compute_spectral_damping_div
!-----------------------------------------------------------------
subroutine compute_spectral_damping_2d(spec, dt_spec, current_dt)  

complex, intent(in), dimension(:,:) :: spec
real, intent(in) :: current_dt
complex, intent(inout), dimension(:,:) :: dt_spec

real, dimension(size(spec,1),size(spec,2)) :: coeff

if(.not.module_is_initialized) then
  call error_mesg('compute_spectral_damping','initialization of spectral_damping not performed', FATAL)
end if

coeff = 1.0/(1.0 + damping(ms:me,ns:ne)*current_dt)
dt_spec = coeff*(dt_spec - damping(ms:me,ns:ne)*spec)

return
end subroutine compute_spectral_damping_2d

!-----------------------------------------------------------------
subroutine spectral_damping_end

if(.not.module_is_initialized) return
deallocate(damping, damping_vor, damping_div)
deallocate(damping_eddy_sponge, damping_zmu_sponge, damping_zmv_sponge)
module_is_initialized = .false.

return
end subroutine spectral_damping_end
!-----------------------------------------------------------------

end module spectral_damping_mod
