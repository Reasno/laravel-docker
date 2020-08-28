#!/bin/bash
apt-get update
apt-get install -y git build-essential gcc make yasm autoconf automake cmake libtool checkinstall wget software-properties-common pkg-config libmp3lame-dev libunwind-dev zlib1g-dev
cd ~/
wget https://www.ffmpeg.org/releases/ffmpeg-4.1.tar.gz
tar -xzf ffmpeg-4.1.tar.gz
cd ffmpeg-4.1
./configure --enable-gpl --enable-libmp3lame --enable-decoder=mjpeg,png --enable-encoder=png
make
make install