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

void init(int *matrix,int *vector)
{
  for (int i = 0; i < 10240; i++) {
    for (int j = 0; j < 10240; j++) {
      matrix[i * 10240 + j] = ((int )(rand())) / ((int )(2147483647 / 10.0));
    }
    vector[i] = ((int )(rand())) / ((int )(2147483647 / 10.0));
  }
}

void matvec_simd(int *matrix,int *vector,int *dest)
{
  int j;
  for (int i = 0; i < 10240; i++) {
    int tmp = 0;
    __m512i __part0 = _mm512_setzero_epi32();
    for (j = 0; j <= 10239; j += 16) {
      __m512i __vec1 = _mm512_loadu_si512((__m512i *)(&matrix[i * 10240 + j]));
      __m512i __vec2 = _mm512_loadu_si512((__m512i *)(&vector[j]));
      __m512i __vec3 = _mm512_mullo_epi32(__vec2,__vec1);
      __m512i __vec4 = _mm512_add_epi32(__vec3,__part0);
      __part0 = (__vec4);
    }
    __m256i __buf0 = _mm512_extracti32x8_epi32(__part0,0);
    __m256i __buf1 = _mm512_extracti32x8_epi32(__part0,1);
    __buf1 = _mm256_add_epi32(__buf0,__buf1);
    __buf1 = _mm256_hadd_epi32(__buf1,__buf1);
    __buf1 = _mm256_hadd_epi32(__buf1,__buf1);
    int __buf2[8];
    _mm256_storeu_si256((__m256i *)(&__buf2),__buf1);
    tmp = __buf2[0] + __buf2[6];
    dest[i] = tmp;
  }
}
// Debug functions

void matvec_serial(int *matrix,int *vector,int *dest)
{
  for (int i = 0; i < 10240; i++) {
    int tmp = 0;
    for (int j = 0; j < 10240; j++) {
      tmp += matrix[i * 10240 + j] * vector[j];
    }
    dest[i] = tmp;
  }
}

void print_matrix(int *matrix)
{
  for (int i = 0; i < 8; i++) {
    printf("[");
    for (int j = 0; j < 8; j++) {
      printf("%d ",matrix[i * 10240 + j]);
    }
    puts("]");
  }
  puts("");
}

void print_vector(int *vector)
{
  printf("[");
  for (int i = 0; i < 8; i++) {
    printf("%d ",vector[i]);
  }
  puts("]");
}

int check(int *A,int *B)
{
  int difference = 0;
  for (int i = 0; i < 10240; i++) {
    difference += abs(A[i] - B[i]);
  }
  return difference;
}

int main(int argc,char **argv)
{
  int status = 0;
//Set everything up
  int *dest_vector = (malloc(sizeof(int *) * 10240));
  int *serial_vector = (malloc(sizeof(int *) * 10240));
  int *matrix = (malloc(sizeof(int *) * 10240 * 10240));
  int *vector = (malloc(sizeof(int ) * 10240));
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
  printf("Correctness check: %d\n",(check(dest_vector,serial_vector)));
  free(dest_vector);
  free(serial_vector);
  free(matrix);
  free(vector);
  return 0;
}
