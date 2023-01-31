program wavelength
    implicit none

    real, parameter :: R = 1.09677583e+7
    integer :: n_1
    integer :: n_2
    real :: lambda_in_meters

    write(*,*) "Enter first quantum number:"
    read(*,*) n_1

    write(*,*) "Enter second quantum number:"
    read(*,*) n_2

    lambda_in_meters = 1.0 / (R * ((1.0/(n_2)**(2) - (1.0/(n_1)**(2)))))

    write(*,*) "Wavelength of photon (in meters) =",lambda_in_meters
    write(*,*) "Wavelength of photon (in Angstroms) =", (1.0e+10 ) * lambda_in_meters
    stop 0
end program wavelength
