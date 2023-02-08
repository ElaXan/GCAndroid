edit_configjson() {
    cd $grasscutter_path || exit 1
    credit_hah
    Center_Text "Edit config.json [MAIN]"
    echo "1. ${CCB}folderStructure${WC}"
    echo "2. ${CCB}Database${WC}"
    echo "3. ${CCB}language${WC}"
    echo "4. ${CCB}Server${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_input
    case $edit_configjson_input in
    "1") edit_configjson_folderStructure ;;
    "2") edit_configjson_database ;;
    "3") edit_configjson_language ;;
    "4") edit_configjson_Server_main ;;
    "0") menu_config ;;
    *)
        echo "${RC}Wrong input!${WC}"
        sleep 0.5s
        edit_configjson
        ;;
    esac
}
