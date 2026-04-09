#define STB_IMAGE_IMPLEMENTATION
#define STB_IMAGE_WRITE_IMPLEMENTATION

#include "stb_image.h"
#include "stb_image_write.h"
#include "image_io.h"

unsigned char* load_image(const std::string& path, int& w, int& h, int& c) {
    return stbi_load(path.c_str(), &w, &h, &c, 3);
}

void save_image(const std::string& path, unsigned char* data, int w, int h, int c) {
    stbi_write_png(path.c_str(), w, h, c, data, w * c);
}
