program counting_fractions_in_range
    use num_theory
    implicit none

    integer, parameter :: d_max = 12000
    integer :: number_fractions
    integer :: n, d

    do d = 1 , d_max
        do n = 1 , d - 1
            if ((gcd(d, n) == 1) .and. (3 * n > d) .and. (2 * n < d)) then
                number_fractions = number_fractions + 1
            end if
        end do
        if (mod(d, 1000) == 0) then
            write(*,fmt="(a,x,i7,a)") "Completed", d, "!"
        end if
    end do

    write(*,*) "Number of reduced proper fractions" , number_fractions

end program counting_fractions_in_range