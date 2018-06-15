# initialize from the image

FROM debian:9

# install build tools and dependencies

RUN apt-get update && apt-get install -y \
    build-essential wget git python3-pip gcc-multilib

# download toolchain

ENV TOOLCHAIN_SHORTVER=7-2017q4
ENV TOOLCHAIN_LONGVER=gcc-arm-none-eabi-7-2017-q4-major
ENV TOOLCHAIN_FLAVOR=linux
ENV TOOLCHAIN_URL=https://developer.arm.com/-/media/Files/downloads/gnu-rm/$TOOLCHAIN_SHORTVER/$TOOLCHAIN_LONGVER-$TOOLCHAIN_FLAVOR.tar.bz2

# extract toolchain

RUN cd /opt && wget $TOOLCHAIN_URL && tar xfj $TOOLCHAIN_LONGVER-$TOOLCHAIN_FLAVOR.tar.bz2

# setup toolchain

ENV PATH=/opt/$TOOLCHAIN_LONGVER/bin:$PATH

# install python tools

RUN pip3 install scons==3.0.1
RUN pip3 install flake8==3.5.0
RUN pip3 install pytest==3.4.2
RUN pip3 install ecdsa==0.13 mnemonic==0.18 requests
RUN pip3 install click==6.7 pyblake2==1.1.0 rlp==0.6.0
RUN pip3 install --no-deps trezor==0.9.1

# workarounds for weird default install

RUN ln -s python3 /usr/bin/python
RUN ln -s dist-packages /usr/local/lib/python3.5/site-packages
ENV LC_ALL=C.UTF-8 LANG=C.UTF-8
