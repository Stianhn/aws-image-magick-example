#!/usr/bin/env bash
set -e

cd /root

curl -L -o tmp-libheif.tar.gz https://github.com/strukturag/libheif/releases/download/v1.18.2/libheif-1.18.2.tar.gz
tar xf tmp-libheif.tar.gz
cd libheif*

mkdir -p build
cd build

PKG_CONFIG_PATH=/root/build/cache/lib/pkgconfig \
cmake3 .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/root/build/cache \
    -DENABLE_PLUGIN_LOADING=OFF \
    -DWITH_LIBDE265=ON \
    -DWITH_X265=ON \
    -DWITH_AOM_DECODER=ON \
    -DWITH_AOM_ENCODER=ON \
    -DWITH_RAV1E=OFF \
    -DWITH_DAV1D=OFF \
    -DWITH_SVTAV1=OFF \
    -DWITH_OPENJPEG_DECODER=OFF \
    -DWITH_OPENJPEG_ENCODER=OFF \
    -DBUILD_SHARED_LIBS=OFF

make -j$(nproc)
make install
