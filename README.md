# Rex SIMD Testing

This is the benchmark testing for various kernels of our Rex compiler. While I originally wrote this for our SIMD testing, in theory it should be reusable for other tasks as well.

### Building

"build.sh" is the script for building the kernels. In the "build.sh" file, there are two functions: one for building on Intel, and the other for Arm. All outputs will be put in folder named "build".

To run:
```bash
# For Intel:
./build.sh intel

# For Arm:
./build.sh arm
```

### Running

"run.sh" is used for running the kernel. There are once agian two functions, one for Intel and one for Arm. Both generate CSV files for each kernel, with the "AVERAGE" excel formula at the end. The scripts are capable of running each kernel multiple times, which is the purpose of the AVERAGE formula at the end. Each kernel outputs two columns: the time in seconds, and the correctness check.

The functions can be customized as needed to add additional kernel versions (make sure to update the build script!). The only important thing to note is that if you add a kernel version, it MUST be present across all the kernels, or the script could fail.

To run:
```bash
# To run on Intel, with each kernel running 5 times
./run.sh intel 5

# To run on Arm, using the default number of times per kernel (==10)
./run.sh arm
```

### CSV Files

To see what the CSV files look like, please visit the "output" directory. If they are formatted correctly, Github should be able to show them. On my system, LibreOffice Calc was able to open them and calculate the averages with no issue.

### Adding New Kernels

To add a new kernel (== a whole new program, not a new version), simply create a folder and add the benchmarks with the same naming scheme as the rest of the kernels. The folder and the kernels must have the same name. The scripts will automatically detect them for you.

IMPORTANT: Make sure your kernels only output the time and the correctness in that order. Each value must be separated by a comma. If you do not do this, the CSV file will be distorted. If you need any other output, send to STDERR. Only STDOUT is recorded to the CSV. For example:

```c
// Output time and correctness
float time = 5.5;
float correctness = 0.0f;
printf("%f,%f\n", time, correctness);
```
