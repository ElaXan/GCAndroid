#!/data/data/com.termux/files/usr/bin/bash

# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

Install_Grasscutter_process() {
    if ! command -v unzip &>/dev/null; then
        echo "${GC}Installing unzip command...${WC}"
        apt install unzip -y &>/dev/null
    fi
    if ! command -v git &>/dev/null; then
        echo "${GC}Installing git command...${WC}"
        apt install git -y &>/dev/null
    fi
    if [[ "${Grasscutter_Already_Installed}" == "1" ]]; then
        credit_hah
        echo "${GC}Do you want to keep resources folder?${WC}"
        echo
        echo -n "Enter your choice [y/N] : "
        read Keep_Resources
        if [[ $Keep_Resources == "y" || $Keep_Resources == "Y" ]]; then
            Backup_Resources="1"
        elif [[ $Keep_Resources == "n" || $Keep_Resources == "N" ]]; then
            Backup_Resources="0"
        else
            echo "${RC}Invalid choice${WC}"
            echo
            echo -n "Press enter for back to Menu"
            read
            main_menu
        fi
    fi
    Install_Grasscutter_process_grasscutter="compile"
    credit_hah
    if [[ $Backup_Resources == "1" ]]; then
        echo "${CCB}Backup Resources : ${GC}Yes${WC}"
        if [ -f $grasscutter_path/resources* ]; then
            mv -r $grasscutter_path/resources* $HOME/resourcesBackupGCAndroid.zip
        elif [ -d $grasscutter_path/resources* ]; then
            mv -r $grasscutter_path/resources* $HOME/resourcesBackupGCAndroid
        elif [[ -z $(ls -A $grasscutter_path/resources* 2>/dev/null) ]]; then
            echo "${CCB}Resources : ${RC}Resources is exist but empty${WC}"
            echo
            echo -n "Press enter for back to Menu"
            read
            main_menu
        elif ! (${checkResources} > /dev/null 2>&1); then
            echo "${CCB}Resources : ${RC}Resources is not exist${WC}"
            echo 
            echo -n "Press enter for back to Menu"
            read
            main_menu
        else
            echo "${RC}Errors while backup resources${WC}"
            echo
            echo -n "Press enter for back to Menu"
            read
            main_menu
        fi
        echo $line
    elif [[ $Backup_Resources == "0" ]]; then
        echo "${CCB}Backup Resources : ${GC}No${WC}"
    else
        echo "${CCB}Backup Resources : ${RC}Not Selected${WC}"
    fi
    sleep 1s
    if [[ $Backup_Resources == "0" ]]; then
        clear
        credit_hah
    fi
    Run "pkg up" "Update package" "0" "Menu" "main_menu"
    Run "apt install openjdk-17 -y" "Install Java JDK 17" "0" "Menu" "main_menu"
    if [ -d "$grasscutter_path" ]; then
        Run "rm -rf $grasscutter_path" "Removing Folder $nameFolder" "0" "Menu" "main_menu"
    fi
    sleep 1s
    cd $HOME || exit 1
    if [[ $Install_Grasscutter_process_grasscutter = "compile" ]]; then
        Run "git clone $(jq -r .Grasscutter $Path_Repojson)" "Clone Repository $nameFolder" "0" "Menu" "main_menu"
    fi
    sleep 1s
    cd $HOME || exit 1
    if [[ $Backup_Resources == "0" ]]; then
        Run "wget $(jq -r .Resources $Path_Repojson) -O resourcesGCAndroid.zip" "Download Resources" "0" "Menu" "main_menu"
        echo -n "Do you want to extract resources? (y/N) : "
        read -r Install_Grasscutter_process_grasscutter_extract
        if [[ $Install_Grasscutter_process_grasscutter_extract == "y" ]] || [[ $Install_Grasscutter_process_grasscutter_extract == "Y" ]]; then
            Run "unzip -o resourcesGCAndroid.zip" "Unzip Resources" "0" "Menu" "main_menu"
            mv GC*Resources*/Resources $grasscutter_path/resources
            rm -rf GC*Resources*
            rm resourcesGCAndroid.zip
        else
            Install_Grasscutter_process_grasscutter_extract="n"
            echo "${GC}Skip extracting Resources${WC}"
            mv resourcesGCAndroid.zip $nameFolder/
            sleep 1s
        fi
    fi
    cd $grasscutter_path || exit 1
    credit_hah
    if [[ $Install_Grasscutter_process_grasscutter = "compile" ]]; then
        chmod +x gradlew
        export JAVA_HOME=/data/data/com.termux/files/usr/opt/openjdk
        Run "./gradlew jar" "Compiling grasscutter.jar" "0" "Menu" "main_menu"
        mv grasscutter*.jar grasscutter.jar
    fi
    echo "${GC}Generate config.json${WC}"
    timeout --foreground 8s java -jar grasscutter.jar &>/dev/null
    clear
    credit_hah
    if [[ $Backup_Resources == "1" ]]; then
        if [ -d "$grasscutter_path"/resources ]; then
            rm -rf "$grasscutter_path"/resources
        fi
        if test -f "$HOME"/resourcesBackupGCAndroid.zip && test -d $HOME/resourcesBackupGCAndroid ; then
            mv "$HOME"/resourcesBackupGCAndroid.zip $grasscutter_path/resourcesGCAndroid.zip
            Install_Grasscutter_process_grasscutter_extract="y"
            mv $HOME/resourcesBackupGCAndroid $grasscutter_path/resources
        else
            echo "${RC}Backup resources not found${WC}" 
        fi
    fi
    echo "${GC}Editing config.json...${WC}"
    
    if [ ! -f "config.json" ]; then
        echo "${RC}config.json not found..."
        echo "${YC}Skip edit config.json...${WC}"
    else
        sed -i "s/\"bindPort\": 443/\"bindPort\": 54321/g" config.json
        if [[ $Install_Grasscutter_process_grasscutter_extract == "n" ]] || [[ $Install_Grasscutter_process_grasscutter_extract == "N" ]]; then
            sed -i "s/\"resources\": \".*\"/\"resources\": \".\/resourcesGCAndroid.zip\"/g" config.json
        fi
        sed -i "s/\"welcomeMessage\": \".*\"/\"welcomeMessage\": \"Localhost on Android using GCAndroid(Z3RO ElaXan)\\\n\\\nhttps:\/\/github.com\/Score-Inc\/GCAndroid\"/g" config.json
        sed -i "s/\"nickName\": \".*\"/\"nickName\": \"ElaXan\"/g" config.json
        sed -i "s/\"signature\": \".*\"/\"signature\": \"Welcome to GCAndroid, run with Grasscutter!\"/g" config.json
        sleep 1s
        echo "${GC}Done Set All"
        echo "Address : 127.0.0.1"
        echo "Port : 54321${WC}"
    fi
    echo ""
    echo -n "Press enter for back to Menu!"
    read
    main_menu
}

Download_Resources() {
    credit_hah
    echo -n "${CCB}Are you sure want to download resources only?${WC} (y/N) : "
    read -r Download_Resources_process
    if [[ $Download_Resources_process == "y" ]] || [[ $Download_Resources_process == "Y" ]]; then
        # Check if folder $grasscutter_path exist but empty, if yes then return
        check_folder_empty=$(ls -A "$grasscutter_path")
        if [ -d "$grasscutter_path" ] && [ -z "$check_folder_empty" ]; then
            echo "${RC}Looks like you haven't installed Grasscutter yet${WC}"
            echo -n "Do you want to continue? (y/N) : "
            read -r Download_Resources_process_continue
            if [[ $Download_Resources_process_continue == "y" ]] || [[ $Download_Resources_process_continue == "Y" ]]; then
                echo "${GC}Continue...${WC}"
            else
                echo "${RC}Skip...${WC}"
                sleep 1s
                main_menu
            fi
        elif [ ! -d "$grasscutter_path" ]; then
            mkdir -p "$grasscutter_path"
        fi
        sleep 1s
        cd $grasscutter_path || exit 1
        Run "wget $(jq -r .Resources $Path_Repojson) -O resourcesGCAndroid.zip" "Download Resources" "0" "Menu" "main_menu"
        echo -n "Do you want to extract resources? (y/N) : "
        read -r Download_Resources_process_extract
        if [[ $Download_Resources_process_extract == "y" ]] || [[ $Download_Resources_process_extract == "Y" ]]; then
            Run "unzip -o resourcesGCAndroid.zip" "Unzip Resources" "0" "Menu" "main_menu"
            mv GC*Resources*3.3*/Resources Grasscutter/resources
            rm -rf GC*Resources*3.3*
            rm resourcesGCAndroid.zip
        else
            Download_Resources_process_extract="n"
            echo "${GC}Skip extracting Resources${WC}"
            sleep 1s
        fi
        echo "${GC}Success Download Resources${WC}"
        echo ""
        echo -n "Press enter for back to Menu!"
        read -r
        main_menu
    else
        echo "${GC}Skip Download Resources${WC}"
        sleep 1s
        main_menu
    fi
}

Install_Grasscutter_Jar() {
    credit_hah
    Center_Text "Install Grasscutter Jar"
    if [ ! -d  "$grasscutter_path" ]; then
        echo "${RC}Error${WC}: Folder $grasscutter_path not found"
        read -r
        main_menu
    fi
    if [ -f "$wherethegrassss" ]; then
        echo "${RC}Look like grasscutter.jar exist${WC}"
        printf "Do you want to delete old Grasscutter and continue? (y/N) : "
        read -r Install_Grasscutter_Jar_process
        if [[ $Install_Grasscutter_Jar_process == "y" ]] || [[ $Install_Grasscutter_Jar_process == "Y" ]]; then
            echo "${GC}Continue...${WC}"
            rm -rf "$wherethegrassss"
        else
            echo "${RC}Cancel...${WC}"
            sleep 1s
            main_menu
        fi
    fi
    cd "$grasscutter_path" || sleep 1s && main_menu
    sleep 1s
    Run "pkg up -y" "Update package" "0" "Menu" "main_menu"
    Run "apt install openjdk-17 -y" "Install Java JDK 17" "0" "Menu" "main_menu"
    linkDownloadJar=$(jq -r .JarDownload $Path_Repojson)
    if [ -z "$linkDownloadJar" ]; then
        echo "${RC}Error${WC}: linkDownloadJar is not set"
        read
        main_menu
    fi
    if ! command -v wget > /dev/null 2>&1; then
        Run "pkg install wget -y" "Install wget command" "0" "Menu" "main_menu"
    fi
    echo "${GC}Download grasscutter.jar from ${linkDownloadJar}${WC}"
    Run "wget $linkDownloadJar -O grasscutter.jar" "Download Grasscutter" "0" "Menu" "main_menu"
    echo
    printf "Press enter to go back to Menu"
    read -r
    main_menu
}

Download_Grasscutter() {
    credit_hah
    Center_Text "Download Grasscutter"
    if [ -z "$docker_zip_name" ]; then
        echo "${RC}Error${WC}: docker_zip_name is not set"
        read
        Docker
    fi
    echo -n "${CCB}Are you sure want to download Grasscutter?${WC} (y/N) : "
    read -r Download_Grasscutter_process
    if [[ $Download_Grasscutter_process == "y" ]] || [[ $Download_Grasscutter_process == "Y" ]]; then
        if [ -d "$grasscutter_path" ]; then
            echo "${RC}Looks like you have installed Grasscutter already${WC}"
            echo -n "Do you want to delete old Grasscutter and continue? (y/N) : "
            read -r Download_Grasscutter_process_continue
            if [[ $Download_Grasscutter_process_continue == "y" ]] || [[ $Download_Grasscutter_process_continue == "Y" ]]; then
                echo "${GC}Continue...${WC}"
                rm -rf "$grasscutter_path"
                mkdir -p "$grasscutter_path"
            else
                echo "${RC}Cancel...${WC}"
                sleep 1s
                main_menu
            fi
        else
            mkdir -p "$grasscutter_path"
        fi
        cd $grasscutter_path || exit 1
        Run "wget https://github.com/Score-Inc/GCAndroid/releases/download/DockerGS/$docker_zip_name -O $docker_zip_name" "Download Grasscutter" "0" "Menu" "main_menu"
        Run "unzip -o $docker_zip_name" "Unzip Grasscutter" "0" "Menu" "main_menu"
        rm $docker_zip_name
        Run "wget $(jq -r .Resources $Path_Repojson) -O resourcesGCAndroid.zip" "Download Resources" "0" "Menu" "main_menu"
        Run "unzip -o resourcesGCAndroid.zip" "Unzip Resources" "0" "Menu" "main_menu"
        mv GC*Resources*/Resources $grasscutter_path/resources
        rm -rf GC*Resources*
        rm resourcesGCAndroid.zip
        echo "${GC}Generate config.json${WC}"
        timeout --foreground 8s java -jar grasscutter.jar &>/dev/null
        echo "${GC}Editing config.json...${WC}"
        if [ ! -f "config.json" ]; then
            echo "${RC}config.json not found..."
            echo "${YC}Skip edit config.json...${WC}"
        else
            sed -i "s/\"bindPort\": 443/\"bindPort\": 54321/g" config.json
            sed -i "s/\"welcomeMessage\": \".*\"/\"welcomeMessage\": \"Localhost on Android using GCAndroid(Z3RO ElaXan)\\\n\\\nhttps:\/\/github.com\/Score-Inc\/GCAndroid\"/g" config.json
            sed -i "s/\"nickName\": \".*\"/\"nickName\": \"ElaXan\"/g" config.json
            sed -i "s/\"signature\": \".*\"/\"signature\": \"Welcome to GCAndroid, run with Grasscutter!\"/g" config.json
            sleep 1s
            echo "${GC}Done Set All"
            echo "Address : 127.0.0.1"
            echo "Port : 54321${WC}"
        fi
        echo "${GC}Success Download Grasscutter${WC}"
        echo ""
        echo -n "Press enter for back to Menu!"
        read
        main_menu
    else 
        echo "${GC}Skip Download Grasscutter${WC}"
        sleep 1s
        main_menu
    fi
}

Pull_DockerGS_Image() {
    credit_hah
    Center_Text "Pull DockerGS Image"
    if ! su -c echo &>/dev/null; then
        echo "${RC}Error${WC}: Your phone is not rooted for pull Docker Image!"
        echo
        echo -n "Press enter for back to Menu!"
        read
        main_menu
    fi
    if ! command -v docker &>/dev/null; then
        Run "apt install root-repo -y" "Install Root Repo" "0" "Menu" "main_menu"
        Run "apt install docker -y" "Install Docker" "0" "Menu" "main_menu"
    fi
    if ! command -v sudo &>/dev/null; then
        Run "apt install tsu -y" "Install Tsu/Sudo" "0" "Menu" "main_menu"
    fi
    echo -n "${CCB}Are you sure want to pull DockerGS Image?${WC} (y/N) : "
    read -r Pull_DockerGS_Image_process
    if [[ $Pull_DockerGS_Image_process == "y" ]] || [[ $Pull_DockerGS_Image_process == "Y" ]]; then
        if [ -d "$grasscutter_path" ]; then
            echo "${RC}Looks like you have installed Grasscutter already${WC}"
            echo -n "Do you want to delete old Grasscutter and continue? (y/N) : "
            read -r Pull_DockerGS_Image_process_continue
            if [[ $Pull_DockerGS_Image_process_continue == "y" ]] || [[ $Pull_DockerGS_Image_process_continue == "Y" ]]; then
                echo "${GC}Continue...${WC}"
                rm -rf "$grasscutter_path"
            else
                echo "${RC}Cancel...${WC}"
                sleep 1s
                main_menu
            fi
        fi
        sudo dockerd --iptables=false &>/dev/null &
        sleep 2s
        Run "sudo docker pull siakbary/dockergs:alpine-gc-3.4" "Pull DockerGS Image" "0" "Menu" "main_menu"
        pathDockerGS=$(sudo docker inspect --format='{{.GraphDriver.Data.LowerDir}}' "siakbary/dockergs:alpine-gc-3.4" | awk '{split($0,a,":"); print a[1]}')
        if [ ! -d "$grasscutter_path" ]; then
            mkdir -p "$grasscutter_path"
        fi
        cd $grasscutter_path || exit 1
        sudo mv -f $pathDockerGS/home/dockergs $HOME
        sudo mv -f $HOME/dockergs/* $grasscutter_path
        sudo rm -rf $HOME/dockergs

        for fileFolder in $(find "$grasscutter_path" -type d); do
            sudo chown $(whoami):$(whoami) "$fileFolder"
        done

        sudo chown $(whoami):$(whoami) $grasscutter_path/*
        Run "wget $(jq -r .Resources $Path_Repojson) -O resourcesGCAndroid.zip" "Download Resources" "0" "Menu" "main_menu"
        Run "unzip -o resourcesGCAndroid.zip" "Unzip Resources" "0" "Menu" "main_menu"
        mv GC*Resources*/Resources $grasscutter_path/resources
        rm -rf GC*Resources*
        rm resourcesGCAndroid.zip
        Run "sudo docker rmi siakbary/dockergs:alpine-gc-3.4" "Remove DockerGS Image" "0" "Menu" "main_menu"
        echo "${GC}Generate config.json${WC}"
        timeout --foreground 8s java -jar grasscutter.jar &>/dev/null
        echo "${GC}Editing config.json...${WC}"
        if [ ! -f "config.json" ]; then
            echo "${RC}config.json not found..."
            echo "${YC}Skip edit config.json...${WC}"
        else
            sed -i "s/\"bindPort\": 443/\"bindPort\": 54321/g" config.json
            sed -i "s/\"welcomeMessage\": \".*\"/\"welcomeMessage\": \"Localhost on Android using GCAndroid(Z3RO ElaXan)\\\n\\\nhttps:\/\/github.com\/Score-Inc\/GCAndroid\"/g" config.json
            sed -i "s/\"nickName\": \".*\"/\"nickName\": \"ElaXan\"/g" config.json
            sed -i "s/\"signature\": \".*\"/\"signature\": \"Welcome to GCAndroid, run with Grasscutter!\"/g" config.json
            sleep 1s
            echo "${GC}Done Set All"
            echo "Address : 127.0.0.1"
            echo "Port : 54321${WC}"
        fi
        sudo pkill dockerd
        echo "${GC}Success Pull DockerGS Image${WC}"
        echo ""
        echo -n "Press enter for back to Menu!"
        read
        main_menu
    else
        echo "${GC}Cancel Pull DockerGS Image${WC}"
        sleep 1s
        main_menu
    fi
}