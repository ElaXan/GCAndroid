import os
import subprocess
import requests
import shutil
import zipfile
from pathlib import Path
import Utils.info as info
from tqdm import tqdm
home = Path.home()
colors = info.colors()
info = info.info()

# Check if folders exist
def check_folder(path):
    """Checking if folder exists or not

    Args:
        path (_type_): _description_
        
    Returns:
        _type_: _description_
    """
    if not os.path.exists(path):
        return False
    else:
        return True
    
# Check if files exist
def check_file(path):
    """Checking if file exists or not

    Args:
        path (_type_): _description_

    Returns:
        _type_: _description_
    """
    if not os.path.isfile(path):
        return False
    else:
        return True

# Move file
def move(path, new_path):
    try:
        if not (check_file(new_path)):
            print(f"{info.info} Moving file from {path} to {new_path}", end="")
            shutil.move(path, new_path)
            print(f"\r\033[F\033[2K{info.success} Moved file from {path} to {new_path}")
            return True
        else:
            print(f"{info.warning} Skip moving file because file already exists")
            return True
    except Exception as e:
        print(f"\r\033[F\033[2K{info.error} Failed to move file from {path} to {new_path}\n{e}")

# Remove file
def remove(path):
    try:
        if (check_file(path)):
            print(f"{info.info} Removing file from {path}")
            os.remove(path)
            print(f"\r\033[F\033[2K{info.success} Removed file from {path}")
            return True
        else:
            print(f"{info.warning} Skip removing file because file not exists")
            return True
    except Exception as e:
        print(f"{info.error} Failed to remove file from {path}\n{e}")
        return False
    
def replace_text(path, old_text, new_text):
    try:
        if (check_file(path)):
            print(f"{info.info} Replacing text from {path}")
            with open(path, "r") as file:
                lines = file.readlines()
            with open(path, "w") as file:
                for line in lines:
                    file.write(line.replace(old_text, new_text))
            print(f"\r\033[F\033[2K{info.success} Replaced text from {path}")
            return True
        else:
            print(f"{info.warning} Skip replacing text because file not exists")
            return True
    except Exception as e:
        print(f"{info.error} Failed to replace text from {path}\n{e}")
        return False
    
# Change permission
def change_permission(path, permission):
    try:
        if (check_file(path)):
            print(f"{info.info} Changing permission of {path} to {permission}")
            os.chmod(path, permission)
            return True
        else:
            print(f"{info.warning} Skip changing permission because file not exists")
            return True
    except Exception as e:
        print(f"{info.error} Failed to change permission of {path} to {permission}\n{e}")
        return False

def extract_zip(path, new_path):
    try:
        if (check_folder(new_path)):
            print(f"{info.warning} Skip extracting zip because folder already exists")
            return True
        with zipfile.ZipFile(path, 'r') as zip_ref:
            for file in zip_ref.namelist():
                # get percent and ignore after dot
                percent = str(round(zip_ref.namelist().index(file) / len(zip_ref.namelist()) * 100, 2)).split(".")[0]
                # Hide a cursor
                print("\033[?25l", end="")
                zip_ref.extract(file, new_path)
                get_terminal_size = os.get_terminal_size()
                # Clear 2 lines
                print(f"\r\033[F\033[2K{colors.green}[{percent}%]{colors.clear} Extracting : {file}"[:get_terminal_size.columns + 15])
        print(f"\r\033[F\033[2K{info.success} Extracting zip from {path} to {new_path}")
        # Show a cursor
        print("\033[?25h", end="")
        return True
    except Exception as e:
        print("\033[?25h", end="")
        print(f"{info.error} Failed to extract zip from {path} to {new_path}\n{e}")
        exit(1)

# Download File
def download_file(url, path):
    try:
        if not (check_file(path)):
            print(f"{info.running} Downloading file {path}"[:os.get_terminal_size().columns + 15])
            r = requests.get(url, stream=True)
            size = int(r.headers.get('Content-Length', 0))
            block_size = 1024
            progress_bar = tqdm(total=size, unit='iB', unit_scale=True)
            with open(path, 'wb') as f:
                for data in r.iter_content(block_size):
                    # progress_bar.update(len(data))
                    progress_bar.update(len(data))
                    f.write(data)
            print(f"\r\033[F\033[2K{info.success} {path} Downloaded")
        else:
            print(f"{info.info} File already downloaded")
            return True
    except Exception as e:
        print(f"\033[F\033[2K{info.error} Failed to download file from {url}\n{e}")
        exit(1)
    
# Clone repository
def clone_repositories(url, name_repo):
    if not (check_folder(name_repo)):
        print(f"{info.info} Cloning repository {name_repo}")
        subprocess.Popen(f"git clone {url}", shell=True).wait()
        print(f"\r\033[F\033[2K{info.success} Cloned repository {name_repo}")
    else:
        print(f"{info.info} Repository already cloned")
        return True