#include <iostream>
#include <string>

#include "json/json.h" // 头文件从包所在位置开始

#include "shared_lib.h"
#include "static_lib.h"
#include "static_shared_lib.h"

int main(int argc, char** argv) {
    std::cout << "this is a c++ example..." << std::endl;

    PrintShardInfo();
    PrintStaticInfo();
    PrintStaticSharedInfo();

    Json::Value value;
    value["jsoncpp"] = "test";
    std::string str = value.toStyledString();
    std::cout << str << std::endl;
    return 0;
}