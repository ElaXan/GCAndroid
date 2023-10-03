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
    if ! (ls /sdcard > /dev/null 2>&1); then
        echo "${RC}Error${WC} : /sdcard can't access/permission denied"
        echo
        echo -n "Press enter for back to Grasscutter Tools"
        read -r
        Grasscutter_Tools
    fi
    if [ ! -d "$grasscutter_path" ]; then
        echo "${RC}Error${WC} : $grasscutter_path not found${WC}"
        echo
        echo -n "Press enter for back to Grasscutter Tools"
        read -r
        Grasscutter_Tools
    fi
    if [ ! -f "$wherethegrassss" ]; then
        echo "${RC}Error${WC} : $wherethegrassss file not found${WC}"
        echo
        echo -n "Press enter for back to Grasscutter Tools"
        read -r
        Grasscutter_Tools
    fi
    cd $grasscutter_path || exit 1
    local command_jar="java -jar grasscutter.jar"  
    Run "$command_jar -dump=avatars,EN" "Dump Avatars with language EN" "0" "Menu" "main_menu"
    Run "$command_jar -dump=items,EN" "Dump Items with language EN" "0" "Menu" "main_menu"
    Run "$command_jar -dump=commands,en-us" "Dump Commands with language en-us" "0" "Menu" "main_menu"
    Run "$command_jar -dump=quests,EN" "Dump Quests with language EN" "0" "Menu" "main_menu"
    Run "$command_jar -dump=entities,EN" "Dump Entities with language EN" "0" "Menu" "main_menu"
    Run "$command_jar -dump=areas,EN" "Dump Areas with language EN" "0" "Menu" "main_menu"
    Run "$command_jar -dump=scenes,EN" "Dump Scenes with language EN" "0" "Menu" "main_menu"
    if [ ! -d "/sdcard/GM_Handbook" ]; then
        mkdir "/sdcard/GM_Handbook"
    fi
    Run "mv -t /sdcard/GM_Handbook "*.csv "Move GM Handbook to /sdcard" "0" "Menu" "main_menu"
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
