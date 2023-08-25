vcpkg_check_linkage(ONLY_STATIC_LIBRARY)
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO mapret/GKlib
    REF 804361cce8dbf2459863d329498dbe0f2d34d68e
    SHA512 759d875de367db03fd8c91686008d0c4cb8e2de66e3664edeaad8dc271910ba58323572024e904ff50b1434b90635fd0f1f0252340a5dbd15ebe382ad9de54e2
    PATCHES
        build-fixes.patch
)

# Delete files that are workarounds for very old copies of msvc.
file(REMOVE "${SOURCE_PATH}/ms_inttypes.h" "${SOURCE_PATH}/ms_stdint.h")
vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
file(WRITE "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" [=[
gklib provides CMake targets:
    find_package(GKlib CONFIG REQUIRED)
    target_link_libraries(main PRIVATE GKlib)
]=])
