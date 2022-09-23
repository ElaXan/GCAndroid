#!/bin/python3
import glob
import os
import shutil
from time import sleep
import zipfile
from colorama import Fore
import urllib.request
import stat
import sys
import requests
import re
from requests import get

def mainScript():
    test = get("https://raw.githubusercontent.com/ElaXan/GCAndroid/main/updateinfo").text
    version = 'newVersionScript'
    for name in glob.glob(version):
        print("anjing")
        print(name)
    print("Fuck you")

if __name__ == "__main__":
    mainScript()