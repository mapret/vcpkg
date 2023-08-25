vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(OUT_SOURCE_PATH SOURCE_PATH
    REPO mapret/METIS
    REF 6bef4f7e5de16b59a63ff6f2f9bfad629f2d6202
    SHA512 800a1125c6bbe83d23eeb3086d03ebad9754e1c65b07dbfc72c0d179812a69b0dd6e7def0bd4d61dd600c7053897ae53c53a002bf32d1fa9125ada99abb92c43
    PATCHES
        build-fixes.patch
    )

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
file(WRITE "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" [=[
metis provides CMake targets:
    find_package(metis CONFIG REQUIRED)
    target_link_libraries(main PRIVATE metis)
]=])
