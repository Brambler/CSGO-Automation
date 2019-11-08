#!/usr/bin/python3
import os
import urllib.request
from urllib.request import Request, urlopen
from bs4 import BeautifulSoup

updates = "http://blog.counter-strike.net/index.php/category/updates/"
page = urllib.request.urlopen(updates)
soup = BeautifulSoup(page, from_encoding="utf-8", features="lxml")

header = open('headerOrig.txt', 'w')

print (soup.find_all("h2"),file = header)
