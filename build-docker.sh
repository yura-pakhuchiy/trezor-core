#!/bin/bash
set -e

IMAGE=trezor-core-build
TAG=${1:-pip-freeze}

docker build -t $IMAGE .

docker run -t -v $(pwd)/build-docker:/build:z $IMAGE /bin/sh -c "\
	git clone https://github.com/yura-pakhuchiy/trezor-core && \
	cd trezor-core && \
	ln -s /build build &&
	git checkout $TAG && \
	pip3 install -r requirements.txt && \
	pip3 freeze && \
	pip3 install --no-deps trezor==0.9.1 && \
	git submodule update --init --recursive && \
	make clean vendor build_boardloader build_bootloader build_prodtest build_firmware"
