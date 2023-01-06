from colorama import Fore as color

class info:
    def __init__(self):
        self.green = color.GREEN
        self.clear = color.RESET
        self.info = f"{color.CYAN}[INFO]{color.RESET}"
        self.error = f"{color.RED}[ERROR]{color.RESET}"
        self.warning = f"{color.YELLOW}[WARNING]{color.RESET}"
        self.success = f"{color.GREEN}[SUCCESS]{color.RESET}"
        self.running = f"{color.MAGENTA}[RUNNING]{color.RESET}"