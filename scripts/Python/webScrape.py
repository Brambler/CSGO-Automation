import os
import os.path
import urllib.request
from urllib.request import Request, urlopen
from bs4 import BeautifulSoup

def originalCheck():
    if os.path.isfile('headerOrig.txt'):
        updateCheck()
    else:
        originalHeader()
        
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
    update = '/home/wvu/scripts/./update.sh'

    for line2 in new:
        for line1 in origin:
            if line2==line1:
                print ("No Changes")
            else:
                originalHeader()
                os.system(update)
                print ("updating")
    new.close()
    origin.close()
    quit()

originalCheck()
