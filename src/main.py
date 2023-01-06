import Utils.Files as Files
import Utils.Program as Program
import os
import stat

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