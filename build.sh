#!/usr/bin/env bash

# Setup parameters
SCRIPT_ABS_DIR="$(cd $(dirname "$0") && pwd -P)"
BUILD_TYPE="Release"
BUILD_OPTIM="yes"

# Setup C and C++ Compiler flags for Mac and Linux. 
MOOS_CXX_FLAGS="-Wall -Wextra -Wno-unused-parameter -pedantic -fPIC"
if [ "${BUILD_OPTIM}" = "yes" ] ; then
    MOOS_CXX_FLAGS=$MOOS_CXX_FLAGS" -Os"
fi

# Create directory for build
mkdir -p "build"
cd "build"

# Build essential moos
echo "Invoking cmake..." `pwd`
cmake -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -v                         \
      -DCMAKE_RUNTIME_OUTPUT_DIRECTORY="${SCRIPT_ABS_DIR}/bin"  \
      -DCMAKE_CXX_FLAGS="${MOOS_CXX_FLAGS}"                     \
      ..                                                        \

echo ""  
echo "Invoking make..." `pwd` && echo""          \
  && make ${CMD_ARGS}