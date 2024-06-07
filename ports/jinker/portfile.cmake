vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/thinkalpha/jinker
    HEAD_REF main
    REF ce33911280189cca93a911db53f5f2e7cf6a72c0
)

# If the unit-tests feature is requested, then -DJINK_BUILD_TESTS=ON is added to FEATURE_OPTIONS.
vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        unit-tests JINK_BUILD_TESTS
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}      # e.g. -DJINK_BUILD_TESTS=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/jinker)
vcpkg_fixup_pkgconfig()