
import os
from colorama import Fore
import gcandroid_py.idk as EXA
import gcandroid as MAIN

def InstallMongodb():
    try:
        if os.path.exists("/usr/bin/mongo"):
            print(EXA.WarningInfo + "Mongodb already installed!")
        else:
            os.system("sudo apt install mongodb")
    except OSError as e:
        print(EXA.WarningInfo + "Failed install mongodb")
        print("Error Output : ")
        print(e)
        input("Press enter for back to Main Menu!")
        MAIN.main_menu()
    except AttributeError as e:
        print(EXA.ErrorInfo + "Unknown ERROR")
        print(Fore.RED + "Error Output " + Fore.RESET + ": ")
        print(e)
        exit(1)