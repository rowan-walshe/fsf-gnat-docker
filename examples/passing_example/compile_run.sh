#!/bin/sh

set -e

# Compile
gprbuild -q -P harness/harness.gpr

# Run
LD_PRELOAD=/preloader.so ./harness/obj/harness