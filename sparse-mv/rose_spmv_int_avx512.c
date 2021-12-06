#include "rex_kmp.h" 
////Example of sparse matrix-vector multiply, using CSR (compressed sparse row format).
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Add timing support
#include <sys/timeb.h>
#include <immintrin.h> 
#define REAL int

double read_timer()
{
  struct timeb tm;
  ftime(&tm);
  return ((double )tm . time) + ((double )tm . millitm) / 1000.0;
}
//#define DEFAULT_DIMSIZE 256

void print_array(char *title,char *name,int *A,int n,int m)
{
  printf("%s:\n",title);
  int i;
  int j;
  for (i = 0; i < n; i++) {
    for (j = 0; j < m; j++) {
      printf("%s[%d][%d]:%d  ",name,i,j,A[i * m + j]);
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
  int *a;
  int *x;
  int *y;
  int row;
  int i;
  int j;
  int idx;
  int n;
  int nnzMax;
  int nnz;
  int nrows;
  int ts;
  int t;
  int rate;
  n = 10240;
//n = 24;
  if (argc > 1) 
    n = atoi(argv[1]);
  nrows = n * n;
  nnzMax = nrows * 5;
  ia = ((int *)(malloc(nrows * sizeof(int ))));
  ja = ((int *)(malloc(nnzMax * sizeof(int ))));
  a = ((int *)(malloc(nnzMax * sizeof(int ))));
/* Allocate the source and result vectors */
  x = ((int *)(malloc(nrows * sizeof(int ))));
  y = ((int *)(malloc(nrows * sizeof(int ))));
  row = 0;
  nnz = 0;
  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++) {
      ia[row] = nnz;
      if (i > 0) {
        ja[nnz] = row - n;
        a[nnz] = (- 1.0);
        nnz++;
      }
      if (j > 0) {
        ja[nnz] = row - 1;
        a[nnz] = (- 1.0);
        nnz++;
      }
      ja[nnz] = row;
      a[nnz] = 4.0;
      nnz++;
      if (j < n - 1) {
        ja[nnz] = row + 1;
        a[nnz] = (- 1.0);
        nnz++;
      }
      if (i < n - 1) {
        ja[nnz] = row + n;
        a[nnz] = (- 1.0);
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
    int sum = 0.0;
    __mmask16 __mask0;
    __mmask16 __mask1;
    __mmask16 __mask2 = _kxnor_mask16(__mask0,__mask1);
    __m512i __buf0 = _mm512_setzero_epi32();
    __m512i __part0 = _mm512_setzero_epi32();
    for (idx = ia[row]; idx <= ia[row + 1] - 1; idx += 16) {
      __m512i __vec1 = _mm512_loadu_si512((__m512i *)(&a[idx]));
      __m512i __vindex0 = _mm512_loadu_si512((__m512i *)(&ja[idx]));
      __m512i __vec2 = _mm512_mask_i32gather_epi32(__buf0,__mask2,__vindex0,x,4);
      __m512i __vec3 = _mm512_mullo_epi32(__vec2,__vec1);
      __m512i __vec4 = _mm512_add_epi32(__vec3,__part0);
      __part0 = (__vec4);
    }
    __m256i __buf1 = _mm512_extracti32x8_epi32(__part0,0);
    __m256i __buf2 = _mm512_extracti32x8_epi32(__part0,1);
    __buf2 = _mm256_add_epi32(__buf1,__buf2);
    __buf2 = _mm256_hadd_epi32(__buf2,__buf2);
    __buf2 = _mm256_hadd_epi32(__buf2,__buf2);
    int __buf3[8];
    _mm256_storeu_si256((__m256i *)(&__buf3),__buf2);
    sum = __buf3[0] + __buf3[6];
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
