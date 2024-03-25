vcpkg_download_distfile(
    SOURCE_ARCHIVE
    URLS "https://github.com/thinkalpha/hypha/releases/download/v0.5.0-alpha/hypha-0.5.0-Linux-x86_64-Release.tar.gz"
    FILENAME "hypha-0.5.0-Linux-x86_64-Release.tar.gz"
    SHA512 3977a45e1ba4ac94345a9c24089ff7f48064250b70a1f1fbadc38bfbe37b7617ee11810f74506532ab6ce603bb84423336830a1c3e2e5e7ab2feaf87f10bd3e1
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE "${SOURCE_ARCHIVE}"
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/hypha)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")