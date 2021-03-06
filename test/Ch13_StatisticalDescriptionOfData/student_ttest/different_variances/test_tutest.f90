program test_tutest
   ! COMPILATION:
   ! gfortran -c avevar.f90 betacf.f90 gammaln.f90 betai.f90 tutest.f90 test_tutest.f90
   ! gfortran avevar.o betacf.o gammaln.o betai.o tutest.o test_tutest.0 -o ftest_tutest
   use mod_tutest
   implicit none
   character(len = 100)                :: x
   real(8)                             :: y, t, prob
   integer                             :: i, j, n1, n2
   real(8), dimension(:), allocatable  :: data1, data2

   ! 1st array
   ! Get 1st argument, which contains the length
   call getarg(1, x)
   read(x, '(i100)') n1
 
   ! Captures the next n1 arguments, containing the array
   allocate(data1(n1))

   j = 1
   do i = 2, n1 + 1
      call getarg(i, x)
      read(x, '(f10.0)') y
      data1(j) = y
      j = j + 1
   end do

   ! 2nd array
   ! Get (n1 + 2)th argument, which contains the length
   call getarg(n1 + 2, x)
   read(x, '(i100)') n2   

   ! Captures the next n2 arguments, containing the array
   allocate(data2(n2))

   j = 1
   do i = n1 + 3, n1 + 2 + n2
      call getarg(i, x)
      read(x, '(f10.0)') y
      data2(j) = y
      j = j + 1
   end do

   ! Call the subroutine
   call tutest(data1, n1, data2, n2, t, prob)
   
   ! Output to stdout
   write(*, *) t, prob
   
   deallocate(data1)
   deallocate(data2)

end program test_tutest
