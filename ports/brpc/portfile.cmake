include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO apache/incubator-brpc
    REF  0.9.6
    SHA512 62b6323d07f7fdea6a41072638856815b3e751b4bd46817ce8e4e90ecd4096d794e3d7745ce4bceeb30e0641d68e04a48c2cd68f658f3f4bb4e3f2debff14aec
    HEAD_REF master
    PATCHES
        ${CMAKE_CURRENT_LIST_DIR}/buildfix.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DWITH_GLOG:BOOL=ON
        -DDOWNLOAD_GTEST:BOOL=OFF
        -DBUILD_SHARED:BOOL=OFF
        -DBUILD_TOOLS:BOOL=OFF
)

vcpkg_install_cmake()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/brpc RENAME copyright)

file(REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/debug/include
    ${CURRENT_PACKAGES_DIR}/include/butil/third_party/superfasthash
    )
