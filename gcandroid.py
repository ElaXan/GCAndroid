#!/bin/python3

# This only for test!, i still learning Python so there is dummy code there. but i will add code as i can

from time import sleep
from colorama import Fore
import sys
import gcandroid_py.runGrasscutter as rg
import gcandroid_py.InstallGrasscutter as ig
import gcandroid_py.Data as EXA
import gcandroid_py.installMongodb as iM



def main_menu():
    try:
        EXA.credit_hah()
        print("1. " + Fore.CYAN + "Run Grasscutter" + Fore.RESET)
        print("2. " + Fore.CYAN + "Install Grasscutter" + Fore.RESET)
        print("3. " + Fore.CYAN + "Install Mongodb" + Fore.RESET)
        print("0. " + Fore.RED + "Exit" + Fore.RESET)
        main_menu_input = input("Enter input : ")
        if main_menu_input == "1":
            rg.Run()
        elif main_menu_input == "2":
            ig.InstallGrasscutter()
        elif main_menu_input == "3":
            iM.InstallMongodb()
        elif main_menu_input == "0":
            exit()
        else:
            print(EXA.ErrorInfo + "Wrong input!")
            sleep(1)
            main_menu()
    except NameError as e:
        print("???")
        print(e)
    except KeyboardInterrupt:
        print("\nScript exit by user")
        exit()

if __name__ == '__main__':
    try:
        if sys.argv[1] == "1":
            rg.Run()
        elif sys.argv[1] == "2":
            ig.InstallGrasscutter()
        elif sys.argv[1] == "3":
            iM.InstallMongodb()
    except IndexError:
        main_menu()