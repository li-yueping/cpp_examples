#需要指定本package对外可见的target,文件路径为相对BUILD的路径
#exports_files(["lib/libjsoncpp.a"])
#exports_files(glob(["include/json/*.h"]))

#exports_files(glob(["include/json/*.h", "lib/libjsoncpp.a"])) # ok

cc_import(
  name = "libjsoncpp",
  hdrs = glob(["json/*.h"]),
  static_library = "libjsoncpp.a",
  #shared_library = "libjsoncpp.so",
  visibility = ["//visibility:public"],
)
