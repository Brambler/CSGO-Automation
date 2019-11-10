#!/bin/bash

# Deps and screen install & update
dpkg --add-architecture i386 -y
apt-get install gcc-multilib libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386 libc6:i386 lib32stdc++6 lib32gcc1 screen -y
apt-get update && apt-get upgrade -y
clear
cd
read -p "Name your install dir: " installDir
clear
mkdir $installDir
cd $installDir/
mkdir steam
cd steam/
wget http://media.steampowered.com/client/steamcmd_linux.tar.gz
tar xfvz steamcmd_linux.tar.gz

./steamcmd.sh +login anonymous +force_install_dir ../$installDir/ +app_update 740 validate +quit
cd ../