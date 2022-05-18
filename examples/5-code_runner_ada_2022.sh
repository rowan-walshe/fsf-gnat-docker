#!/bin/sh
WORKDIR=/workspace/
C=$(docker container create -w $WORKDIR fsf-gnat $WORKDIR/compile_run.sh)
docker container cp ./5-ada_2022/. $C:$WORKDIR
docker container start --attach $C
