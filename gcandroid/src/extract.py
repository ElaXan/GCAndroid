from check import check_folder
from colorama import Fore as color
import sys
import os
import zipfile

def extract_zip(path, new_path):
    try:
        if (check_folder(new_path)):
            print(f"[{color.YELLOW}X{color.RESET}] Skip extracting zip because folder already exists")
            exit(2)
        with zipfile.ZipFile(path, 'r') as zip_ref:
            for file in zip_ref.namelist():
                # get percent and ignore after dot
                percent = str(round(zip_ref.namelist().index(
                    file) / len(zip_ref.namelist()) * 100, 2)).split(".")[0]
                # Hide a cursor
                print("\033[?25l", end="")
                zip_ref.extract(file, new_path)
                get_terminal_size = os.get_terminal_size()
                # Clear 2 lines
                print(f"\r\033[F\033[2K{color.GREEN}[{percent}%]{color.RESET} Extracting : {file}"[
                        :get_terminal_size.columns + 15])
        print(
            f"\r\033[F\033[2K[{color.GREEN}✓{color.RESET}] Extracting zip from {path} to {new_path}")
        exit(0)
    except Exception as e:
        print(f"[{color.RED}X{color.RESET}] Failed to extract zip from {path} to {new_path}\n{e}")
        exit(1)
    finally:
        print("\033[?25h", end="")

if __name__ == "__main__":
    if len(sys.argv) == 1:
        print("Usage: python3 extract.py <path to zip> <path to extract>")
        exit(1)
    elif len(sys.argv) == 2:
        print("Usage: python3 extract.py <path to zip> <path to extract>")
        exit(1)
    elif len(sys.argv) == 3:
        extract_zip(sys.argv[1], sys.argv[2])