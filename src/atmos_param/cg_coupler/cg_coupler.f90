module cg_coupler_mod
    use fms_mod, only: error_mesg,FATAL,file_exist,open_namelist_file,check_nml_error,close_file
    use time_manager_mod, only: time_type
    use cg_drag_king_mod, only: cg_drag_king_init,cg_drag_king_calc,cg_drag_king_end
    use cg_drag_ref_mod, only: cg_drag_ref_init,cg_drag_ref_calc,cg_drag_ref_end
    use transforms_mod, only: get_grid_boundaries,get_grid_domain
    use spectral_dynamics_mod, only: get_reference_sea_level_press,get_num_levels
    use press_and_geopot_mod, only: pressure_variables

    !! Coupler for Gravity wave methods. Allows hot switching between cg_drag_ref and cg_drag_king
    implicit none
    public cg_coupler_init,cg_coupler_calc,cg_coupler_end

    character(len=12)::mod_name = 'cg_coupler'

    logical :: do_ref_cg = .false.
    logical :: do_king_cg = .true.
    logical :: module_is_initialized = .false.

    namelist /cg_coupler_nml/&
        do_ref_cg,do_king_cg

    contains 

    subroutine cg_coupler_init( Time, axes)
        type(time_type), intent(in):: Time 
        integer, dimension(4), intent(in) :: axes
        integer :: is,js,ie,je
        integer :: ierr,io,unit
        integer :: num_levels
        real :: sea_level_pressure

        real,allocatable,dimension(:) :: p_half_1d,p_full_1d,ln_pfull_1d,ln_phalf_1d
        real, allocatable,dimension(:) :: lonb, latb
        real,allocatable,dimension(:) :: pref

        call get_num_levels(num_levels)

        if (file_exist('input.nml')) then
            unit = open_namelist_file()
            ierr = 1
            do while(ierr /= 0)
                read(unit,nml=cg_coupler_nml,iostat=io,end=10)
                ierr = check_nml_error(io,'cg_coupler_nml')
            enddo
10          call close_file(unit)
        endif

        !! check if both methods are requested?  
        if (do_king_cg .and. do_king_cg) then
            call error_mesg(mod_name,'Both do_ref_cg and do_king_cg are set to true. Only one can be true at a time',FATAL)
        end if

        !! Calculate Boundaries
        call get_grid_domain(is, ie, js, je)
        allocate(lonb(ie-is+2), latb(je-js+2))
        call get_grid_boundaries(lonb,latb)


        !! Calculate Reference Pressure
        call get_reference_sea_level_press(sea_level_pressure)
        allocate(p_half_1d(num_levels))
        allocate(p_full_1d(num_levels))
        allocate(ln_pfull_1d(num_levels))
        allocate(ln_phalf_1d(num_levels))
        call pressure_variables(p_half_1d,ln_pfull_1d,p_full_1d,ln_pfull_1d, sea_level_pressure)
        allocate (pref(num_levels+1))
        pref(1:num_levels) = p_full_1d(1:num_levels)
        pref(num_levels+1) = sea_level_pressure

        if (do_king_cg) then
            call cg_drag_king_init(lonb,latb,pref,Time,axes)
        endif 
        if (do_ref_cg) then
            call cg_drag_ref_init(lonb,latb,pref,Time,axes)
        endif 

        module_is_initialized = .true.

    end subroutine cg_coupler_init

    subroutine cg_coupler_calc(is, js, lat, pfull, zfull, temp, uuu, vvv,  &
        Time, delt, gwfcng_x, gwfcng_y)

        integer, intent(in) :: is, js
        real, dimension(:,:), intent(in) :: lat
        real, dimension(:,:,:), intent(in) :: pfull,zfull, temp,uuu,vvv
        type(time_type), intent(in) :: Time
        real, intent(in) :: delt

        real, dimension(:,:,:),intent(out) :: gwfcng_x,gwfcng_y

        if(.not.module_is_initialized) then
            call error_mesg(mod_name,'Gravity wave param coupler not initialized!',FATAL)
        end if

        if (do_king_cg) then
            call cg_drag_king_calc(is,js,lat,pfull,zfull,temp,uuu,vvv,Time,delt,gwfcng_x,gwfcng_y)
            return
        endif 
        if (do_ref_cg) then
            call cg_drag_ref_calc(is,js,lat,pfull,zfull,temp,uuu,vvv,Time,delt,gwfcng_x,gwfcng_y)
            return
        endif
    end subroutine cg_coupler_calc


    subroutine cg_coupler_end()
        if(do_king_cg) then
            call cg_drag_king_end()
        endif 
        if(do_ref_cg) then
            call cg_drag_ref_end() 
        endif
        module_is_initialized = .false.
    end subroutine cg_coupler_end
    
end module cg_coupler_mod