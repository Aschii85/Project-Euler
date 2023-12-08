program totient_maximum
    use num_theory
    implicit none
    

    integer(kind=16), parameter :: n_lim = 1000000
    integer(kind=16) :: n, n_max
    real(kind=16) :: max_val, val

    max_val = 0
    do n = 1, n_lim
        val =  real( n ) / real( euler_totient(n) )
        if (val > max_val) then
            max_val = val
            n_max = n
        end if
    end do

    write(*,*) n_max

end program totient_maximum