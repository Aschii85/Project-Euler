module ackermann
    implicit none

contains

    recursive function ack(m, n) result(a)
        integer, intent(in) :: m,n
        integer :: a
        if (m == 0) then
            a=n+1
        else if (n == 0) then
            a=ack(m-1,1)
        else
            a=ack(m-1, ack(m, n-1))
        end if
    end function ack

end module ackermann

program ackermann_function
    use ackermann
    implicit none
    
    integer, parameter :: n_max = 6
    integer :: n, ack_sum
    
    do n = 1, n_max
        write(*,*) ack(n,n)
    end do

end program ackermann_function