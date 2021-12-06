#include "rex_kmp.h" 
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <math.h>
#include <immintrin.h> 
#define N_RUNS 20
#define N 10240
// read timer in second

double read_timer()
{
  struct timeb tm;
  ftime(&tm);
  return ((double )tm . time) + ((double )tm . millitm) / 1000.0;
}
//Create a matrix and a vector and fill with random numbers

void init(double *matrix,double *vector)
{
  for (int i = 0; i < 10240; i++) {
    for (int j = 0; j < 10240; j++) {
      matrix[i * 10240 + j] = ((double )(rand())) / ((double )(2147483647 / 10.0));
    }
    vector[i] = ((double )(rand())) / ((double )(2147483647 / 10.0));
  }
}

void matvec_simd(double *matrix,double *vector,double *dest)
{
  int j;
  for (int i = 0; i < 10240; i++) {
    double tmp = 0;
    __m512d __part0 = _mm512_setzero_pd();
    for (j = 0; j <= 10239; j += 8) {
      __m512d __vec1 = _mm512_loadu_pd(&matrix[i * 10240 + j]);
      __m512d __vec2 = _mm512_loadu_pd(&vector[j]);
      __m512d __vec3 = _mm512_mul_pd(__vec2,__vec1);
      __m512d __vec4 = _mm512_add_pd(__vec3,__part0);
      __part0 = (__vec4);
    }
    __m256d __buf0 = _mm512_extractf64x4_pd(__part0,0);
    __m256d __buf1 = _mm512_extractf64x4_pd(__part0,1);
    __buf1 = _mm256_add_pd(__buf0,__buf1);
    __buf1 = _mm256_hadd_pd(__buf1,__buf1);
    double __buf2[4];
    _mm256_storeu_pd(&__buf2,__buf1);
    tmp = __buf2[0] + __buf2[2];
    dest[i] = tmp;
  }
}
// Debug functions

void matvec_serial(double *matrix,double *vector,double *dest)
{
  for (int i = 0; i < 10240; i++) {
    double tmp = 0;
    for (int j = 0; j < 10240; j++) {
      tmp += matrix[i * 10240 + j] * vector[j];
    }
    dest[i] = tmp;
  }
}

void print_matrix(double *matrix)
{
  for (int i = 0; i < 8; i++) {
    printf("[");
    for (int j = 0; j < 8; j++) {
      printf("%.2f ",matrix[i * 10240 + j]);
    }
    puts("]");
  }
  puts("");
}

void print_vector(double *vector)
{
  printf("[");
  for (int i = 0; i < 8; i++) {
    printf("%.2f ",vector[i]);
  }
  puts("]");
}

double check(double *A,double *B)
{
  double difference = 0;
  for (int i = 0; i < 10240; i++) {
    difference += (fabsf((A[i] - B[i])));
  }
  return difference;
}

int main(int argc,char **argv)
{
  int status = 0;
//Set everything up
  double *dest_vector = (malloc(sizeof(double *) * 10240));
  double *serial_vector = (malloc(sizeof(double *) * 10240));
  double *matrix = (malloc(sizeof(double *) * 10240 * 10240));
  double *vector = (malloc(sizeof(double ) * 10240));
  srand((time(((void *)0))));
  init(matrix,vector);
//warming up
  matvec_simd(matrix,vector,dest_vector);
  double t = 0;
  double start = read_timer();
  for (int i = 0; i < 20; i++) 
    matvec_simd(matrix,vector,dest_vector);
  t += read_timer() - start;
  double t_serial = 0;
  double start_serial = read_timer();
  for (int i = 0; i < 20; i++) 
    matvec_serial(matrix,vector,serial_vector);
  t_serial += read_timer() - start_serial;
  print_matrix(matrix);
  print_vector(vector);
  puts("=\n");
  print_vector(dest_vector);
  puts("---------------------------------");
  print_vector(serial_vector);
  double gflops = 2.0 * 10240 * 10240 * 20 / (1.0e9 * t);
  double gflops_serial = 2.0 * 10240 * 10240 * 20 / (1.0e9 * t_serial);
  printf("==================================================================\n");
  printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
  printf("------------------------------------------------------------------\n");
  printf("Matrix-vector (SIMD):\t\t%4f\t%4f\n",t / 20,gflops);
  printf("Matrix-vector (Serial):\t\t%4f\t%4f\n",t_serial / 20,gflops_serial);
  printf("Correctness check: %f\n",(check(dest_vector,serial_vector)));
  free(dest_vector);
  free(serial_vector);
  free(matrix);
  free(vector);
  return 0;
}
