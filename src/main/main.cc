#include <iostream>
#include <string>

#include "json/json.h" // 头文件从包所在位置开始
#include "my_math.h"

int main(int argc, char** argv) {
    std::cout << "this is a c++ example..." << std::endl;
    std::cout << "3 + 4 = " << add(3, 4) << std::endl;

    Json::Value value;
    value["key"] = "value";
    std::string str = value.toStyledString();
    std::cout << str << std::endl;
    return 0;
}