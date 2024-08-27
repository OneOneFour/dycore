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
module atmosphere_mod

use                  fms_mod, only: set_domain, write_version_number, &
                                    mpp_pe, mpp_root_pe, error_mesg, FATAL

use            constants_mod, only: grav, pi

use           transforms_mod, only: trans_grid_to_spherical, trans_spherical_to_grid, &
                                    get_deg_lat, get_grid_boundaries, grid_domain,    &
                                    spectral_domain, get_grid_domain

use         time_manager_mod, only: time_type, set_time, get_time, &
                                    operator( + ), operator( - ), operator( < )

use     press_and_geopot_mod, only: compute_pressures_and_heights

use    spectral_dynamics_mod, only: spectral_dynamics_init, spectral_dynamics, spectral_dynamics_end, &
                                    get_num_levels, complete_init_of_tracers, get_axis_id, spectral_diagnostics, &
                                    complete_robert_filter, get_reference_sea_level_press

use          tracer_type_mod, only: tracer_type

use           hs_forcing_mod, only: hs_forcing_init, hs_forcing

use      cg_drag_king_mod, only:  cg_drag_king_init, cg_drag_king_calc, cg_drag_king_end

use        field_manager_mod, only: MODEL_ATMOS

use       tracer_manager_mod, only: get_number_tracers

implicit none
private
!=================================================================================================================================

character(len=128) :: version= &
'$Id: atmosphere.f90,v 10.0 2003/10/27 23:31:04 arl Exp $'
      
character(len=128) :: tagname= &
'$Name:  $'
character(len=10), parameter :: mod_name='atmosphere'

!=================================================================================================================================

public :: atmosphere_init, atmosphere, atmosphere_end

!=================================================================================================================================

integer, parameter :: num_time_levels = 2
integer :: is, ie, js, je, num_levels, num_tracers, nhum
logical :: dry_model
real, allocatable,dimension(:) :: lon_boundaries, lat_boundaries
real, pointer, dimension(:,:,:) :: p_half => NULL(), p_full => NULL()
real, pointer, dimension(:,:,:) :: z_half => NULL(), z_full => NULL()

type(tracer_type), allocatable, dimension(:) :: tracer_attributes
real,    pointer, dimension(:,:,:,:,:) :: grid_tracers => NULL()
real,    pointer, dimension(:,:,:    ) :: psg => NULL(), wg_full => NULL()
real,    pointer, dimension(:,:,:,:  ) :: ug => NULL(), vg => NULL(), tg => NULL()

real, allocatable, dimension(:,:    ) :: dt_psg
real, allocatable, dimension(:,:,:  ) :: dt_ug, dt_vg, dt_tg
real,allocatable,dimension(:,:,:) :: gwfc_x,gwfc_y
real, allocatable, dimension(:,:,:,:) :: dt_tracers

real, allocatable, dimension(:)   :: deg_lat, rad_lat
real, allocatable, dimension(:,:) :: rad_lat_2d

integer :: previous, current, future
logical :: module_is_initialized =.false.
character(len=4) :: ch_tmp1, ch_tmp2

integer         :: dt_integer
real            :: dt_real
real            :: timespinup
type(time_type) :: Time_step

integer, dimension(4) :: axis_id

!=================================================================================================================================
contains
!=================================================================================================================================

subroutine atmosphere_init(Time_init, Time, Time_step_in)

type (time_type), intent(in)  :: Time_init, Time, Time_step_in
real, allocatable,dimension(:) :: pref ! p_full levels + plus psg level for cg_drag_king
real :: sea_level_pressure
integer :: seconds, days
integer :: j, ierr, io
character(len=4) :: char_tmp1, char_tmp2

if(module_is_initialized) return

call write_version_number(version, tagname)

Time_step = Time_step_in
call get_time(Time_step, seconds, days)
dt_integer   = 86400*days + seconds
dt_real      = float(dt_integer)

call get_number_tracers(MODEL_ATMOS, num_prog=num_tracers)
allocate (tracer_attributes(num_tracers))

call spectral_dynamics_init(Time, Time_step, previous, current, ug, vg, tg, psg, wg_full, tracer_attributes, &
                            grid_tracers, z_full, z_half, p_full, p_half, dry_model, nhum)

call get_grid_domain(is, ie, js, je)
call get_num_levels(num_levels)


allocate (dt_psg     (is:ie, js:je))
allocate (dt_ug      (is:ie, js:je, num_levels))
allocate (dt_vg      (is:ie, js:je, num_levels))
allocate (dt_tg      (is:ie, js:je, num_levels))
allocate (gwfc_x     (is:ie, js:je, num_levels))
allocate (gwfc_y     (is:ie, js:je, num_levels))
allocate (dt_tracers (is:ie, js:je, num_levels, num_tracers))
allocate(lon_boundaries(ie-is+2), lat_boundaries(je-js+2))
allocate (deg_lat    (       js:je))
allocate (rad_lat    (       js:je))
allocate (rad_lat_2d (is:ie, js:je))

call get_grid_boundaries(lon_boundaries,lat_boundaries)

dt_psg = 0.
dt_ug  = 0.
dt_vg  = 0.
dt_tg  = 0.
dt_tracers = 0.
gwfc_x = 0.
gwfc_y = 0.
!--------------------------------------------------------------------------------------------------------------------------------

call get_deg_lat(deg_lat)
do j=js,je
  rad_lat_2d(:,j) = deg_lat(j)*pi/180.
enddo

call hs_forcing_init(get_axis_id(), Time)

call get_reference_sea_level_press(sea_level_pressure)
allocate (pref(num_levels+1))
pref(1:num_levels) = p_full(1,1,1:num_levels)
pref(num_levels+1) = sea_level_pressure

call cg_drag_king_init(lon_boundaries,lat_boundaries,pref,Time,get_axis_id()) ! TODO: this 
call complete_init_of_tracers(tracer_attributes, previous, current, grid_tracers)

module_is_initialized = .true.

return
end subroutine atmosphere_init

!=================================================================================================================================

subroutine atmosphere(Time,timespinup)
    type(time_type), intent(in) :: Time

    real    :: delta_t, timespinup
    integer :: seconds, days, ntr
    type(time_type) :: Time_prev, Time_next

    if(.not.module_is_initialized) then
    call error_mesg('atmosphere','atmosphere module is not initialized',FATAL)
    endif


    dt_ug  = 0.0
    dt_vg  = 0.0
    dt_tg  = 0.0
    dt_psg = 0.0
    dt_tracers = 0.0

    gwfc_x = 0.0
    gwfc_y = 0.0

    if(current == previous) then
    delta_t = dt_real
    else
    delta_t = 2*dt_real
    endif
    call hs_forcing(1, ie-is+1, 1, je-js+1, delta_t, Time, rad_lat_2d(:,:),         &
                    p_half(:,:,:         ),       p_full(:,:,:           ), &
                        ug(:,:,:,previous),           vg(:,:,:,previous  ), &
                        tg(:,:,:,previous), grid_tracers(:,:,:,previous,:), &
                        ug(:,:,:,previous),           vg(:,:,:,previous  ), &
                        tg(:,:,:,previous), grid_tracers(:,:,:,previous,:), &
                    dt_ug(:,:,:         ),        dt_vg(:,:,:           ), &
                    dt_tg(:,:,:         ),   dt_tracers(:,:,:,:))

    
    
    call cg_drag_king_calc(1,1,rad_lat_2d(:,:),p_full(:,:,:),z_full(:,:,:),&
                            tg(:,:,:,previous),ug(:,:,:,previous),vg(:,:,:,previous),&
                            Time,delta_t,gwfc_x(:,:,:),gwfc_y(:,:,:))
    
    dt_ug = dt_ug + gwfc_x
    dt_vg = dt_vg + gwfc_y
    
    Time_next = Time + Time_step
    timespinup=timespinup+dt_real
    if(previous == current) then
        future = num_time_levels + 1 - current
        Time_prev = Time
    else
        future = previous
        Time_prev = Time - Time_step
    endif



    call spectral_dynamics(Time_prev, Time, Time_next, psg, ug, vg, tg, tracer_attributes, grid_tracers, &
                        previous, current, future, &
                        dt_psg, dt_ug, dt_vg, dt_tg, dt_tracers, wg_full, p_full, p_half, z_full,timespinup)

    if(dry_model) then
        call compute_pressures_and_heights(tg(:,:,:,future), psg(:,:,future), z_full, z_half, p_full, p_half)
    else
        call compute_pressures_and_heights( &
        tg(:,:,:,future), psg(:,:,future), z_full, z_half, p_full, p_half, grid_tracers(:,:,:,future,nhum))
    endif
    call complete_robert_filter(current, future, tracer_attributes, grid_tracers)

    call spectral_diagnostics(Time_next, psg(:,:,future), ug(:,:,:,future), vg(:,:,:,future), &
                            tg(:,:,:,future), wg_full, grid_tracers(:,:,:,future,:))

    previous = current
    current  = future

    return
end subroutine atmosphere

!=================================================================================================================================

subroutine atmosphere_end

if(.not.module_is_initialized) return

deallocate (dt_psg, dt_ug, dt_vg, dt_tg, dt_tracers)
deallocate (deg_lat, rad_lat, rad_lat_2d)
call cg_drag_king_end
!call hs_forcing_end
call spectral_dynamics_end(previous, current, ug, vg, tg, psg, wg_full, tracer_attributes, &
                           grid_tracers, z_full, z_half, p_full, p_half)
deallocate (tracer_attributes)

module_is_initialized = .false.

end subroutine atmosphere_end

!=================================================================================================================================

end module atmosphere_mod
