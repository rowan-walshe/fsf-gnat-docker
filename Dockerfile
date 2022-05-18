FROM gcc:latest as preloader_stage

COPY preloader.c .
RUN gcc -shared -o preloader.so -fPIC preloader.c

FROM ubuntu:22.04

COPY --from=preloader_stage preloader.so /
COPY codewars_test/ /tmp/codewars_test

RUN apt-get update && \
    apt-get install -y \
        gnat-12 \
        gprbuild && \
    apt-get clean && \
    gprbuild -p -P /tmp/codewars_test/codewars_test.gpr && \
    gprinstall -p -P /tmp/codewars_test/codewars_test.gpr && \
    rm -rf /tmp/codewars_test
