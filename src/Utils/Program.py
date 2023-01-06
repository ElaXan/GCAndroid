import os
import subprocess
import shutil
from Utils.Info import info

info = info()

# Check if program installed
def check_program(program):
    """Checking if program installed or not
    Usage:
        check_program(program)
    """
    if not shutil.which(program):
        return False
    else:
        return True

# Install program
def install_program(program):
    """Installing program
    Usage:
        install_program(program)
    """
    try:
        subprocess.call(["sudo", "apt-get", "install", program, "-y" ], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        return True
    except Exception as e:
        print(f"{info.error} Failed to install {program}\n{e}")
        return False
    
# Install
def install(program, name_program):
    if not (check_program(program)):
        print(f"{info.info} Installing {program}...")
        install_program(name_program)
            
# Run program
def run(name_program):
    """Running program
    Usage:
        run(name_program)
    """
    try:
        print(f"{info.info} Running {name_program}...")
        os.system(name_program)
        return True
    except Exception as e:
        print(f"{info.error} Failed to run {name_program}\n{e}")
        return False
    
def run_timeout(name_program, timeout):
    """Running program with timeout
    Usage:
        run_timeout(name_program, timeout)
    """
    try:
        print(f"{info.running} Running {name_program}...")
        os.system("timeout --foreground " + str(timeout) + " " + name_program)
        print(f"\r\033[F\033[2K{info.success} Finished running {name_program}")
        return True
    except Exception as e:
        print(f"\r\033[F\033[2K{info.error} Failed to run {name_program}\n{e}")
        return False