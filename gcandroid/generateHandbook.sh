# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

generateHandbook() {
    credit_hah
    Center_Text "GM Handbook"
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
    cd $HOME/Grasscutter || exit 1
    mongod &>/dev/null &
    Run "timeout 10s java -jar grasscutter.jar -handbook" "Getting GM_Handbook" "124" "Menu" "main_menu"
    if [ -z "$(ls -A $HOME/Grasscutter/GM\ Handbook/)" ]; then
        echo "${RC}Error${WC} : GM Handbook not found!"
        echo
        echo -n "Press enter for back to Grasscutter Tools"
        read -r
        Grasscutter_Tools
    fi
    if [ ! -d "/sdcard/GM_Handbook" ]; then
        mkdir "/sdcard/GM_Handbook"
    fi
    Run "mv -f GM*Handbook/* /sdcard/GM_Handbook/" "Move GM_Handbook to /sdcard" "0" "Menu" "main_menu"
    pkill mongod
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