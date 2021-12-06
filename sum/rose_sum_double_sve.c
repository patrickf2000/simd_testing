#include "rex_kmp.h" 
//sum.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <arm_sve.h> 
#define N_RUNS 20
#define N 10240000
// read timer in second

double read_timer()
{
  struct timeb tm;
  ftime(&tm);
  return ((double )tm . time) + ((double )tm . millitm) / 1000.0;
}
//Create a matrix and a vector and fill with random numbers

void init(double *X)
{
  for (int i = 0; i < 10240000; i++) {
    X[i] = ((double )(rand())) / ((double )(2147483647 / 10.0));
  }
}
//Our sum function- what it does is pretty straight-forward.

double sum(double *X)
{
  int i;
  double result = 0;
  svbool_t __pg0 = svwhilelt_b64(0,10239999);
  for (i = 0; i <= 10239999; i += svcntd()) {
    svfloat64_t __vec0 = svld1(__pg0,&X[i]);
    result += svaddv(__pg0,__vec0);
    __pg0 = svwhilelt_b64(i,10239999);
  }
  return result;
}
// Debug functions

double sum_serial(double *X)
{
  double result = 0;
  for (int i = 0; i < 10240000; i++) {
    result += X[i];
  }
  return result;
}

void print_vector(double *vector)
{
  printf("[");
  for (int i = 0; i < 8; i++) {
    printf("%.2f ",vector[i]);
  }
  puts("]");
}

int main(int argc,char **argv)
{
  int status = 0;
//Set everything up
  double *X = (malloc(sizeof(double ) * 10240000));
  double result;
  double result_serial;
  srand((time(((void *)0))));
  init(X);
//warming up
  result = sum(X);
  result_serial = sum_serial(X);
  double t = 0;
  double start = read_timer();
  for (int i = 0; i < 20; i++) 
    result = sum(X);
  t += read_timer() - start;
  double t_serial = 0;
  double start_serial = read_timer();
  for (int i = 0; i < 20; i++) 
    result_serial = sum_serial(X);
  t_serial += read_timer() - start_serial;
  print_vector(X);
  puts("=\n");
  printf("SIMD: %f\n",result);
  puts("---------------------------------");
  printf("Serial: %f\n",result_serial);
  double gflops = 2.0 * 10240000 * 10240000 * 20 / (1.0e9 * t);
  double gflops_serial = 2.0 * 10240000 * 10240000 * 20 / (1.0e9 * t_serial);
  printf("==================================================================\n");
  printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
  printf("------------------------------------------------------------------\n");
  printf("Sum (SIMD):\t\t%4f\t%4f\n",t / 20,gflops);
  printf("Sum (Serial):\t\t%4f\t%4f\n",t_serial / 20,gflops_serial);
  printf("Correctness check: %f\n",result_serial - result);
  free(X);
  return 0;
}
