# GPU Accelerated Image Processing

This project implements a high-performance image processing pipeline using CUDA. It performs brightness enhancement and a 90-degree clockwise rotation on a batch of images.

## Features
- **Parallel Processing**: Utilizes NVIDIA CUDA for fast image transformations.
- **Brightness Adjustment**: Increases image brightness by a fixed factor.
- **Rotation**: Rotates images 90 degrees clockwise during processing.
- **Batch Processing**: Automatically processes all images in the specified input directory.

## Project Structure

```text
GPU_Specialisation_OC/
├── data/
│   ├── input/             # Source images (place images here)
│   └── output/            # Processed images (results stored here)
├── Deliverables/          # Project submission artifacts
├── src/
│   ├── main.cpp           # Main driver code (C++17)
│   ├── kernel.cu          # CUDA kernels (GPU logic)
│   ├── kernel.h           # Prototypes for CUDA functions
│   ├── image_io.cpp       # Image load/save implementation
│   ├── image_io.h         # Image utility headers
│   └── stb_image.h        # External library for image parsing
├── README.md              # Project documentation
└── app                    # Compiled executable (after build)
```

## Prerequisites

- **CUDA Toolkit** (nvcc)
- **C++17** compatible compiler
- **NVIDIA GPU** with Compute Capability support

## Build Instructions

To compile the project from the root directory, use the following command:

```bash
nvcc -std=c++17 src/main.cpp src/kernel.cu src/image_io.cpp -o app
```

## Running the Application

Follow these steps to process your images:

1. **Prepare Data**: Ensure you have images in the `data/input/` directory. Supported formats include `.jpg`, `.png`, `.bmp`, etc.
2. **Execute**: Run the compiled binary:
   ```bash
   ./app
   ```
3. **Verify Output**: The application will print "Processed: [filename]" for each image.
4. **View Results**: Check the `data/output/` folder for the brightened and rotated versions of your images.
