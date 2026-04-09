#include "kernel.h"
#include <cuda_runtime.h>

__global__ void brightness_rotate_kernel(unsigned char* input, unsigned char* output, int w, int h) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= w || y >= h) return;

    int channels = 3;

    int in_idx = (y * w + x) * channels;

    // increase brightness
    int brightness = 100;  // adjust this value if needed

    unsigned char r = min(input[in_idx] + brightness, 255);
    unsigned char g = min(input[in_idx + 1] + brightness, 255);
    unsigned char b = min(input[in_idx + 2] + brightness, 255);

    // rotate 90 degrees clockwise
    int new_x = y;
    int new_y = w - 1 - x;

    int out_idx = (new_y * h + new_x) * channels;

    output[out_idx] = r;
    output[out_idx + 1] = g;
    output[out_idx + 2] = b;
}

void run_brightness_rotate(unsigned char* input, unsigned char* output, int w, int h) {
    unsigned char *d_in, *d_out;

    // NOTE: output size is still w*h*3 (same total pixels)
    size_t size = w * h * 3;

    cudaMalloc(&d_in, size);
    cudaMalloc(&d_out, size);

    cudaMemcpy(d_in, input, size, cudaMemcpyHostToDevice);

    dim3 block(16, 16);
    dim3 grid((w + 15)/16, (h + 15)/16);

    brightness_rotate_kernel<<<grid, block>>>(d_in, d_out, w, h);

    cudaMemcpy(output, d_out, size, cudaMemcpyDeviceToHost);

    cudaFree(d_in);
    cudaFree(d_out);
}
