#!/bin/sh

set -e

# Compile
gprbuild harness/harness.gpr > /dev/null

# Run
LD_PRELOAD=/preloader.so ./harness/obj/harness