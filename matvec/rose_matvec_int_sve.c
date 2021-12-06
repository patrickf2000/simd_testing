#include "rex_kmp.h" 
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <math.h>
#include <arm_sve.h> 
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
    svbool_t __pg0 = svwhilelt_b32(0,10239);
    for (j = 0; j <= 10239; j += svcntw()) {
      svint32_t __vec0 = svld1(__pg0,&matrix[i * 10240 + j]);
      svint32_t __vec1 = svld1(__pg0,&vector[j]);
      svint32_t __vec2 = svmul_s32_m(__pg0,__vec1,__vec0);
      tmp += svaddv(__pg0,__vec2);
      __pg0 = svwhilelt_b32(j,10239);
    }
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
