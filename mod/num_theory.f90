module num_theory
    implicit none

contains

    ! Finding the greated common divisor of two integers
    function gcd(a_in, b_in) result(b)
        integer, intent(in) :: a_in, b_in
        integer :: a, b, c, r
        intrinsic :: abs, mod

        a = a_in
        b = b_in
        if (abs(a) < abs(b)) then
            c = a 
            a = b
            b = c
        end if

        r = mod(a, b)
        do while (r /= 0)
            c = b
            b = r
            a = c
            r = mod(a, b)
        end do
    end function gcd

    ! Eratosthenes Sieve which lists primes up to n
    subroutine eratosthenes_sieve(n, primes)
        integer, intent(in) :: n
        integer, dimension(:), allocatable, intent(inout) :: primes 
        logical, dimension(2:n) :: ints
        integer :: i, j, k
        integer :: n_primes = 0

        ints(:) = .true.
        create_bool_array: do i = 2, n
            if (ints(i) .eqv. .true.) then
                j = 2
                do while (i * j <= n)
                    ints(i*j) = .false.
                    j = j + 1
                end do
            end if
        end do create_bool_array

        count_primes: do i = 2, n 
            if (ints(i) .eqv. .true.) then
                n_primes = n_primes + 1
            end if
        end do count_primes
        
        allocate(primes(n_primes))
        k = 1
        do i = 2, n 
            if (ints(i) .eqv. .true.) then
                primes(k) = i
                k = k + 1
            end if
        end do
    end subroutine eratosthenes_sieve
    
    ! Euler totient function implementation, which counts numbers up to n that are relative prime to n
    pure function euler_totient(n_in) result(res)
        integer(kind=16), intent(in) :: n_in
        integer(kind=16) :: res, i, n
        intrinsic :: abs, mod

        n = n_in
        res = n 
        i = 2
        do while (i ** 2 <= n)
            if (mod(n,i) == 0) then
                do while (mod(n,i) == 0)
                    n = n / i
                end do
                res = res - res/i
            end if
            i = i + 1
        end do

        if (n > 1) then
            res = res - res/n
        end if

    end function euler_totient

    ! Function to check if a real value is an integer
    function is_integer(r, err) result(res)
        real, intent(in) :: r
        logical :: res
        real, optional :: err
        real :: err_local 
        
        ! NOTE: if the optional err is not inputted we need to have one that do exist or we get a segmentation error
        ! Check if optional input is present and define then err_local
        if ( present(err) ) then
            err_local = err
        else
            err_local = 2 * epsilon(r) ! twice the smallest value r can take on
        end if

        if ( abs(nint(r) - r) <= err_local) then
            res = .true.
        else
            res = .false.
        end if

    end function

end module num_theory