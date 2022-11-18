edit_configjson_folderStructure() {
    cd $HOME/Grasscutter || exit 1
    credit_hah
    line1 "Edit config.json [folderStructure]"
    getConfigJson "folderStructure"
    echo "1. [${GC}$folderStructure_resources${WC}] resources"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_folderStructure_input
    case $edit_configjson_folderStructure_input in
    "1") edit_configjson_folderStructure_resources ;;
    "0") edit_configjson ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 0.5s
        edit_configjson_folderStructure
        ;;
    esac
}
