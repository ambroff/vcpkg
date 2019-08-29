include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO skystrife/cpptoml
	
	REF fededad7169e538ca47e11a9ee9251bc361a9a65
	SHA512 2ec50f4585bca33bb343170470048a7d7e7902f1ffa5709cf84ddf9f53a899ff1cc9ffa49e059f6dad93d13823c4d2661bc8109e4356078cdbdfef1a2be6a622 
	
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/cpptoml)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/cpptoml RENAME copyright)
