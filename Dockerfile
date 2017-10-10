FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
    autoconf \
    autotools-dev \
    build-essential \
    libtool \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*
