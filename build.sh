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

pwd
ls
