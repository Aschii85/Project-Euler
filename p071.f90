program farey_neighbour
    implicit none
    real, parameter :: a = 3.0
    real, parameter :: b = 7.0
    integer, parameter :: n = 1000000
    integer :: d
    real :: c, c_res, res_float, d_res

    res_float = 0
    do d = 1, n 
        c = - (1 - a * d) / b
        if (nint(c) == c) then
            if ((c/d < a/b) .and. (res_float < c/d)) then
                c_res = c
                d_res = d
            end if 
        end if 
    end do

    write(*,fmt='(a,2x,f7.0,a,f7.0)') 'Farey Neighbour: ', c_res, '/', d_res

end program farey_neighbour