program goldbach
    use num_theory
    implicit none

    integer, parameter :: primes_max = 1000000

    integer, dimension(:), allocatable :: primes
    integer :: n, i, primeslen

    call eratosthenes_sieve(primes_max, primes)
    ! write(*,*) primes
    primeslen = size(primes)

    check_conjecture: do n = 9 , primes_max + 1 , 2
        if ( .not. (any(n == primes))) then ! check if it is not a prime
            do i = 1 , primeslen
                if ( is_integer(sqrt(real(n-primes(i))/2)) ) then ! this line test if the sqrt is an integer as it should be
                    ! write(*,*) "Conjecture holds for", n
                    cycle check_conjecture
                end if
            end do
            write(*,*) "Conjecture does not hold for", n
            exit check_conjecture
        end if
    end do check_conjecture

end program goldbach