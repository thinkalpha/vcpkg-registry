vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO thinkalpha/hypha
    HEAD_REF main
    REF v0.5.0-alpha
    SHA512 50acb467a2983ac4f99cd47f325ed1f51cfcbd4b33d95687f96e76d5425597b1c8bda47313ad51071b18dd7c7a856152839c6967fdd2adb51fc02e3a288f2f25
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/hypha)

# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")