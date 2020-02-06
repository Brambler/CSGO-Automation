#!/bin/bash
clear
# Deps and screen install & update
dpkg --add-architecture i386
apt-get install gcc-multilib libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386 libc6:i386 lib32stdc++6 -y 
apt-get install lib32gcc1 -y
apt-get install screen -y
apt-get update && apt-get upgrade -y
clear
cd
read -p "Name your install dir: " installDir
clear
# Install Server Files
mkdir steam
cd steam/
wget http://media.steampowered.com/client/steamcmd_linux.tar.gz
tar xfvz steamcmd_linux.tar.gz
./steamcmd.sh +login anonymous +force_install_dir ../$installDir +app_update 740 validate +quit
cd ../
#hostname
cd CSGO-Automation/scripts/AutoDeploy/
clear
read -p "Enter the hostname (Name of your server): " hostnameVar
echo "hostname" "\"$hostnameVar\"" >> CSGO-AUTOMATION/scripts/AutoDeploy/server.cfg
#ServerToken
clear
read -p "Enter your SteamGameServer TOKEN: " steamidVar
echo "sv_setsteamaccount" "\"$steamidVar\"" >> CSGO-AUTOMATION/scripts/AutoDeploy/server.cfg
#Password (Yes or No)
clear
while true; do
    read -p "Do you wish to Password Protect your server? (Y or N): " yn
    case $yn in
        [Yy]* ) read -p "Enter your desired password: " passwordVar; echo "sv_password" "\"$passwordVar\"" >> CSGO-AUTOMATION/scripts/AutoDeploy/server.cfg; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
#Rcon Password
clear
read -p "Enter your desired rcon password: " rconVar
<<<<<<< Updated upstream
echo "rcon_password" "\"$rconVar\"" >> server.cfg
cd
cp -r CSGO-Automation/scripts/AutoDeploy/server.cfg $installDir/csgo/cfg/
#Prac/Scrim Files
cp -r CSGO-Automation/scripts/AutoDeploy/csgo/addons $installDir/csgo/
cp -r CSGO-Automation/scripts/AutoDeploy/csgo/cfg/get5 $installDir/csgo/cfg/
cp -r CSGO-Automation/scripts/AutoDeploy/csgo/cfg/sourcemod $installDir/csgo/cfg/
clear
cd
rm -r CSGO-Automation/scripts/AutoDeploy
=======
echo "rcon_password" "\"$rconVar\"" >> CSGO-AUTOMATION/scripts/AutoDeploy/server.cfg
cd
mv CSGO-AUTOMATION/scripts/AutoDeploy/server.cfg $installDir/csgo/cfg/
#Prac/Scrim Files
cd
cd CSGO-AUTOMATION/scripts/AutoDeploy/
mv csgo/addons/ $installDir/csgo/; mv csgo/cfg/get5/ $installDir/csgo/cfg/; mv csgo/cfg/sourcemod/ $installDir/csgo/cfg/
clear
cd
rm -r CSGO-AUTOMATION/scripts/AutoDeploy
>>>>>>> Stashed changes
#Create Start and Update scripts
# Start
echo "#!/bin/bash" >> startServer.sh
echo "cd $installDir/" >> startServer.sh
echo "screen -A -m -d -S $installDir ./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 1 +mapgroup mg_active -tickrate 128 +map de_cache -maxplayers_override 12 +sv_setsteamaccount $steamidVar  -port 27015" >> startServer.sh
chmod +x startServer.sh
# Update
echo "#!/bin/bash" >> updateServer.sh
echo "killall screen" >> updateServer.sh
echo "cd steam/" >> updateServer.sh
echo "./steamcmd.sh +login anonymous +force_install_dir ./$installDir/ +app_update 740 validate +quit" >> updateServer.sh
chmod +x updateServer.sh
#Runs start script
./startServer.sh
echo "Server Install Complete"
sleep 2
clear