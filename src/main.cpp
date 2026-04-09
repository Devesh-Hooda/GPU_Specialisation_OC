#include <iostream>
#include <filesystem>
#include "image_io.h"
#include "kernel.h"

namespace fs = std::filesystem;

int main() {
    std::string input_dir = "project/data/input";
    std::string output_dir = "project/data/output";

    for (const auto& entry : fs::directory_iterator(input_dir)) {
        std::string path = entry.path().string();

        int w, h, c;
        unsigned char* img = load_image(path, w, h, c);

        if (!img) {
            std::cout << "Failed: " << path << "\n";
            continue;
        }

        unsigned char* out = new unsigned char[w * h * 3];

        run_brightness_rotate(img, out, w, h);

        std::string out_path = output_dir + "/" + entry.path().filename().string();
        save_image(out_path, out, w, h, 3);

        std::cout << "Processed: " << path << "\n";

        free(img);
        delete[] out;
    }

    return 0;
}
