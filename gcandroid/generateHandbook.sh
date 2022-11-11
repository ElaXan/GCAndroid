# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

generateHandbook() {
    credit_hah
    line13 "GM Handbook"
    if ! command -v java &>/dev/null; then
        echo "${RC}Java not found!${WC}"
        echo
        echo -n "Press enter for back to Grasscutter tools"
        read -r
        Grasscutter_Tools
    fi
    if ! command -v mongo &>/dev/null; then
        echo "${RC}Mongodb not installed, install it in Main Menu!${RC}"
        echo
        echo -n "Press enter for back to Main Menu!"
        read -r
        main_menu
    fi
    if [ ! -d "$HOME/Grasscutter" ]; then   
        echo "${RC}Folder Grasscutter not found!${RC}"
        echo
        echo -n "Press enter for back to Grasscutter Tools"
        read -r
        Grasscutter_Tools
    fi
    if [ ! -f "$HOME/Grasscutter/grasscutter.jar" ]; then
        echo "${RC}File grasscutter.jar not found!${RC}"
        echo
        echo -n "Press enter for back to Grasscutter Tools"
        read -r
        Grasscutter_Tools
    fi
    if ! (ls /sdcard > /dev/null 2>&1); then
        echo "${RC}Error${WC} : /sdcard cant access/permission denied"
        echo
        echo -n "Press enter for back to Grasscutter Tools"
        read -r
        Grasscutter_Tools
    fi
    cd $HOME/Grasscutter | exit 1
    run_Program() {
        sudo service mongodb start &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
    }
    run_Program &
    pid=$!
    spin "${GC}Start Mongodb Database${WC}" "0" "Menu" "main_menu"
    run_Program() {
        timeout 25s java -jar grasscutter.jar -handbook &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
    }
    run_Program &
    pid=$!
    spin "${GC}Getting GM_Handbook${WC}" "124" "Menu" "main_menu"
    if [ ! -d "/sdcard/GM_Handbook" ]; then
        mkdir "/sdcard/GM_Handbook"
    fi
    run_Program() {
        mv -f "GM Handbook"/* "/sdcard/GM_Handbook/" &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
    }
    run_Program &
    pid=$!
    spin "${GC}Move GM_Handbook to /sdcard${WC}" "0" "Menu" "main_menu"
    run_Program() {
        pkill mongo; sudo service mongodb stop &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
    }
    run_Program &
    pid=$!
    spin "${GC}Stop Mongodb Database${WC}" "0" "Menu" "main_menu"
    if (ls "/sdcard/GM_Handbook"/* > /dev/null 2>&1); then
        echo "${GC}Success get GM Handbook to /sdcard in Folder GM_Handbook${WC}"
        echo
        echo -n "Press enter for back to Main Menu!"
        read -r
        main_menu
    else
        echo "${RC}Failed to get GM Handbook!${WC}"
        echo
        echo -n "Press enter for back to Main Menu!"
        read -r
        main_menu
    fi
}