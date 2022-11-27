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
            mongo --quiet grasscutter --eval "db.avatars.remove($checking_the_avatars_id)" > /dev/null 2>&1
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

gcandroidTools() {
    credit_hah
    Center_Text "GCAndroid Tools"
    echo "1. ${CCB}Delete Avatars${WC}"
    echo "2. ${CCB}Check Avatars${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    read -p "}Enter your choice : " gcandroid_tools_input
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