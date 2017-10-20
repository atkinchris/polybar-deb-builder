#!/bin/bash

set -eu

# Checkout the source
git clone --recursive https://github.com/jaagr/polybar.git
cd polybar
TAG=$(git describe --tags)
git checkout $TAG

# Build package
mkdir build
cd build
cmake ..
make
mkdir -p /tmp/contents
make DESTDIR=/tmp/contents install

# Build the package
fpm -s dir -t deb \
	-C /tmp/contents \
	--name "polybar" \
	--version $TAG \
	--iteration 1 \
	--description "A fast and easy-to-use status bar" \
	.

cp *.deb /output
