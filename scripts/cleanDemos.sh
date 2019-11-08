#!/bin/bash
echo "++++++ CLEANED DEMO FILES ++++++" >> /home/wvu/wvu_server.log
cd /home/wvu/steam/WVU/csgo/
mv *.dem /home/wvu/transferFolder/ >> /home/wvu/wvu_server.log
rm -r /home/wvu/transferFolder/* >> /home/wvu/wvu_server.log
