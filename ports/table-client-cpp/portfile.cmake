set(VCPKG_ENV_PASSTHROUGH_UNTRACKED VCPKG_ROOT)

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO thinkalpha/table-client-cpp
  #  GITHUB_HOST ssh://git@github.com
  AUTHORIZATION_TOKEN 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 
  REF daaaf90da2b215eb26fb693018f804d5a4ca5d0d
  SHA512 a7a6bf58065443087faeb8613030f28bfe1034ac81c5af54a69acdac3817172858694c1dc3e8e70cc3b8cb9550952a6384805e7c64f4e8cf76c7c6a272e03fce 
  HEAD_REF add-table-client-cpp
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
