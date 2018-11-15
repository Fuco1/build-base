FROM ubuntu@sha256:29934af957c53004d7fb6340139880d23fb1952505a15d69a03af0d1418878cb

RUN apt-get update && apt-get install -y \
    autoconf \
    autotools-dev \
    build-essential \
    libtool \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*
