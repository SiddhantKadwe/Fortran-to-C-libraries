program create_matrices
    use iso_c_binding
    implicit none

!   Create interfaces for C code
    interface
    subroutine add_matrices(c_Aptr, c_Bptr, c_row, c_col, c_Cptr) bind(c)
        use iso_c_binding
        integer(kind=C_INT), value, intent(in) :: c_row, c_col
        type(C_PTR), intent(inout)             :: c_Aptr, c_Bptr, c_Cptr
    end subroutine add_matrices

    subroutine sub_matrices(c_Aptr, c_Bptr, c_row, c_col, c_Dptr) bind(c)
        use iso_c_binding
        integer(kind=C_INT), value, intent(in) :: c_row, c_col
        type(C_PTR), intent(inout)             :: c_Aptr, c_Bptr, c_Dptr
    end subroutine sub_matrices

    subroutine elementwise_multiple(c_Aptr, c_Bptr, c_row, c_col, c_Eptr) bind(c)
        use iso_c_binding
        integer(kind=C_INT), value, intent(in) :: c_row, c_col
        type(C_PTR), intent(inout)             :: c_Aptr, c_Bptr, c_Eptr
    end subroutine elementwise_multiple
    end interface

    real(C_DOUBLE), allocatable, target :: A(:,:), B(:,:), C(:,:), D(:,:), E(:,:)  ! Matrices A, B, C, D, E
    integer                             :: seed, row, col, i, j
    type(C_PTR)                         :: Aptr, Bptr, Cptr, Dptr, Eptr

    row = 3
    col = 2
    
!   Allocate memory for matrices
    allocate(A(row,col))
    allocate(B(row,col))
    allocate(C(row,col))
    allocate(D(row,col))
    allocate(E(row,col))

    seed = 1
    call random_seed(seed)

!   Randomly initialize A and B matrices
    call random_number(A)
    call random_number(B)

!   Initialize matrix C, D and E to zeros
    do i = 1,row
        do j = 1,col
            C(i,j) = 0
        end do
    end do

    do i = 1,row
        do j = 1,col
            D(i,j) = 0
        end do
    end do

    do i = 1,row
        do j = 1,col
            E(i,j) = 0
        end do
    end do

!   Create C pointers for matrices A, B and C
    Aptr = C_LOC(A)
    Bptr = C_LOC(B)
    Cptr = C_LOC(C)
    Dptr = C_LOC(D)
    Eptr = C_LOC(E)

!   Add matrices A and B to create matrix C
    call add_matrices(Aptr, Bptr, row, col, Cptr)

!   Add matrices A and B to create matrix C
    call sub_matrices(Aptr, Bptr, row, col, Dptr)

!   Add matrices A and B to create matrix C
    call elementwise_multiple(Aptr, Bptr, row, col, Eptr)

!   Free memory
    deallocate (A)
    deallocate (B)
    deallocate (C)

end program create_matrices