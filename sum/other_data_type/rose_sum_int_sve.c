#include "rex_kmp.h" 
//sum.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <arm_sve.h> 
#define N_RUNS 1000
#define N 120000
// read timer in second

double read_timer()
{
  struct timeb tm;
  ftime(&tm);
  return ((double )tm . time) + ((double )tm . millitm) / 1000.0;
}
//Create a matrix and a vector and fill with random numbers

void init(int *X)
{
  for (int i = 0; i < 120000; i++) {
    X[i] = ((int )(rand())) / ((int )(2147483647 / 10.0));
  }
}
//Our sum function- what it does is pretty straight-forward.

int sum(int *X)
{
  int i;
  int result = 0;
  svbool_t __pg0 = svwhilelt_b32(0,119999);
  svint32_t __vec0 = svdup_s32(result);
  svint32_t __part3 = svdup_s32(0);
  for (i = 0; i <= 119999; i += svcntw()) {
    svint32_t __vec1 = svld1(__pg0,&X[i]);
    svint32_t __vec2 = svadd_s32_m(__pg0,__vec1,__vec0);
    __part3 = svadd_s32_m(__pg0,__part3,__vec2);
    __pg0 = svwhilelt_b32(i,119999);
  }
  int __buf0[(svcntw())];
  __pg0 = svwhilelt_b32((uint64_t )0,(svcntw()));
  svst1(__pg0,&__buf0,__part3);
  for (int __i = 0; __i < svcntw(); ++__i) 
    result += __buf0[__i];
  return result;
}
// Debug functions

int sum_serial(int *X)
{
  int result = 0;
  for (int i = 0; i < 120000; i++) {
    result += X[i];
  }
  return result;
}

void print_vector(int *vector)
{
  printf("[");
  for (int i = 0; i < 8; i++) {
    printf("%d ",vector[i]);
  }
  puts("]");
}

int main(int argc,char **argv)
{
  int status = 0;
//Set everything up
  int *X = (malloc(sizeof(int ) * 120000));
  int result;
  int result_serial;
  srand((time(((void *)0))));
  init(X);
  double start = read_timer();
  for (int i = 0; i < 1000; i++) 
    result = sum(X);
  double t = read_timer() - start;
  double start_serial = read_timer();
  for (int i = 0; i < 1000; i++) 
    result_serial = sum_serial(X);
  double t_serial = read_timer() - start_serial;
  print_vector(X);
  puts("=\n");
  printf("SIMD: %d\n",result);
  puts("---------------------------------");
  printf("Serial: %d\n",result_serial);
  double gflops = 2.0 * 120000 * 120000 * 1000 / (1.0e9 * t);
  double gflops_serial = 2.0 * 120000 * 120000 * 1000 / (1.0e9 * t_serial);
  printf("==================================================================\n");
  printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
  printf("------------------------------------------------------------------\n");
  printf("Sum (SIMD):\t\t%4f\t%4f\n",t,gflops);
  printf("Sum (Serial):\t\t%4f\t%4f\n",t_serial,gflops_serial);
  printf("Correctness check: %d\n",result_serial - result);
  free(X);
  return 0;
}
