program names_scores
    implicit none

    character(len=*), parameter :: ucl = "ABCDEFGHIJKLMNOPQGRSTUVXYZ"
    integer(kind=16) :: score
    character(len=:), allocatable :: x, y, z

    ! open the file for reading
    open(1, file="supplement/p022.txt", status="old")
        read(1,*) x
        print*, x
    close(1)
end program names_scores