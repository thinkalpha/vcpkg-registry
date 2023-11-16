vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO thinkalpha/table-rdf
    HEAD_REF main
    REF 34d7d95a8d995d1294cc89e2e608c20a62cf48b2
    SHA512 0
    AUTHORIZATION_TOKEN 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
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
