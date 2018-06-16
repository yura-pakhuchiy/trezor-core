#!/bin/bash
set -e

IMAGE=trezor-core-build
TAG=${1:-2.0.6-zcoin}

docker build -t $IMAGE .

docker run -t -v $(pwd)/build-docker:/build:z $IMAGE /bin/sh -c "\
	pip3 freeze && \
	git clone https://github.com/yura-pakhuchiy/trezor-core && \
	cd trezor-core && \
	ln -s /build build &&
	git checkout $TAG && \
	git submodule update --init --recursive && \
	make clean vendor build_boardloader build_bootloader build_prodtest build_firmware"
