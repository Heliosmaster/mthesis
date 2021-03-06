#include <stdlib.h>
#include <stdio.h>
#include <memory.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include <Mondriaan.h>
#include "utils.h"

int main(){
	/* srand(time(NULL)); */
	/* reading the matrix from file */
	FILE* File;
	struct sparsematrix matrix;
	File = fopen("../../matrices/cre_b.mtx", "r");
	if (!MMReadSparseMatrix(File, &matrix)) printf("Unable to read input matrix!\n");
	fclose(File);

	struct sparsematrixplus reorder1 = reorder_row_incr(&matrix);
	struct sparsematrix matrix3 = reorder1.matrix;

	int m = matrix.m;
	int n = matrix.n;
	printf("m,n = %d,%d\n",m,n);

	/* getting the ICS version of A 
		 struct sparsematrixplus reordering = reorder_col_incr(&matrix3);
		 struct sparsematrix matrix2 = reordering.matrix;*/

	/* getting the increments */
	long* incr_rows = get_increment_rows(&matrix3);
	/*  long* incr_cols = get_increment_cols(&matrix2);*/

	/*  print_vec_inline(incr_rows,m);
			print_vec_inline(incr_cols,n);*/

	int k;
	for(k=0;k<7250;k++) update_rows(&matrix3,incr_rows,k,10);
	/*for(k=0;k<n;k++) update_cols(&matrix2,incr_cols,k,11);*/

	/* print out */
	/*
		 printf("Original matrices:\n");
		 printf("A: row incremental\n");
		 print_matrix(matrix);
		 printf("\nB: col incremental\n");
		 print_matrix(matrix2);
		 printf("-----------------\n");

		 printf("Trying to put 10 in the 9th row of A\n");
		 update_rows(&matrix,incr_rows,8,10);
		 print_matrix(matrix);
		 printf("-----------------\n");

		 printf("Trying to put 11 in the 9rd col of B\n");
		 update_cols(&matrix2,incr_cols,8,11);
		 print_matrix(matrix2);
		 printf("-----------------\n");

		 printf("Trying to put 11 in the 9rd col of A using link\n");
		 update_cols_link(&matrix2,&matrix,incr_cols,8,11,reordering.perm);
		 print_matrix(matrix);
		 printf("-----------------\n");  

		 long* perm2 = reverse_perm(reordering.perm,matrix2.NrNzElts);
		 printf("Trying to put 10 in the 9th row of B using link\n");
		 update_rows_link(&matrix,&matrix2,incr_rows,8,10,perm2);
		 print_matrix(matrix2);
		 printf("-----------------\n"); 
		 */
	MMDeleteSparseMatrix(&matrix);
	/* MMDeleteSparseMatrix(&matrix2);*/
	MMDeleteSparseMatrix(&matrix3);
	/*  vecfreel(reordering.perm);i*/
	vecfreel(reorder1.perm);
	vecfreel(incr_rows);
	/*  vecfreel(incr_cols);
			vecfreel(perm2);  */
	return 0;
}
