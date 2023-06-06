load("@rules_cc//cc:defs.bzl", "cc_binary")

cc_binary(
    # 目标名称即可执行文件名称
    name = "main.app",  
    # 编译目标需要源文件
    srcs = ["main.cc"], 
    
    # 头文件路径
    #copts = ["-Isrc/lib", "-Ithird_party/jsoncpp",  "-Ithird_party/jsoncpp/include", "-Ithird_party/jsoncpp/include/json"], 
    copts = ["-Isrc/lib"], 
    # 依赖第三方库
    deps = [
        "@libjsoncpp",          # 编译好的第三方静态库,在本包中引用
        "//src/lib:my_math", # 同workspace库
    ],
)

# 构建命令： bazel build //src/main:main.app
# 清理命令： bazel clean
# 查看依赖关系： bazel query --nohost_deps --noimplicit_deps 'deps(//src/main:main.app)' --output graph | xdot
