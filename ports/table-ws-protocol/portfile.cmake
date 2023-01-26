# The CCI for the Proxy uploads an archive of the C++ protocol files.
# The archive name includes the 7 character SHA1 of the commit that triggered the CI.
# See: https://alphaengines.slack.com/archives/CNMEH4RSQ/p1674509868593579?thread_ts=1674074963.913839&cid=CNMEH4RSQ

set(COMMIT_SHA1 1ce7064)

vcpkg_download_distfile(SOURCE_ARCHIVE
    URLS "https://download-site.prod.thinkalpha.io/table-ws-ng/table-ws-ng-headers-${COMMIT_SHA1}.tar.gz"
    FILENAME "table-ws-protocol_table-ws-ng-headers-${COMMIT_SHA1}.tar.gz"
    SHA512 1c0731fa122ad30405c883b25fd351a2de0b11bcab880a31107588a5fab0166c6c5f6b5372f059c17f735adfee62012ae7e28615d7e7cd51e14f1078cc417e62
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE "${SOURCE_ARCHIVE}"
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
    #     -DTESTS=OFF
    #     -DEXAMPLES=OFF
    #     -DPERF=OFF
    #     -DHEADER_CHECKS=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/table-ws-protocol)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

# vcpkg_copy_pdbs()
# file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

# Uncomment the line below if necessary to install the license file for the port
# as a file named `copyright` to the directory `${CURRENT_PACKAGES_DIR}/share/${PORT}`
# vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
