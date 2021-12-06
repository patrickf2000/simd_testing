/*
 * Square matrix multiplication
 * A[N][N] * B[N][N] = C[N][N]
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>

#define N 1024
//#define N 16

// read timer in second
double read_timer() {
    struct timeb tm;
    ftime(&tm);
    return (double) tm.time + (double) tm.millitm / 1000.0;
}

void init(float *A) {
    int i;
    for (i = 0; i < N*N; i++) {
        A[i] = (float)rand()/(float)(RAND_MAX/10.0);
    }
}

void matmul_simd(float *A1, float *B1, float *C1) {
    int i,j,k;
    float temp;
    float (*A)[N] = (float(*)[N])A1;
    float (*B)[N] = (float(*)[N])B1;
    float (*C)[N] = (float(*)[N])C1;

    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            temp = 0;
            #pragma omp simd reduction(+:temp)
            for (k = 0; k < N; k++) {
                temp += A[i][k] * B[k][j];
            }
            C[i][j] = temp;
        }
    }
}

// Debug functions
void print_matrix(float *matrix) {
    for (int i = 0; i<8; i++) {
        printf("[");
        for (int j = 0; j<8; j++) {
            printf("%.2f ", matrix[i*N+j]);
        }
        puts("]");
    }
    puts("");
}

void matmul_serial(float *A1, float *B1, float *C1) {
    int i,j,k;
    float temp;
    float (*A)[N] = (float(*)[N])A1;
    float (*B)[N] = (float(*)[N])B1;
    float (*C)[N] = (float(*)[N])C1;

    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            temp = 0;
            for (k = 0; k < N; k++) {
                temp += A[i][k] * B[k][j];
            }
            C[i][j] = temp;
        }
    }
}

float check(float *A, float *B){
    float difference = 0;
    for(int i = 0;i<N; i++){
        for (int j = 0; j<N; j++) {
            difference += fabsf(A[i*N+j]- B[i*N+j]);
        }
    }
    return difference;
}

// Main
int main(int argc, char *argv[]) {
    //Set everything up
    /*float **A = malloc(sizeof(float*)*N);
    float **B = malloc(sizeof(float*)*N);
    float **C_simd = malloc(sizeof(float*)*N);
    float **C_serial = malloc(sizeof(float*)*N);
    float **BT = malloc(sizeof(float*)*N);
    
    for (int i = 0; i<N; i++) {
        A[i] = malloc(sizeof(float)*N);
        B[i] = malloc(sizeof(float)*N);
        C_simd[i] = malloc(sizeof(float)*N);
        C_serial[i] = malloc(sizeof(float)*N);
        BT[i] = malloc(sizeof(float)*N);
    }*/
    float *A = malloc(sizeof(float)*N*N);
    float *B = malloc(sizeof(float)*N*N);
    float *C = malloc(sizeof(float)*N*N);
    float *C_simd = malloc(sizeof(float)*N*N);
    float *C_serial = malloc(sizeof(float)*N*N);

    srand(time(NULL));
    init(A);
    init(B);

    int i;
    int num_runs = 20;
    
    //Warming up
    matmul_simd(A, B, C_simd);
    matmul_serial(A, B, C_serial);
    

    double elapsed = 0;
    double elapsed1 = read_timer();
    for (i=0; i<num_runs; i++)
        matmul_simd(A, B, C_simd);
    elapsed += (read_timer() - elapsed1);
    
    double elapsed_serial = 0;
    double elapsed_serial1 = read_timer();
    for (i=0; i<num_runs; i++)
        matmul_serial(A, B, C_serial);
    elapsed_serial += (read_timer() - elapsed_serial1);
    
    print_matrix(A);
    print_matrix(B);
    puts("=\n");
    print_matrix(C_simd);
    puts("---------------------------------");
    print_matrix(C_serial);
    
    double gflops_omp = ((((2.0 * N) * N) * N * num_runs) / (1.0e9 * elapsed));
    double gflops_serial = ((((2.0 * N) * N) * N * num_runs) / (1.0e9 * elapsed_serial));
    
    printf("======================================================================================================\n");
    printf("\tMatrix Multiplication: A[N][N] * B[N][N] = C[N][N], N=%d\n", N);
    printf("------------------------------------------------------------------------------------------------------\n");
    printf("Performance:\t\tRuntime (s)\t GFLOPS\n");
    printf("------------------------------------------------------------------------------------------------------\n");
    printf("matmul_omp:\t\t%4f\t%4f\n", elapsed/num_runs, gflops_omp);
    printf("matmul_serial:\t\t%4f\t%4f\n", elapsed_serial/num_runs, gflops_serial);
    printf("Correctness check: %f\n", check(C_simd,C_serial));
    return 0;
}

