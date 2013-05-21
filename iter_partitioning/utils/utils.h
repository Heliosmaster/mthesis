#include <stdlib.h>
#include <stdio.h>
#include <memory.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include <Mondriaan.h>

#define SZINT (sizeof(int))
#define SZDBL (sizeof(double))
#define SZLONG (sizeof(long))


#ifndef UTILS_H
#define UTILS_H
/* memory part */

double* vecallocd(int n);
int* vecalloci(int n); 
long* vecallocl(int n);
double** matallocd(int m, int n); 
void vecfreed(double* pd);
void vecfreel(long* pl);
void vecfreei(int *pi); 
void matfreed(double **ppd);

/* print part */
void print_matrix(struct sparsematrix matrix);
void print_cplx_matrix(struct sparsematrix matrix);
void print_vec(long* vec, int length);
void print_vec_inline(long* vec, int length);
void print_mat_to_file(char* name, struct sparsematrix matrix);
void print_vec_to_file(char* name, long* vec, int length);

/* matrix part */

struct twomatrices {
  struct sparsematrix Ar, Ac;
};

struct sparsematrixplus {
    struct sparsematrix matrix;
    long* perm;
};

long* nnz(long* input, int NrNzElts, int size);
long* CSortVec(long* J, long length, long maxval);
struct sparsematrixplus reorder_row_incr(struct sparsematrix* matrix);
struct sparsematrixplus reorder_col_incr(struct sparsematrix* matrix);
struct twomatrices split_matrix(struct sparsematrix* A, double first, double second);
long* get_increment_rows(struct sparsematrix* A);
long* get_increment_cols(struct sparsematrix* A);
void update_rows(struct sparsematrix* A, long* increment_rows, int i, double value);
void update_cols(struct sparsematrix* A, long* increment_cols, int i, double value);
void update_rows_link(struct sparsematrix* A, struct sparsematrix* B, long* increment_rows, int i, double value, long* link);
void update_cols_link(struct sparsematrix* A, struct sparsematrix* B, long* increment_cols, int i, double value, long* link);

/* misc */
long* double_array_to_long(double* input, int length);
long* random_permutation(long length);
int randi(int bound);
int xor(int a, int b);
long* reverse_perm(long* input, int length);

#endif /* UTILS_H*/