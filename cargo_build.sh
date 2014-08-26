#!/bin/bash
#
# Build fontconfig, but only if on Linux or Android.

set -e

if [ $(uname -s) = "Darwin" ]; then
    exit 0
fi

SRC_DIR=$(pwd)
cd ${OUT_DIR}

if [ ! -f Makefile ]; then
    ${SRC_DIR}/autogen.sh --sysconfdir=/etc --localstatedir=/var --disable-docs --disable-shared
fi

make -j4
