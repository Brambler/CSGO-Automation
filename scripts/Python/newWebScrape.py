import os
import os.path
import urllib.request
from urllib.request import Request, urlopen
from bs4 import BeautifulSoup

'''
main()
originalCheck
Checks if there is an original header.txt
If not run headerOrig
If there is go to updateCheck

updateCheck
Checks against origHeader.txt
if change run update script
if no change end script 
'''

def main():
    originalCheck()
    if original == "exists":
        updateCheck()
    else:
        originalHeader()

def originalCheck():
    if os.path.isfile('headerOriginal.txt'):
        original = "exists"
    else:
        original = "notexists"
    return original

def originalHeader():
    updatesOriginal = "http://blog.counter-strike.net/index.php/category/updates/"
    pageOriginal = urllib.request.urlopen(updatesOriginal)
    soupOriginal = BeautifulSoup(pageOriginal, from_encoding="utf-8", features="lxml")
    headerOriginal = open('headerOrig.txt', 'w')
    print (soupOriginal.find_all("h2"),file = headerOriginal)
    headerOriginal.close()

def updateCheck():
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

main()

