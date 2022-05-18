#!/bin/sh
WORKDIR=/workspace/
C=$(docker container create -w $WORKDIR fsf-gnat $WORKDIR/compile_run.sh)
docker container cp ./2-simple_failing_example/. $C:$WORKDIR
docker container start --attach $C
