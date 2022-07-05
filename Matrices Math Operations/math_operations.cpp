//                                                                                                   
// Created by Siddhant Kadwe on 7/1/22.                                                                     
//                                                                                                   
extern "C" {
    void add_matrices(double **A, double **B, int row, int col, double **C);
    void sub_matrices(double **A, double **B, int row, int col, double **D);
    void elementwise_multiple(double **A, double **B, int row, int col, double **E);
}                           

#include <iostream>

using namespace std;

void add_matrices(double **A, double **B, int row, int col, double **C) {
   for (int i = 0; i < row; ++i) {                                                                 
       for (int j = 0; j < col; ++j) {
        (*C)[i*col+j] = (*A)[i*col+j] + (*B)[i*col+j];
        }
   }
}

void sub_matrices(double **A, double **B, int row, int col, double **D) {
    for (int i = 0; i < row; ++i){                                                                 
       for (int j = 0; j < col; ++j) {
        (*D)[i*col+j] = (*A)[i*col+j] - (*B)[i*col+j];
        }
   }
}

void elementwise_multiple(double **A, double **B, int row, int col, double **E) {
    for (int i = 0; i < row; ++i){                                                                 
       for (int j = 0; j < col; ++j) {
        (*E)[i*col+j] = (*A)[i*col+j] * (*B)[i*col+j];
        }
   }
}