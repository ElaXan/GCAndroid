#!/bin/python3

import os
from re import L
import urllib
from urllib import request as Download
import zipfile
import shutil
import stat
from glob import glob as goblok
import gcandroid_py.idk as EXA
import gcandroid as MAIN



def InstallGrasscutter():
    try:
        MAIN.credit_hah()
        if not os.path.exists("/usr/bin/java"):
            print(EXA.ProgressInfo + "Installing Java")
            os.system("sudo apt install openjdk-17-jdk")
            MAIN.credit_hah()
        print(EXA.ProgressInfo + "Download Grasscutter.zip")
        Download.urlretrieve("https://github.com/Grasscutters/Grasscutter/archive/refs/heads/development.zip", "Grasscutter.zip")
        with zipfile.ZipFile("Grasscutter.zip", "r") as unzip:
            print(EXA.ProgressInfo + "Unzip Grasscutter.zip")
            unzip.extractall()
            unzip.close()
        print(EXA.ProgressInfo + "Rename Grasscutter-development to Grasscutter")
        os.rename("Grasscutter-development", "Grasscutter")
        if not os.path.exists("Grasscutter"):
            print(EXA.ErrorInfo + "Failed, Grasscutter folder not found")
            input("Press enter for back to Main Menu")
            MAIN.main_menu()
        else:
            os.chdir("Grasscutter")
        print(EXA.ProgressInfo + "Download Resources")
        Download.urlretrieve("https://github.com/tamilpp25/Grasscutter_Resources/archive/refs/heads/3.0.zip", "Resources.zip")
        with zipfile.ZipFile("Resources.zip", "r") as unzipResources:
            print(EXA.ProgressInfo + "Extract Resources [PLEASE WAIT]")
            unzipResources.extractall()
            unzipResources.close()
        print(EXA.ProgressInfo + "Move Resources")
        for move_resources in goblok("Grasscutter_Resources*"):
            shutil.move(move_resources + "/Resources", "resources")
            shutil.rmtree(move_resources)
    except OSError as e:
        print(EXA.ErrorInfo + "Error cant continue!")
        print("Error output : ")
        print(e)
        input("Press enter for back to Main Menu!")
        MAIN.main_menu()
    except TypeError as e:
        print(EXA.ErrorInfo + "TypeError detect")
        print("Output Error: ")
        print(e)
        input("Press enter for back to Main Menu!")
        MAIN.main_menu()
    except KeyboardInterrupt:
        print(EXA.WarningInfo + "Install cancelled by User")
        exit(1)
    except Exception as e:
        print(EXA.ErrorInfo + "Unknown Error")
        print("Error output : ")
        print(e)
        input("Press enter for back to Main Menu!")
        MAIN.main_menu()
    print(EXA.ProgressInfo + "Compile Jar/Grasscutter!")
    os.chmod("gradlew", stat.S_IEXEC)
    compileJar = os.system("sudo ./gradlew jar")
    if compileJar != 0:
        MAIN.credit_hah()
        print(EXA.ErrorInfo + "Failed to compile jar")
        print("Press enter for back to Main Menu!")
        MAIN.main_menu()
    MAIN.credit_hah()
    print(EXA.ProgressInfo + "Rename grasscutter")
    for rename_grass in goblok("grasscutter*.jar"):
        os.rename(rename_grass, "grasscutter.jar")
    os.system("timeout --foreground 5s java -jar grasscutter.jar")
    MAIN.credit_hah()
    if os.path.exists("config.json"):
        print(EXA.ProgressInfo + "Edit Port from config.json")
        config = "config.json"
        open_config = open(config, "r")
        read_config = open_config.read()
        open_config.close()
        replace_text = read_config.replace("\"bindPort\": 443", "\"bindPort\": 54321")
        replacing_file = open(config, "w")
        replacing_file.write(replace_text)
        replacing_file.close()
    else:
        print(EXA.ErrorInfo + "config.json not found")
        ConfigJsonNotFound = True
    print(EXA.ProgressInfo + "Clean Up")
    os.remove("Resources.zip")
    os.chdir("..")
    os.remove("Grasscutter.zip")
    if ConfigJsonNotFound == True:
        print(EXA.ErrorInfo + "Grasscutter already install but you need to compile it by yourself")
    else:
        print(EXA.ProgressInfo + "Success Install Grasscutter")
    input("Press enter for back to Main Menu!")
    MAIN.main_menu()