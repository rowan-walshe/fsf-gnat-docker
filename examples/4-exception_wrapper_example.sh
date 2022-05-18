#!/bin/sh
WORKDIR=/workspace/
C=$(docker container create -w $WORKDIR fsf-gnat $WORKDIR/compile_run.sh)
docker container cp ./4-exception_wrapper_example/. $C:$WORKDIR
docker container start --attach $C
