from Utils.info import colors, info, clear, credit
import time
import sys
import main

colors = colors()
info = info()

def home():
    try:
        clear()
        credit()
        print(f"1. {colors.cyan}Install Grasscutter{colors.clear}")
        print(f"2. {colors.cyan}Uninstall Grasscutter{colors.clear}")
        print(f"3. {colors.cyan}Run Grasscutter{colors.clear}")
        print(f"0. {colors.red}Exit{colors.clear}")
        print("")
        user_input = input("Enter your choice: ")
        if user_input == "1":
            main.install_grasscutter()
        elif user_input == "2":
            main.uninstall_grasscutter()
        elif user_input == "3":
            main.run_grasscutter()
        elif user_input == "0":
            exit(0)
        else:
            print("Invalid input")
            time.sleep(1)
            home()
    except KeyboardInterrupt:
        print("Exit by user")
        exit(0)

if __name__ == "__main__":
    if len(sys.argv) == 1:
        home()
    elif len(sys.argv) == 2:
        if sys.argv[1] in ("install", "i", "1"):
            main.install_grasscutter()
        elif sys.argv[1] in ("uninstall", "u", "2"):
            print("TODO: Uninstall Grasscutter")
        elif sys.argv[1] in ("run", "r", "3"):
            print("TODO: Run Grasscutter")
        else:
            home()