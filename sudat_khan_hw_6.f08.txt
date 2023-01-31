!Name: Sudat Khan
!The purpose of this assignment is to write a program that computes the range and bearing to a zombie target from a human ship so that the zombie target can be destroyed.

program zombie
    implicit none
    !variable dictionary
    real, parameter :: PI = 3.141592653589793238 !PI is a constant
    real :: x_coordinate !x value of the position of the zombie
    real :: y_coordinate !y value of the position of the zombie
    real :: range !range from the ship to zombie in km
    real :: bearing !angle in degrees

    write(*,*) "Enter the x-coordinate of the zombie position in kilometers"
    read(*,*) x_coordinate
    write(*,*) "Enter the y_coordinate of the zombie position in kilometers"
    read(*,*) y_coordinate

    range= sqrt((x_coordinate ** 2) + (y_coordinate ** 2)) 

    if (x_coordinate >= 0.0 .and. y_coordinate >= 0.0) then
        write(*,*) "The distance from the ship in kilometers is:", range
        bearing = (atan(x_coordinate / y_coordinate)) * (180.0 / PI)
        write(*,*) "The bearing in degrees is NE:", bearing
    else
        if (x_coordinate < 0.0 .and. y_coordinate >= 0.0) then
            write(*,*) "The distance from the ship in kilometers is:", range
            bearing = (360.0) + ((atan(x_coordinate / y_coordinate)) * (180.0 / PI))
            write(*,*) "The bearing in degrees is in NW:", bearing
        else
            if (x_coordinate < 0.0 .and. y_coordinate < 0.0) then
                write(*,*) "The distance from the ship in kilometers is:", range
                bearing = (270.0) - ((atan(x_coordinate / y_coordinate)) * (180.0 / PI))
                write(*,*) "The bearing in degrees is in SW:", bearing
            else
                write(*,*) "The distance from the ship in kilometers is:", range
                bearing = (90.0) - ((atan(x_coordinate / y_coordinate)) * (180.0 / PI))
                write(*,*) "The bearing in degrees is in SE:", bearing
            endif
        endif    
    endif

stop 0
end program zombie