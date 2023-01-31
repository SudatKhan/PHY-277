!Name: Sudat Khan
!Purpose: process an arbitrarily large set of real data from a file, and compute the arithmetic mean, the standard deviation, and the median of the set of data
program homework9
    implicit none
    
    !Declare variables
    real :: x !Placeholder variable to read all the lines in the datafile before array gets allocated
    integer :: lun1 !holds LUN to read entered file
    integer :: n = 0  !number of elements in array
    integer :: lun2 !holds second LUN to write to entered file
    real, allocatable :: a(:) !defining allocatable array 
    integer :: i !Loop index
    integer :: j !Second Loop index
    integer :: ierror !I/O error status when opening/reading first file
    integer :: ierror2 !I/O error status when opening/writing to second file
    character(len=:), allocatable :: fname !defines allocatable character
    character(len=256) :: buffer !holds file name
    real :: sum = 0.0 !sum of all data points
    real :: avg !average of all data points
    real :: diff_of_avg_squared = 0.0 !holds inner numerator of standard deviation formula
    real :: std !standard deviation
    real :: temp !temporary variable to hold jth-index of array a
    integer :: temp_1 !temporary variable to hold ith-index of array a

    write(*,*) "Enter file name" 
    read(*,*) buffer
    fname = trim(buffer) !Trim the blank spaces at the end of buffer variable

    open(newunit=lun1, file= fname, status="OLD", action = "READ", iostat = ierror) !Open File for reading 
    if (ierror /= 0) then !checks for errors encountered when opening file
        write(*,*) "Cannot open file, please try again"
        stop 1
    endif

    do while (ierror == 0)  
        read(lun1,*, iostat = ierror) x !While the file is readable, placeholder variable reads through all the lines of data
        if (ierror /= 0) then !Stops reading when end of file is reached
            exit
        else
            n = n + 1
        endif
    enddo

    allocate(a(n)) !allocated array a to have extent n
    rewind(lun1) !rewinds file reading to the beginning

    do i=1,n,1 !iterative loop that assigns each data point as an entry in array a
        read(lun1,*,iostat=ierror) a(i)
        if (ierror /= 0) then
            write(*,*) "Could not read, please try again"
            close(unit=lun1)
            stop 2
        endif
    enddo

    close(lun1) !closes first file
  
    write(*,*) "Enter file name" 
    read(*,*) buffer
    fname = trim(buffer)

    open(newunit=lun2, file= fname, status="NEW", action = "WRITE", iostat = ierror2) !Open File for writing 
    if (ierror2 /= 0) then !checks for errors encountered when opening file
        write(*,*) "Cannot open file, please try again"
        stop 3
    endif

    write(lun2,*) "Number of data points in file: ",n 

    do i=1,n,1 !iterative do loop that computes average by first adding the succeding entry of array a to sum of the previous entries. and then dividing this by number of total data points
        sum = sum + a(i)
    enddo
    avg = sum / n
    write(lun2,*) "Average of the data set: ",avg

    do i=1,n,1 !iterative do loop to find standard deviation
        diff_of_avg_squared = diff_of_avg_squared + ((a(i) - avg) ** 2) !iteration fo only the summation found in the numerator of the standard deviation equation
    enddo
    std = sqrt(diff_of_avg_squared / n)
    write(lun2,*) "The standard deviation of the data set: ",std


    do i=1,n,1 !Selection sort algorithm to sort array a from lowest to largest number
        temp = a(i)
        temp_1 = i
        do j=i+1,n,1
            if (a(j) < temp) then
                temp = a(j)
                temp_1=j
            endif
        enddo
        a(temp_1) = a(i)
        a(i)= temp
    enddo
    write(lun2,*) "The sorted array: ",a
    
    if (mod(n, 2) /= 0) then !if block to calculate the median of sorted array
        write(lun2,*) "The median of the data set: ",a(n/2 + 1)
    else
        write(lun2,*) "The median of the data set: ",a(n/2) + a(n/2 + 1) / 2.0
    endif

    close(lun2) !closes second file
    deallocate(a) !deallocates array a
stop 0
end program homework9