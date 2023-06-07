load("@rules_cc//cc:defs.bzl", "cc_binary")

cc_binary(
    # 目标名称即可执行文件名称
    name = "main",  
    # 编译目标需要源文件
    srcs = ["main.cc"],     
    # 头文件路径
    #copts = ["-Isrc/lib", "-Ithird_party/jsoncpp",  "-Ithird_party/jsoncpp/include", "-Ithird_party/jsoncpp/include/json"], 
    copts = ["-Isrc/shared_lib","-Isrc/static_lib","-Isrc/static_shared_lib", ], 
    # 依赖第三方库
    deps = [
        "@libjsoncpp",       # 编译好的第三方静态库,在本包中引用
        "//src/shared_lib:shared_lib", # 同workspace库
        "//src/static_lib:static_lib", # 同workspace库
        "//src/static_shared_lib:static_shared_lib", # 同workspace库
    ],
    linkstatic = 0, # 指定使用动态库，无此字段默认使用静态库
)

# 构建命令： bazel build //src/main:main
# 清理命令： bazel clean
# 查看依赖关系： bazel query --nohost_deps --noimplicit_deps 'deps(//src/main:main)' --output graph | xdot
