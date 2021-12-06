#include "rex_kmp.h" 
//matvec.c
//Multiplies a matrix by a vector
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <immintrin.h> 
#define N_RUNS 1000
#define N 1200
// read timer in second

double read_timer()
{
  struct timeb tm;
  ftime(&tm);
  return ((double )tm . time) + ((double )tm . millitm) / 1000.0;
}
//Create a matrix and a vector and fill with random numbers

void init(float **matrix,float *vector)
{
  for (int i = 0; i < 1200; i++) {
    for (int j = 0; j < 1200; j++) {
      matrix[i][j] = ((float )(rand())) / ((float )(2147483647 / 10.0));
    }
    vector[i] = ((float )(rand())) / ((float )(2147483647 / 10.0));
  }
}
//Our sum function- what it does is pretty straight-forward.

void sum(float **matrix,float *vector,float **dest)
{
  int j;
  float s = 0;
  for (int i = 0; i < 1200; i++) {
    s = 0;
    for (j = 0; j <= 1199; j += 16) {
      float *__ptr0 = dest[i];
      float *__ptr1 = matrix[i];
      __m512 __vec2 = _mm512_loadu_ps(&__ptr1[j]);
      __m512 __vec3 = _mm512_loadu_ps(&vector[j]);
      __m512 __vec4 = _mm512_mul_ps(__vec3,__vec2);
      _mm512_storeu_ps(&__ptr0[j],__vec4);
    }
  }
}
// Debug functions

void serial(float **matrix,float *vector,float **dest)
{
  for (int i = 0; i < 1200; i++) {
    for (int j = 0; j < 1200; j++) {
      dest[i][j] = matrix[i][j] * vector[j];
    }
  }
}

void print_matrix(float **matrix)
{
  for (int i = 0; i < 8; i++) {
    printf("[");
    for (int j = 0; j < 8; j++) {
      printf("%.2f ",matrix[i][j]);
    }
    puts("]");
  }
  puts("");
}

void print_vector(float *vector)
{
  printf("[");
  for (int i = 0; i < 8; i++) {
    printf("%.2f ",vector[i]);
  }
  puts("]");
}

float check(float **A,float **B)
{
  float difference = 0;
  for (int i = 0; i < 1200; i++) {
    for (int j = 0; j < 1200; j++) {
      difference += A[i][j] - B[i][j];
    }
  }
  return difference;
}

int main(int argc,char **argv)
{
  int status = 0;
//Set everything up
  float **dest_matrix = (malloc(sizeof(float *) * 1200));
  float **serial_matrix = (malloc(sizeof(float *) * 1200));
  float **matrix = (malloc(sizeof(float *) * 1200));
  float *vector = (malloc(sizeof(float ) * 1200));
  for (int i = 0; i < 1200; i++) {
    dest_matrix[i] = (malloc(sizeof(float ) * 1200));
    serial_matrix[i] = (malloc(sizeof(float ) * 1200));
    matrix[i] = (malloc(sizeof(float ) * 1200));
  }
  srand((time(((void *)0))));
  init(matrix,vector);
  double start = read_timer();
  for (int i = 0; i < 1000; i++) 
    sum(matrix,vector,dest_matrix);
  double t = read_timer() - start;
  double start_serial = read_timer();
  for (int i = 0; i < 1000; i++) 
    serial(matrix,vector,serial_matrix);
  double t_serial = read_timer() - start_serial;
  print_matrix(matrix);
  print_vector(vector);
  puts("=\n");
  print_matrix(dest_matrix);
  puts("---------------------------------");
  print_matrix(serial_matrix);
  double gflops = 2.0 * 1200 * 1200 * 1000 / (1.0e9 * t);
  double gflops_serial = 2.0 * 1200 * 1200 * 1000 / (1.0e9 * t_serial);
  printf("==================================================================\n");
  printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
  printf("------------------------------------------------------------------\n");
  printf("Matrix-vector (SIMD):\t\t%4f\t%4f\n",t,gflops);
  printf("Matrix-vector (Serial):\t\t%4f\t%4f\n",t_serial,gflops_serial);
  printf("Correctness check: %f\n",(check(dest_matrix,serial_matrix)));
  free(dest_matrix);
  free(serial_matrix);
  free(matrix);
  free(vector);
  return 0;
}
