vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO thinkalpha/table-rdf
    HEAD_REF main
    REF 2a59011fcd6e16500c15fe7b9a21cdc5da621871
    SHA512 2a876dc0a4bfb96fbed70e7224a5f971e9cd88078d12d54eb3c99e011621e320534c7c43bc013cc897824e54d4b96a14cfe4449f91629d9d6900052294420a90
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    # OPTIONS
    #     -DTESTS=OFF
    #     -DEXAMPLES=OFF
    #     -DPERF=OFF
    #     -DHEADER_CHECKS=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/table-rdf)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

# Uncomment the line below if necessary to install the license file for the port
# as a file named `copyright` to the directory `${CURRENT_PACKAGES_DIR}/share/${PORT}`
# vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
