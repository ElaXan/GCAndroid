#!/bin/python3

from colorama import Fore
import os

PathGrasscutter = "Grasscutter"
versionScript = "2.1.2"
ProgressInfo = Fore.GREEN + "I: " + Fore.RESET
ErrorInfo = Fore.RED + "E: " + Fore.RESET
WarningInfo = Fore.YELLOW + "W: " + Fore.RESET

def credit_hah():
    os.system("clear")
    print("=========================")
    print(Fore.GREEN + "Script made by ElaXan" + Fore.RESET)
    print("=========================")
    print(Fore.CYAN + "This just for test (Python)" + Fore.RESET)
    print("=========================")
    print(Fore.GREEN + "Contact me at zero@elaxan.my.id" + Fore.RESET)
    print("=========================")
