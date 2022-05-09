#!/bin/sh

set -e

# Compile
gprbuild -q -P example.gpr

# Run
LD_PRELOAD=/preloader.so ./obj/example