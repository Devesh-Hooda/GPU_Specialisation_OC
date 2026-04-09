#pragma once
#include <string>

unsigned char* load_image(const std::string& path, int& w, int& h, int& c);
void save_image(const std::string& path, unsigned char* data, int w, int h, int c);
