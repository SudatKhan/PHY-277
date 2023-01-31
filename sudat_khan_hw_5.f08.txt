!NAME: Sudat Khan
program if_function
  implicit none
  !Variable Dictionary
  real :: x !The x-value of the respective function
  real :: y !The y-value of the respective function
  real :: ans_1 !The first function respective to the first domain restriction
  real :: ans_2 !The second function respective to the second domain restriction
  real :: ans_3 !The third function respective to the third domain restriction

  write(*,*) "Enter x-value:" !Assigns the entered value to the x variable
  read(*,*) x
  write(*,*) "Enter y-value:" !Assigns the entered value to the y variable
  read(*,*) y

  ans_1 = -1.0 + x**2 + y**2
  ans_2 = exp(x**2 + y**2 - 1.0) - 1.0
  ans_3 = exp(1.0) - 1.0 + sin(x**2 + y**2 - 2.0)

  !The following if statements are use so the correct function can be used to calculate a final value given a certain domain restriction is met
  if (x**2 + y**2 < 1.0) then
     write(*,*) "The answer is:",ans_1
  elseif (x**2 + y**2 >= 1.0 .and. x**2 + y**2 < 2.0) then
     write(*,*) "The answer is:",ans_2
  else
     write(*,*) "The answer is:",ans_3
  endif

  stop 0
end program if_function
