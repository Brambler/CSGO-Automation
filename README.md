 # CSGO-Automation

*The goal is to automate my CS:GO servers that they will always be running and up-to-date. Also with the automation of uploading demos from the WVU CSGO team's Scrim Server to our team google drive.*

## What is here
### Start Server 
This script is ran at startup via a cronjob.

This script starts a screen session and then run a correct parameters that is needed to start the correct server.

***Example start line***
```
screen -A -m -d -S WVU_server ./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 1 +mapgroup mg_active -tickrate 128 +map de_cache -maxplayers_override 12 +sv_setsteamaccount YOUR_STEAM_KEY -authkey YOUR_AUTH_KEY -port 27015
```
### Update Server
This script kills all screen sessions, then runs an update command via steamCMD.

***Example Update Line***
```
./steamcmd.sh +login anonymous +force_install_dir ./WVU/ +app_update 740 validate +quit
```
### Demo Auto Upload & Clean Demos
To accomplish the need to automate the demo uploads to google drive, I wrote two scripts that are ran on schedules. 
- The **DemoAutoUpload** script runs hourly, and it scans the scrim server's folder for ".dem" files.
It copies the demos to a folder on the users home dir, then runs **gdrive** to upload all files in that folder to the google drive folder.
- The **CleanDemo** script runs once every week on sundays and it moves all demo files from the csgo folder to the transfer folder on the home dir. Uploads all demos in folder, and the deletes all files in the transfer folder. 

### Auto update
So after many months of research on how to have your CS:GO server AutoUpdate I thought of a non conventional way of auto updating. First is that I run the update script everyday at 3AM *that would be all I would need, but the game updates at random times and the server is being used daily*. The second course of action that I took was that I will scrape the website that valve and CSGODev uses to show patch notes. 

The **webScraping** script is written in python3.8
-	This is the guide that I got most of my information on how to build the web scraper is linked [here](https://www.analyticsvidhya.com/blog/2015/10/beginner-guide-web-scraping-beautiful-soup-python/).
- If you use this webscraper I wrote you will need to install this parser **"lxml"** via pip.
- You will also be using python packages; **"bs4", "urllib"**
	- I used two python scripts to achieve the AutoUpdates
			- First is "webScrape" this is the script that is called hourly via cronjob
			- It scrapes the [patchnotes blog](https://blog.counter-strike.net/index.php/category/updates/) for the h2 tag and writes to a txt file
			- The script then compares the txt file that was scraped against the an original txt file that is scraped from and if there is an update it will run the update script. If the txt file is the same as the original it will not do anything.
	- The second script is called when there is an update and will just reset the headerOriginal txt file that the scraper script compares against.

### Whats to come?
I will be working on combining my CSGO deploy repo with this one, I just have to completely rewrite that script and iron out some kinks with it. Expect updates soon regarding that project. Current link to that repo while it is still up: [here](https://github.com/Brambler/Bramble-CSGO)

  
## If there is any Issues/Questions please submit an issue ticket
