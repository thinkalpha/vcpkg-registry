set(VCPKG_ENV_PASSTHROUGH_UNTRACKED VCPKG_ROOT)

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO thinkalpha/table-client-cpp
  #  GITHUB_HOST ssh://git@github.com
  AUTHORIZATION_TOKEN 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
  REF 24322f6f853120530ca058a69cd94037e4a5f30e 
  SHA512 483aa2483dce58b97ed65ca9435b1d4b26a4b82cdf814e23d82df591abffaf6542fe8389f3c8343d38cc90ea4ae89c34b809d2500221c07a04585c3439905e2c 
  HEAD_REF main
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

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/table-client-cpp)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

# vcpkg_copy_pdbs()
# file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

# Uncomment the line below if necessary to install the license file for the port
# as a file named `copyright` to the directory `${CURRENT_PACKAGES_DIR}/share/${PORT}`
# vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
