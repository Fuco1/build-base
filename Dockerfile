FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
    autoconf \
    autotools-dev \
    build-essential \
    libtool \
    && rm -rf /var/lib/apt/lists/*
