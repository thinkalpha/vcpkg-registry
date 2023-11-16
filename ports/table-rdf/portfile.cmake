vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO thinkalpha/table-rdf
    HEAD_REF main
    REF 00fc195a3fb1e969d15ef92bab131a249b183255
    SHA512 e5240f9b3a3c7a15f721aebbeebf62a58a095dd77088c8f800dc96aad330b8af9467414b213ca203fef3c23ea19f21974ddfa6a453a2241e22f1e05038af5466
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
