#!/bin/bash
echo "++++++++++++++++++" >> /home/wvu/wvu_server.log
dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "--- Time of Update Script Initiated --- $dt" >> /home/wvu/wvu_server.log
killall screen
cd /home/wvu/steam/
clear
echo "Updating @WestVirginia - Check /home/wvu/wvu_server.log for progress"
echo "" >> /home/wvu/wvu_server.log
./steamcmd.sh +login anonymous +force_install_dir ./WVU/ +app_update 740 validate +quit >> /home/wvu/wvu_server.log
clear
echo "Updating PUG - Check /home/wvu/wvu_server.log for progress"
./steamcmd.sh +login anonymous +force_install_dir ./PUG/ +app_update 740 validate +quit >> /home/wvu/wvu_server.log
clear
echo "Updating WINGMAN - Check /home/wvu/wvu_server.log for progress"
./steamcmd.sh +login anonymous +force_install_dir ./WINGMAN/ +app_update 740 validate +quit >> /home/wvu/wvu_server.log
clear
echo "" >> /home/wvu/wvu_server.log
cd /home/wvu/scripts/
./start.sh
