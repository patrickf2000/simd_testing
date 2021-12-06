//matvec.c
//Multiplies a matrix by a vector
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>

#define N_RUNS 1000
#define N 1200

// read timer in second
double read_timer() {
    struct timeb tm;
    ftime(&tm);
    return (double) tm.time + (double) tm.millitm / 1000.0;
}

//Create a matrix and a vector and fill with random numbers
void init(double **matrix, double *vector) {
    for (int i = 0; i<N; i++) {
        for (int j = 0; j<N; j++) {
            matrix[i][j] = (double)rand()/(double)(RAND_MAX/10.0);
        }
        
        vector[i] = (double)rand()/(double)(RAND_MAX/10.0);
    }
}

//Our sum function- what it does is pretty straight-forward.
void sum(double **matrix, double *vector, double **dest) {
    double s = 0;
    
    for (int i = 0; i<N; i++) {
        s = 0;
        
        #pragma omp simd simdlen(8)   
        for (int j = 0; j<N; j++) {
            dest[i][j] = matrix[i][j] * vector[j];
        }
    }
}

// Debug functions
void serial(double **matrix, double *vector, double **dest) {
    for (int i = 0; i<N; i++) {
        for (int j = 0; j<N; j++) {
            dest[i][j] = matrix[i][j] * vector[j];
        }
    }
}

void print_matrix(double **matrix) {
    for (int i = 0; i<8; i++) {
        printf("[");
        for (int j = 0; j<8; j++) {
            printf("%.2f ", matrix[i][j]);
        }
        puts("]");
    }
    puts("");
}

void print_vector(double *vector) {
    printf("[");
    for (int i = 0; i<8; i++) {
        printf("%.2f ", vector[i]);
    }
    puts("]");
}

double check(double **A, double **B){
    double difference = 0;
    for(int i = 0;i<N; i++){
        for (int j = 0; j<N; j++)
        { difference += A[i][j]- B[i][j];}
    }
    return difference;
}

int main(int argc, char **argv) {
    //Set everything up
    double **dest_matrix = malloc(sizeof(double*)*N);
    double **serial_matrix = malloc(sizeof(double*)*N);
    double **matrix = malloc(sizeof(double*)*N);
    double *vector = malloc(sizeof(double)*N);
    
    for (int i = 0; i<N; i++) {
        dest_matrix[i] = malloc(sizeof(double)*N);
        serial_matrix[i] = malloc(sizeof(double)*N);
        matrix[i] = malloc(sizeof(double)*N);
    }
    
    srand(time(NULL));
    init(matrix, vector);
    
    double start = read_timer();
    for (int i = 0; i<N_RUNS; i++)
        sum(matrix, vector, dest_matrix);
    double t = (read_timer() - start);
    
    double start_serial = read_timer();
    for (int i = 0; i<N_RUNS; i++)
        serial(matrix, vector, serial_matrix);
    double t_serial = (read_timer() - start_serial);
    
    print_matrix(matrix);
    print_vector(vector);
    puts("=\n");
    print_matrix(dest_matrix);
    puts("---------------------------------");
    print_matrix(serial_matrix);
    
    double gflops = ((2.0 * N) * N * N_RUNS) / (1.0e9 * t);
    double gflops_serial = ((2.0 * N) * N * N_RUNS) / (1.0e9 * t_serial);
    
    printf("==================================================================\n");
    printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
    printf("------------------------------------------------------------------\n");
    printf("Matrix-vector (SIMD):\t\t%4f\t%4f\n", t, gflops);
    printf("Matrix-vector (Serial):\t\t%4f\t%4f\n", t_serial, gflops_serial);
    printf("Correctness check: %f\n", check(dest_matrix,serial_matrix));
    
    free(dest_matrix);
    free(serial_matrix);
    free(matrix);
    free(vector);
    
    return 0;    
}

