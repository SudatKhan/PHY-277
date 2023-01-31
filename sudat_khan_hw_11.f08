!Name: Sudat Khan
! n = 10, 284.80306713941724 
! n = 100, 902.79905142404664 
! n = 1000, 993.63149955538643
!Compared to HW 8, the values are slightly different and thus converged to a slightly different value of 993.63149955538643 versus 993.721680

subroutine limits(w, x, y, z) !subroutine to find limits and delta_x value
    implicit none
    integer, intent(in) :: w !Number of subintervals
    real(kind=kind(1.0d0)), intent(in) :: x, y !lower and upper bounds of integral
    real(kind=kind(1.0d0)), intent(out) :: z !width of subinterval

    z = (y - x) / (1.0 * w)
    return
end subroutine


program simpson
    implicit none 
    integer :: n !Number of subintervals
    integer :: i !Loop index
    real(kind=kind(1.0d0)), parameter :: a = 4000.0 
    real(kind=kind(1.0d0)), parameter :: b = 15.15
    real(kind=kind(1.0d0)), parameter :: c = 0.01
    real(kind=kind(1.0d0)) :: x_lowerbound = 1.0, x_upperbound = 20.0 !lower and upper bounds of integral
    real(kind=kind(1.0d0)) :: delta_x !width of subinterval
    real(kind=kind(1.0d0)) :: sum !summation value
    real(kind=kind(1.0d0)) :: x_i !hold x value at i-th location
    real(kind=kind(1.0d0)) :: f_i, f_ihalf, f_i2 !value at ith, i+1/2 and i+1 locations

    write(*,*) "Enter the number of subintervals"   
    read(*,*) n

    call limits(n, x_lowerbound, x_upperbound, delta_x)

    sum = 0.0 
    x_i = x_lowerbound
    do i = 1,n,1
        f_i = integrand1(x_i)
        f_ihalf = integrand2(x_i, delta_x)
        f_i2 = integrand3(x_i, delta_x)
        sum = sum + (1.0/6.0) * (f_i + (4.0*(f_ihalf)) + f_i2) *delta_x
        x_i = x_i + delta_x
    enddo

    write(*,*) sum
    
contains

real(kind=kind(1.0d0)) function integrand1(x) 
    implicit none
    real(kind=kind(1.0d0)), intent(in) :: x
    real(kind=kind(1.0d0)), parameter :: a = 4000.0, b =15.15, c = 0.01

    integrand1 = (x + cos(x)) * exp(cos(x)) + a * exp((-(x - b)**2)/c)
    return
end function integrand1

real(kind=kind(1.0d0)) function integrand2(x, z)
    implicit none
    real(kind=kind(1.0d0)), intent(in) :: x, z
    real(kind=kind(1.0d0)), parameter :: a = 4000.0, b =15.15, c = 0.01

    integrand2 = ((x + (0.5*z)) + cos(x + (0.5 *z))) * exp(cos(x + (0.5*z))) + a * exp(-(x - b)**2 / c)
    return
end function integrand2

real(kind=kind(1.0d0)) function integrand3(x, z)
    implicit none
    real(kind=kind(1.0d0)), intent(in) :: x, z
    real(kind=kind(1.0d0)), parameter :: a = 4000.0, b =15.15, c = 0.01

    integrand3 = ((x + z) + cos(x + z)) * exp(cos(x + z)) + a * exp((-((x+z) - b)**2)/c)
    return
end function integrand3

end program simpson
