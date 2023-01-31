!Name: Sudat Khan

!The two kinetic energies do not match and this is because for velocities that are a factor less than e+6, the value of lambda will be 0.99999 (etc.) which would be rounded to 1 because of how floating point data types in fortran round numbers that have infinite bit size. For velocites that are greater than a factor of e+6, the kinetic energies differ because of the physical explanation of relativity.

program relativity
    implicit none
    !variables and their data type is declared
    real :: m
    real :: v
    real :: c = 2.99792458e+8
    real :: lambda
    real :: t_nr
    real :: t_r

    write(*,*) "Enter mass:" !The user inputs the mass 
    read(*,*) m !reads the mass as a real number (floating-point data type)
    write(*,*) "Enter velocity:" !The user inputs the magnitude of the velocity
    read(*,*) v !reads the magnitude of the velocity as a real number (floating-point data type)
    
    lambda = 1.0 / sqrt(1.0 - (v**(2))/(c**(2))) !this calculates the lambda constant
    t_nr = (1.0/2.0)*m*v**(2) !calculates the non-relativistic kinetic energy
    t_r = m*(c**(2))*(lambda - 1.0) !calculates the relativistic kineticenergy

    write(*,*) "The non-relativistic kinetic energy=",t_nr !displays the non-relativisitic energy on the terminal
    write(*,*) "The relativistic kinetic energy=",t_r !displays the relativisitic energy on the terminal
    stop 0
end program relativity
