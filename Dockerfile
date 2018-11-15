FROM ubuntu@sha256:76702ec53c5e7771ba3f2c4f6152c3796c142af2b3cb1a02fce66c697db24f12

RUN apt-get update && apt-get install -y \
    autoconf \
    autotools-dev \
    build-essential \
    libtool \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*
