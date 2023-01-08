import Utils.Files as Files
import Utils.Program as Program
import os
import stat
import time
import selectMenu

from selectMenu import clear, credit

def install_grasscutter():
    clear()
    credit()
    Program.install("java", "openjdk-17-jdk")
    Program.install("git", "git")
    # change directory to home
    os.chdir(Files.home)
    # Clone repository
    Files.clone_repositories("https://github.com/Grasscutters/Grasscutter.git", "Grasscutter")
    # Dowmload file
    Files.download_file("https://gitlab.com/YuukiPS/GC-Resources/-/archive/3.3/GC-Resources-3.3.zip", "GC-Resources-3.3.zip")
    # Extract zip
    Files.extract_zip("GC-Resources-3.3.zip", "GC-Resources-3.3")
    # remove zip
    Files.remove("GC-Resources-3.3.zip")
    # Move file
    Files.move("GC-Resources-3.3/GC-Resources-3.3/Resources", "Grasscutter/resources")
    # Remove Folder
    Files.remove("GC-Resources-3.3")
    # Change directory
    os.chdir("Grasscutter")
    # Change permission
    os.chmod("gradlew", stat.S_IRWXU)
    # Run Program
    Program.run("./gradlew jar")
    # Timeout for generate config.json
    Program.run_timeout("java -jar grasscutter-1.4.5-dev.jar >/dev/null 2>&1", 10)
    # Replace config.json
    Files.replace_text("config.json", "\"bindPort\": 443,", "\"bindPort\": 54321,")
    input("Press enter back to home")
    selectMenu.home()

def uninstall_grasscutter():
    print("TODO: Uninstall Grasscutter")
    time.sleep(1)
    selectMenu.home()
    
def run_grasscutter():
    clear()
    selectMenu.credit()
    # check folders
    if not Files.check_folder(f"{Files.home}/Grasscutter"):
        print("Grasscutter not found")
        time.sleep(1)
        selectMenu.home()
    if not Files.check_file(f"{Files.home}/Grasscutter/grasscutter-1.4.5-dev.jar"):
        print("grasscutter-1.4.5-dev.jar not found")
        time.sleep(1)
        selectMenu.home()
    os.chdir(f"{Files.home}/Grasscutter")
    os.system("java -jar grasscutter-1.4.5-dev.jar")
    selectMenu.home()