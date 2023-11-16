vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO thinkalpha/table-rdf
    HEAD_REF main
    REF ac10ac27988b148d5861368928aee272db215f9f
    SHA512 4ddc4e8bced411f75ebc8dc6a51d0fde4ea58f105d2adacdf693f986adcad14de78e87a28b38e1c610a8d1b8c189b5892d15a1283c9db1e6ae86dcce8d10a60a
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
