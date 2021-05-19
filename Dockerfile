FROM ubuntu@sha256:be154cc2b1211a9f98f4d708f4266650c9129784d0485d4507d9b0fa05d928b6

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    autoconf \
    autotools-dev \
    build-essential \
    libtool \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*
