#!/bin/bash

docker pull ubuntu:xenial
docker build -t "fuco1/build-base:1.0" .
