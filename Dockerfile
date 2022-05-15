FROM gcc:latest as preloader_stage

COPY preloader.c .
RUN gcc -shared -o preloader.so -fPIC preloader.c

FROM ubuntu:22.04

COPY --from=preloader_stage preloader.so /

RUN apt-get update && \
    apt-get install -y \
        make \
        wget \
        gnat-12 \
        gprbuild && \
    apt-get clean && \
    wget https://github.com/AdaCore/aunit/archive/refs/tags/v22.0.0.tar.gz && \
    tar -xvf v22.0.0.tar.gz && \
    rm v22.0.0.tar.gz && \
    cd aunit-22.0.0 && \
    make && \
    make install && \
    rm -rf aunit-22.0.0
