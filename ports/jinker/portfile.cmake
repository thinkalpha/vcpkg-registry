vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/thinkalpha/jinker
    HEAD_REF main
    REF 492af84b77be7f64d11f61ad27bf4f2801e49639
)

# If the unit-tests feature is requested, then -DJINK_BUILD_TESTS=ON is added to FEATURE_OPTIONS.
# If the gbench feature is requested, then -DJINK_BUILD_GBENCH=ON is added to FEATURE_OPTIONS.
vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        unit-tests JINK_BUILD_TESTS
        gbench JINK_BUILD_GBENCH
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}      # e.g. -DJINK_BUILD_TESTS=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/jinker)
vcpkg_fixup_pkgconfig()