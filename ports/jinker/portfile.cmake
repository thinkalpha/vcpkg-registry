vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/thinkalpha/jinker
    HEAD_REF main
    REF 8eda0e504e0ed74b30c9f98adbd19b4251be39b1
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/jinker)