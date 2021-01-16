#!/bin/sh
BUSYBOX_VERSION=1.33.0
if ! which arm-linux-gnueabi-gcc > /dev/null; then
  echo "Installing cross compiler..."
  sudo apt-get install gcc-arm-linux-gnueabi binutils-arm-linux-gnueabi g++-arm-linux-gnueabi
fi
cd /tmp
echo "Downloading busybox sources..."
wget https://www.busybox.net/downloads/busybox-${BUSYBOX_VERSION}.tar.bz2
tar -xf busybox-${BUSYBOX_VERSION}.tar.bz2
cd busybox-${BUSYBOX_VERSION}
make CROSS_COMPILE=arm-linux-gnueabi- defconfig
make CROSS_COMPILE=arm-linux-gnueabi-
