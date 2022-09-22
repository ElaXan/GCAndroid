#!/bin/python3

# This only for test!, i still learning Python so there is dummy code there. but i will add code as i can

import glob
import os
import shutil
from time import sleep
import zipfile
from colorama import Fore
import urllib.request
import stat
import sys

PathGrasscutter = "Grasscutter"
versionScript = "2.1.2"
ProgressInfo = Fore.GREEN + "I: " + Fore.RESET
ErrorInfo = Fore.RED + "E: " + Fore.RESET
WarningInfo = Fore.YELLOW + "W: " + Fore.RESET

def RunGrasscutter():
    print("Run Grasscutter")
    if not os.path.exists("/usr/bin/mongo"):
        print(Fore.RED + "E: " + Fore.RESET + "mongodb not installed")
        exit()
    if not os.path.exists(f"{PathGrasscutter}"):
        print(Fore.RED + "E: " + Fore.RESET + "Grasscutter folder not found")
        exit()
    os.system("sudo service mongodb start")
    if not os.path.exists(f"{PathGrasscutter}/grasscutter.jar"):
        print(Fore.RED + "E: " + Fore.RESET + "grasscutter.jar not found!")
        exit()
    else:
        os.chdir(f"{PathGrasscutter}")
        os.system("java -jar grasscutter.jar")
    exit()

def InstallGrasscutter():
    try:
        credit_hah()
        if not os.path.exists("/usr/bin/java"):
            print(ProgressInfo + "Installing Java")
            os.system("sudo apt install openjdk-17-jdk")
            credit_hah()
        if os.system("java --version | grep \"openjdk 18\" > /dev/null 2>&1"):
            print(ProgressInfo + "Skip Update Java")
        elif not os.system("java --version | grep \"openjdk 17\" > /dev/null 2>&1"):
            print(WarningInfo + "Java version not 17, trying to update")
            os.system("sudo apt install openjdk-17-jdk")
        print(ProgressInfo + "Download Grasscutter.zip")
        urllib.request.urlretrieve("https://github.com/Grasscutters/Grasscutter/archive/refs/heads/development.zip", "Grasscutter.zip")
        with zipfile.ZipFile("Grasscutter.zip", "r") as unzip:
            print(ProgressInfo + "Unzip Grasscutter.zip")
            unzip.extractall()
            unzip.close()
        print(ProgressInfo + "Rename Grasscutter-development to Grasscutter")
        os.rename("Grasscutter-development", "Grasscutter")
        if not os.path.exists("Grasscutter"):
            print(ErrorInfo + "Failed, Grasscutter folder not found")
            exit()
        else:
            os.chdir("Grasscutter")
        print(ProgressInfo + "Download Resources")
        urllib.request.urlretrieve("https://github.com/tamilpp25/Grasscutter_Resources/archive/refs/heads/3.0.zip", "Resources.zip")
        with zipfile.ZipFile("Resources.zip", "r") as unzipResources:
            print(ProgressInfo + "Extract Resources [PLEASE WAIT]")
            unzipResources.extractall()
            unzipResources.close()
        print(ProgressInfo + "Move Resources")
        for move_resources in glob.glob("Grasscutter_Resources*"):
            shutil.move(move_resources + "/Resources", "resources")
            shutil.rmtree(move_resources)
    except OSError as e:
        print(ErrorInfo + "Error cant continue!")
        print("Error output : ")
        print(e)
        exit(1)
    except TypeError as e:
        print(ErrorInfo + "TypeError detect")
        print("Output Error: ")
        print(e)
        exit(1)
    except KeyboardInterrupt:
        print(WarningInfo + "Install cancelled by User")
        exit(1)
    except Exception as e:
        print(ErrorInfo + "Unknown Error")
        print("Error output : ")
        print(e)
        exit(1)
    print(ProgressInfo + "Compile Jar/Grasscutter!")
    os.chmod("gradlew", stat.S_IEXEC)
    os.system("sudo ./gradlew jar")
    os.system("clear")
    print(ProgressInfo + "Rename grasscutter")
    for rename_grass in glob.glob("grasscutter*.jar"):
        os.rename(rename_grass, "grasscutter.jar")
    os.system("timeout --foreground 5s java -jar grasscutter.jar")
    credit_hah()
    if os.path.exists("config.json"):
        print(Fore.GREEN + "I: " + "Edit Port from config.json")
        config = "config.json"
        open_config = open(config, "r")
        read_config = open_config.read()
        open_config.close()
        replace_text = read_config.replace("\"bindPort\": 443", "\"bindPort\": 54321")
        replacing_file = open(config, "w")
        replacing_file.write(replace_text)
        replacing_file.close()
    else:
        print(ErrorInfo + "config.json not found")
        ConfigJsonNotFound = True
    print(ProgressInfo + "Clean Up")
    os.remove("Resources.zip")
    os.chdir("..")
    os.remove("Grasscutter.zip")
    if ConfigJsonNotFound == True:
        print(ErrorInfo + "Grasscutter already install but you need to compile it by yourself")
    else:
        print(ProgressInfo + "Success Install Grasscutter")
    input("Press enter for back to Main Menu!")
    main_menu()
        
def InstallMongodb():
    try:
        if os.path.exists("/usr/bin/mongo"):
            print(WarningInfo + "Mongodb already installed!")
        else:
            os.system("sudo apt install mongodb")
    except OSError as e:
        print(WarningInfo + "Failed install mongodb")
        print("Error Output : ")
        print(e)
        input("Press enter for back to Main Menu!")
        main_menu()
    except AttributeError as e:
        print(ErrorInfo + "Unknown ERROR")
        print(Fore.RED + "Error Output " + Fore.RESET + ": ")
        print(e)
        exit(1)

def credit_hah():
    os.system("clear")
    print("=========================")
    print(Fore.GREEN + "Script made by ElaXan" + Fore.RESET)
    print("=========================")
    print(Fore.CYAN + "This just for test (Python)" + Fore.RESET)
    print("=========================")
    
def main_menu():
    try:
        credit_hah()
        print("1. " + Fore.CYAN + "Run Grasscutter" + Fore.RESET)
        print("2. " + Fore.CYAN + "Install Grasscutter" + Fore.RESET)
        print("3. " + Fore.CYAN + "Install Mongodb" + Fore.RESET)
        print("0. " + Fore.RED + "Exit" + Fore.RESET)
        main_menu_input = input("Enter input : ")
        if main_menu_input == "1":
            RunGrasscutter()
        elif main_menu_input == "2":
            InstallGrasscutter()
        elif main_menu_input == "3":
            InstallMongodb()
        elif main_menu_input == "0":
            exit()
        else:
            print(ErrorInfo + "Wrong input!")
            sleep(1)
            main_menu()
    except NameError as e:
        print("???")
        print(e)
    except KeyboardInterrupt:
        print("\nScript exit by user")
        exit()
 
try:
    if sys.argv[1] == "1":
        RunGrasscutter()
    elif sys.argv[1] == "2":
        InstallGrasscutter()
    elif sys.argv[1] == "3":
        InstallMongodb()
except IndexError:
    main_menu()

if __name__ == '__main__':
    main_menu()