#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <malloc.h>
#include <math.h>

#define N_RUNS 20
#define N 10240

// read timer in second
double read_timer() {
    struct timeb tm;
    ftime(&tm);
    return (double) tm.time + (double) tm.millitm / 1000.0;
}

//Create a matrix and a vector and fill with random numbers
void init(float *matrix, float *vector) {
    for (int i = 0; i<N; i++) {
        for (int j = 0; j<N; j++) {
            matrix[i*N+j] = (float)rand()/(float)(RAND_MAX/10.0);
        }
        
        vector[i] = (float)rand()/(float)(RAND_MAX/10.0);
    }
}

void matvec_simd(float *matrix, float *vector, float *dest) {
    for (int i = 0; i<N; i++) {
        float tmp = 0;
        #pragma omp simd reduction(+: tmp)
        for (int j = 0; j<N; j++) {
            tmp += matrix[i*N+j] * vector[j];
        }
        dest[i] = tmp;
    }
}

// Debug functions
void matvec_serial(float *matrix, float *vector, float *dest) {
    for (int i = 0; i<N; i++) {
        float tmp = 0;
        for (int j = 0; j<N; j++) {
            tmp += matrix[i*N+j] * vector[j];
        }
        dest[i] = tmp;
    }
}

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

void print_vector(float *vector) {
    printf("[");
    for (int i = 0; i<8; i++) {
        printf("%.2f ", vector[i]);
    }
    puts("]");
}

float check(float *A, float *B){
    float difference = 0;
    for(int i = 0;i<N; i++){
        difference += fabsf(A[i]- B[i]);
    }
    return difference;
}

int main(int argc, char **argv) {
    //Set everything up
    float *dest_vector = malloc(sizeof(float*)*N);
    float *serial_vector = malloc(sizeof(float*)*N);
    float *matrix = malloc(sizeof(float*)*N*N);
    float *vector = malloc(sizeof(float)*N);
    
    srand(time(NULL));
    init(matrix, vector);
    
    //warming up
    matvec_simd(matrix, vector, dest_vector);
    
    
    double t = 0;
    double start = read_timer();
    for (int i = 0; i<N_RUNS; i++) {
        printf("%d ", i);
        matvec_simd(matrix, vector, dest_vector);
    }
    printf("\n");
    t += (read_timer() - start);
    
    double t_serial = 0;
    double start_serial = read_timer();
    for (int i = 0; i<N_RUNS; i++)
        matvec_serial(matrix, vector, serial_vector);
    t_serial += (read_timer() - start_serial);
    
    print_matrix(matrix);
    print_vector(vector);
    puts("=\n");
    print_vector(dest_vector);
    puts("---------------------------------");
    print_vector(serial_vector);
    
    double gflops = ((2.0 * N) * N * N_RUNS) / (1.0e9 * t);
    double gflops_serial = ((2.0 * N) * N * N_RUNS) / (1.0e9 * t_serial);
    
    printf("==================================================================\n");
    printf("Performance:\t\t\tRuntime (s)\t GFLOPS\n");
    printf("------------------------------------------------------------------\n");
    printf("Matrix-vector (SIMD):\t\t%4f\t%4f\n", t/N_RUNS, gflops);
    printf("Matrix-vector (Serial):\t\t%4f\t%4f\n", t_serial/N_RUNS, gflops_serial);
    printf("Correctness check: %f\n", check(dest_vector,serial_vector));
    
    free(dest_vector);
    free(serial_vector);
    free(matrix);
    free(vector);
    
    return 0;    
}

