vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO thinkalpha/hypha
    HEAD_REF main
    REF 30e5cc7e48c57687843c72c24531843feb5a03a9
    SHA512 de7200c62cb9a34a932a9396d693e1eb45a1dd8e6efbfc4e0af94fa478f2fafd3f79c45bf2b2fe3bd12912f088ac45deec93b7f5c9e5af7a0d46df13075fa894
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/hypha)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")