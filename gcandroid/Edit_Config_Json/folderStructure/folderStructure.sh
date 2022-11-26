edit_configjson_folderStructure() {
    cd $HOME/Grasscutter || exit 1
    credit_hah
    Center_Text "Edit config.json [folderStructure]"
    getConfigJson "folderStructure"
    echo "1. [${GC}$folderStructure_resources${WC}] resources"
    echo "2. [${GC}$folderStructure_data${WC}] data"
    echo "3. [${GC}$folderStructure_packets${WC}] packets"
    echo "4. [${GC}$folderStructure_scripts${WC}] scripts"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_folderStructure_input
    case $edit_configjson_folderStructure_input in
    "1") edit_configjson_folderStructure_resources ;;
    "2") edit_configjson_folderStructure_data ;;
    "3") edit_configjson_folderStructure_packets ;;
    "4") edit_configjson_folderStructure_scripts ;;
    "0") edit_configjson ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 0.5s
        edit_configjson_folderStructure
        ;;
    esac
}
