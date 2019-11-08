#!/bin/bash
echo "++++++++++++++++++" >> /home/wvu/wvu_server.log
dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "Start Script Initiated --- $dt" >> /home/wvu/wvu_server.log

killall screen
clear
cd /home/wvu/steam/
echo "STARTING @WestVirginaU" >> /home/wvu/wvu_server.log
cd WVU/
screen -A -m -d -S WVU_server ./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 1 +mapgroup mg_active -tickrate 128 +map de_cache -maxplayers_override 12 +sv_setsteamaccount YOUR_STEAM_KEY -authkey YOUR_STEAM_KEY -steam_dir /home/wvu/steam/ -steamcmd_script /home/wvu/steam/@WestVirginiaU.txt -port 27015
sleep 2
clear
echo "" >> /home/wvu/wvu_server.log
echo "@WestVirginiaU Started" >> /home/wvu/wvu_server.log
#echo "STARTING WINGMAN"
#cd ../WINGMAN/
#screen -A -m -d -S WINGMAN_server ./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 2 +mapgroup mg_active -tickrate 128 +map de_inferno -maxplayers_override 5 +sv_setsteamaccount YOUR_STEAM_KEY -authkey YOUR_STEAM_KEY -host_workshop_collection 1381142256 -port 27019
#sleep 2
#clear
#echo "STARTING PUG SERVER"
#cd ../PUG/
#screen -A -m -d -S PUG_server ./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 1 +mapgroup mg_active -tickrate 128 +map de_mirage -maxplayers_override 12 +sv_setsteamaccount YOUR_STEAM_KEY -port 27025
#sleep 2
#clear
echo "" >> /home/wvu/wvu_server.log
echo "" >> /home/wvu/wvu_server.log
