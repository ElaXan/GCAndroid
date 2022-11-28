delete_avatars() {
    service mongodb start
    credit_hah
    Center_Text "Delete Avatars"
    list_get=$(mongo --quiet grasscutter --eval "db.avatars.find()")
    echo "${YC}Enter b/B for back/cancel${CCB}"
    echo
    read -p "${CCB}Enter your UID : ${WC}" delete_mongodb_uid
    if [[ $delete_mongodb_uid == "b" ]] || [[ $delete_mongodb_uid == "B" ]]; then
        main_menu
    fi
    read -p "${CCB}Enter Avatars ID : ${WC}" delete_mongodb_avatar_id
    if [[ $delete_mongodb_avatar_id =~ [0-9] ]]; then
        Characters_Name=$(grep "$delete_mongodb_avatar_id" /usr/share/gcandroid/GM_Handbook/avatars.txt)
        delete_mongodb_avatar_id_results=$(echo -n "$Character_Name" | grep -i "$delete_mongodb_avatar_id" | awk -F ":" '{print $1}')
        if [ ${#delete_mongodb_avatar_id} -lt 8 ]; then
            echo "${RC}Please enter 8 character not ${#delete_mongodb_avatar_id}!${WC}"
            sleep 1s
            delete_avatars
        elif [ ${#delete_mongodb_avatar_id} -gt 8 ]; then
            echo "${RC}Please enter 8 character not ${#delete_mongodb_avatar_id}!${WC}"
            sleep 1s
            delete_avatars
        fi
    elif [[ $delete_mongodb_avatar_id == "b" ]] || [[ $delete_mongodb_avatar_id == "B" ]]; then
        main_menu
    fi
    echo
    checking_the_avatars_id=$(mongo --quiet grasscutter --eval "db.avatars.find()" | grep "$delete_mongodb_avatar_id" | grep "$delete_mongodb_uid")
    if [[ $? != 0 ]]; then
        echo "${RC}Avatars ID not found!${WC}"
        echo
        echo -n "Press enter for back to Main Menu!"
        read
        main_menu
    else
        delete_mongodb_avatar_id_results_name=$(echo "$Characters_Name" | grep -i "$delete_mongodb_avatar_id_results" | awk -F ":" '{print $2}')
        delete_mongodb_avatar_id_results_name=$(echo "$delete_mongodb_avatar_id_results_name" | sed 's/^ *//')
        echo "${CCB}Avatars ID found!${WC}"
        echo "${GC}Avatars Name${WC} : ${CCB}$delete_mongodb_avatar_id_results_name${WC}"
        echo
        echo -n "Are you sure? (y/N) : "
        read -r delete_mongodb_input
        case $delete_mongodb_input in
        "y" | "Y")
            mongo --quiet grasscutter --eval "db.avatars.remove($checking_the_avatars_id)" >/dev/null 2>&1
            if [[ $? != 0 ]]; then
                echo "${RC}Failed to delete!${WC}"
                echo
                echo -n "Press enter for back to Main Menu!"
                read
                main_menu
            else
                echo "${GC}Success deleted!${WC}"
                echo
                echo -n "Press enter for back to Main Menu!"
                read
                main_menu
            fi
            ;;
        "n" | "N") main_menu ;;
        *)
            echo "${RC}Wrong Input!${WC}"
            sleep 1s
            delete_avatars
            ;;
        esac
    fi
}

check_avatars() {
    service mongodb start
    credit_hah
    Center_Text "Check Avatars"
    read -p "Enter your UID : " check_mongodb_uid
    check_uid_database=$(mongo --quiet grasscutter --eval "db.avatars.find()" | grep "\"ownerId\" : $check_mongodb_uid")
    if [[ -z $check_uid_database ]]; then
        echo "${RC}UID not found!${WC}"
        echo
        echo -n "Press enter for back to Main Menu!"
        read
        main_menu
    else
        echo "${GC}UID found!${WC}"
        check_character_database=$(mongo --quiet grasscutter --eval "db.avatars.find()" | grep "\"ownerId\" : $check_mongodb_uid" | grep "\"avatarId\" :" | sed "s/.*\"avatarId\" : //g" | sed "s/,.*//g")
        if [[ -z $check_character_database ]]; then
            echo "${RC}Character not found!${WC}"
            echo
            echo -n "Press enter for back to Main Menu!"
            read
            main_menu
        else
            check_character_avatars=$(grep "$check_character_database" /usr/share/gcandroid/GM_Handbook/avatars.txt)
            if [[ -z $check_character_avatars ]]; then
                echo "${RC}Character not found!${WC}"
                echo
                echo -n "Press enter for back to Main Menu!"
                read
                main_menu
            else
                echo "${CCB}List Avatars${WC}"
                echo $line | sed 's/=/~/g'
                get_character_avatars=$(grep "$check_character_database" /usr/share/gcandroid/GM_Handbook/avatars.txt | awk -F ":" '{print $1}')
                count_character_avatars=0
                for i in $get_character_avatars; do
                    count_character_avatars=$((count_character_avatars + 1))
                    get_character_avatars_name=$(grep "$i" /usr/share/gcandroid/GM_Handbook/avatars.txt | awk -F ":" '{print $2}')
                    get_character_avatars_id=$(grep "$i" /usr/share/gcandroid/GM_Handbook/avatars.txt | awk -F ":" '{print $1}')
                    echo -e "$count_character_avatars. Name :${YC}$get_character_avatars_name${WC}\n > ID : ${GC}$get_character_avatars_id${WC}\n$(echo $line | sed 's/=/~/g')"
                done
                echo
                echo -n "Press enter for back to GCAndroid Tools!"
                read
                gcandroidTools
            fi
        fi
    fi
}

gcandroidTools() {
    credit_hah
    Center_Text "GCAndroid Tools"
    echo "1. ${CCB}Delete Avatars${WC}"
    echo "2. ${CCB}Check Avatars${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    read -p "Enter your choice : " gcandroid_tools_input
    case $gcandroid_tools_input in
    1) delete_avatars ;;
    2) check_avatars ;;
    0) main_menu ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 1s
        gcandroidTools
        ;;
    esac
}
