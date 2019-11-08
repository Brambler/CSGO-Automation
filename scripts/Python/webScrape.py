import os
import urllib.request
from urllib.request import Request, urlopen
from bs4 import BeautifulSoup

updates = "http://blog.counter-strike.net/index.php/category/updates/"
page = urllib.request.urlopen(updates)
soup = BeautifulSoup(page, from_encoding="utf-8", features="lxml")

header = open('header.txt', 'w')

print (soup.find_all("h2"),file = header)
header.close()

new=open("header.txt","r")
origin=open("headerOrig.txt","r")

origUpdate = '/home/wvu/scripts/./webScrapeOrig.sh'
update = '/home/wvu/scripts/./update.sh'

for line1 in new:
    for line2 in origin:
        if line1==line2:
            print ("No Changes")
        else:
            os.system(origUpdate)
            os.system(update)
            print ("updating")
        break
new.close()
origin.close()
quit()
