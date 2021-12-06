#include "rex_kmp.h" 
////Example of sparse matrix-vector multiply, using CSR (compressed sparse row format).
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Add timing support
#include <sys/timeb.h>
#include <arm_sve.h> 
#define REAL double

double read_timer()
{
  struct timeb tm;
  ftime(&tm);
  return ((double )tm . time) + ((double )tm . millitm) / 1000.0;
}
//#define DEFAULT_DIMSIZE 256

void print_array(char *title,char *name,double *A,int n,int m)
{
  printf("%s:\n",title);
  int i;
  int j;
  for (i = 0; i < n; i++) {
    for (j = 0; j < m; j++) {
      printf("%s[%d][%d]:%f  ",name,i,j,A[i * m + j]);
    }
    printf("\n");
  }
  printf("\n");
}
/*  subroutine error_check (n,m,alpha,dx,dy,u,f)
 implicit none
 ************************************************************
 * Checks error between numerical and exact solution
 *
 ************************************************************/

int main(int argc,char *argv[])
{
  int status = 0;
  int *ia;
  int *ja;
  double *a;
  double *x;
  double *y;
  int row;
  int i;
  int j;
  int idx;
  int n;
  int nnzMax;
  int nnz;
  int nrows;
  double ts;
  double t;
  double rate;
  n = 10240;
//n = 24;
  if (argc > 1) 
    n = atoi(argv[1]);
  nrows = n * n;
  nnzMax = nrows * 5;
  ia = ((int *)(malloc(nrows * sizeof(int ))));
  ja = ((int *)(malloc(nnzMax * sizeof(int ))));
  a = ((double *)(malloc(nnzMax * sizeof(double ))));
/* Allocate the source and result vectors */
  x = ((double *)(malloc(nrows * sizeof(double ))));
  y = ((double *)(malloc(nrows * sizeof(double ))));
  row = 0;
  nnz = 0;
  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++) {
      ia[row] = nnz;
      if (i > 0) {
        ja[nnz] = row - n;
        a[nnz] = - 1.0;
        nnz++;
      }
      if (j > 0) {
        ja[nnz] = row - 1;
        a[nnz] = - 1.0;
        nnz++;
      }
      ja[nnz] = row;
      a[nnz] = 4.0;
      nnz++;
      if (j < n - 1) {
        ja[nnz] = row + 1;
        a[nnz] = - 1.0;
        nnz++;
      }
      if (i < n - 1) {
        ja[nnz] = row + n;
        a[nnz] = - 1.0;
        nnz++;
      }
      row++;
    }
  }
  ia[row] = nnz;
/* Create the source (x) vector */
  for (i = 0; i < nrows; i++) 
    x[i] = 1.0;
  double elapsed = read_timer();
  for (row = 0; row < nrows; row++) {
    double sum = 0.0;
    svbool_t __pg0 = svwhilelt_b64(0,ia[row + 1] - 1);
    for (idx = ia[row]; idx <= ia[row + 1] - 1; idx += svcntd()) {
      svfloat64_t __vec0 = svld1(__pg0,&a[idx]);
      svint32_t __vindex0 = svld1(__pg0,&ja[idx]);
      svfloat64_t __vec1 = svld1_gather_index(__pg0,x,__vindex0);
      svfloat64_t __vec2 = svmul_f64_m(__pg0,__vec1,__vec0);
      sum += svaddv(__pg0,__vec2);
      __pg0 = svwhilelt_b64(idx,ia[row + 1] - 1);
    }
    y[row] = sum;
  }
  elapsed = read_timer() - elapsed;
  printf("seq elasped time(s): %.4f\n",elapsed);
  int errors = 0;
  for (row = 0; row < nrows; row++) {
    if (y[row] < 0) {
//fprintf(stderr,"y[%d]=%f, fails consistency test\n", row, y[row]);
      ++errors;
    }
  }
  printf("Errors: %d\n",errors);
  free(ia);
  free(ja);
  free(a);
  free(x);
  free(y);
  return 0;
}
