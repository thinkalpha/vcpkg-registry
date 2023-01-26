# The CCI for the Proxy uploads an archive of the C++ protocol files.
# The archive name includes the 7 character SHA1 of the commit that triggered the CI.
# See: https://alphaengines.slack.com/archives/CNMEH4RSQ/p1674509868593579?thread_ts=1674074963.913839&cid=CNMEH4RSQ
# set(COMMIT_SHA1 25b56fb)
set(COMMIT_SHA1 fffffff)

# vcpkg_extract_source_archive(
#     SOURCE_PATH
#     ARCHIVE "${SOURCE_ARCHIVE}"
#     NO_REMOVE_ONE_LEVEL
#     # (Optional) Read the docs for how to generate patches at:
#     # https://github.com/Microsoft/vcpkg/blob/master/docs/examples/patching.md
#     # PATCHES
#     #   001_port_fixes.patch
#     #   002_more_port_fixes.patch
# )

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE "\\\\wsl.localhost\\Debian\\home\\jarrod\\Dev\\table-ws-ng\\src\\protocol\\flatbuffer\\table-ws-ng-headers-${COMMIT_SHA1}.tar"
    NO_REMOVE_ONE_LEVEL
    # (Optional) Read the docs for how to generate patches at:
    # https://github.com/Microsoft/vcpkg/blob/master/docs/examples/patching.md
    # PATCHES
    #   001_port_fixes.patch
    #   002_more_port_fixes.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    # OPTIONS
    #     -DRANGE_V3_TESTS=OFF
    #     -DRANGE_V3_EXAMPLES=OFF
    #     -DRANGE_V3_PERF=OFF
    #     -DRANGE_V3_HEADER_CHECKS=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/table-ws-protocol)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

# vcpkg_copy_pdbs()
# file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

# Uncomment the line below if necessary to install the license file for the port
# as a file named `copyright` to the directory `${CURRENT_PACKAGES_DIR}/share/${PORT}`
# vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
