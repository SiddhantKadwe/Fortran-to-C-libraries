all:                                                                                                 
	rm -f a.out create_matrices.o math_operations.o                                              
	g++ -c math_operations.cpp -o math_operations.o                                                    
	gfortran -c -O3 create_matrices.f90 -o create_matrices.o                                     
	gfortran math_operations.o create_matrices.o -fbounds-check -lstdc++ -g -o a.out             
	./a.out                                                                                   