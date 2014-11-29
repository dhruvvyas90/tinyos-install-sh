#!/bin/bash

echo "Installing msp tools..."
sudo apt-get -y -q install msp430mcu msp430-libc mspdebug gcc-msp430 gdb-msp430
echo "Ok."
echo "Installing nesc dependancies.."
sudo apt-get -y -q automake autoconf emacs gperf bison flex git
echo "Ok"
echo "Downloading necs github source."
mkdir ~/github/
cd ~/github/
git clone https://github.com/tinyos/nesc
echo "Installing nesc"
cd nesc
./Bootstrap && ./configure && make && sudo make install
cd ..
echo "Downloading tinyos-main source"
git clone https://github.com/tinyos/tinyos-main
echo "Installing tinyos"
cd tinyos-main/tools
./Bootstrap && ./configure && make && sudo make install
cd ~
echo "Installation done."
