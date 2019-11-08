#!/bin/bash
echo "++++++++++++++++++" >> /home/wvu/wvu_server.log
dt=$(date '+%d/%m/%Y %H:%M:%S');
#copies demo files from
cd /home/wvu/steam/WVU/csgo/
echo "Time of upload --- $dt" >> /home/wvu/wvu_server.log
echo "" >> /home/wvu/wvu_scrim-transfer-log.txt
cp -v *.dem /home/wvu/transferFolder/ >> /home/wvu/wvu_server.log
echo "" >> /home/wvu/wvu_scrim-transfer-log.txt
cd /home/wvu/scripts/

#uploads to gdrive
sudo ./gdrive sync upload --keep-largest /home/wvu/transferFolder/ YOUR_GOOGLE_DRIVE_FOLDER >> /home/wvu/wvu_server.log
echo "" >> /home/wvu/wvu_server.log
echo "" >> /home/wvu/wvu_server.log
