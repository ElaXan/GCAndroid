from colorama import Fore as color
import os

version = "2.8.8"
lines = "-" * 40

class colors:
    def __init__(self) -> None:
        self.clear = color.RESET
        self.red = color.RED
        self.green = color.GREEN
        self.yellow = color.YELLOW
        self.blue = color.BLUE
        self.magenta = color.MAGENTA
        self.cyan = color.CYAN
        self.white = color.WHITE
        self.black = color.BLACK

class info:
    def __init__(self) -> None:
        self.clear = color.RESET
        self.info = color.CYAN + "[INFO]" + color.RESET
        self.success = color.GREEN + "[SUCCESS]" + color.RESET
        self.warning = color.YELLOW + "[WARNING]" + color.RESET
        self.error = color.RED + "[ERROR]" + color.RESET
        
def clear():
    os.system("clear")

def credit():
    print(lines)
    center_text(f"Z3RO ElaXan", color.GREEN)
    print(lines)
    center_text(f"Version: {version}", color.CYAN)
    print(lines)

def center_text(text, colors_text):
    get_lines_lenght = len(lines)
    get_text_lenght = len(text)
    get_space_lenght = get_lines_lenght - get_text_lenght
    get_space_lenght = get_space_lenght / 2
    get_space_lenght = int(get_space_lenght)
    print(" " * get_space_lenght + colors_text + text + color.RESET)

