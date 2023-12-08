program counting_fractions
    use num_theory
    implicit none

    integer, parameter :: d_max = 1000000
    integer(kind=16) :: number_fractions, n, n_max


    n_max = 1000000
    number_fractions = 0
    do n = 2, n_max
        number_fractions = number_fractions + euler_totient(n)
    end do
    

    write(*,*) "Number of reduced proper fractions" , number_fractions

    contains

    recursive function F(n) result(res)
        integer(kind=16), intent(in) :: n
        integer(kind=16) :: res

        if (n == 1) then
            res = 0
        else
            res = F(n - 1) + euler_totient(n)
        end if

    end function F
    

end program counting_fractions