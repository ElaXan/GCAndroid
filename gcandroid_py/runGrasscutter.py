#!/bin/python3

import os
from colorama import Fore
import gcandroid_py.idk as EXA
import gcandroid as MAIN

def Run():
    MAIN.credit_hah()
    if not os.path.exists("/usr/bin/mongo"):
        print(Fore.RED + "E: " + Fore.RESET + "mongodb not installed")
        input("Press enter for back to Main Menu!")
        MAIN.main_menu()
    if not os.path.exists(f"{EXA.PathGrasscutter}"):
        print(Fore.RED + "E: " + Fore.RESET + "Grasscutter folder not found")
        input("Press enter for back to Main Menu!")
        MAIN.main_menu()
    os.system("sudo service mongodb start")
    if not os.path.exists(f"{EXA.PathGrasscutter}/grasscutter.jar"):
        print(Fore.RED + "E: " + Fore.RESET + "grasscutter.jar not found!")
        input("Press enter for back to Main Menu!")
        MAIN.main_menu()
    else:
        print(EXA.ProgressInfo + "Run Grasscutter!")
        os.chdir(f"{EXA.PathGrasscutter}")
        os.system("java -jar grasscutter.jar")
    