edit_configjson_folderStructure() {
    credit_hah
    line5 "Edit config.json [folderStructure]"
    getConfigJson "folderStructure"
    echo "1. [${GC}$folderStructure_resources${RC}] resources"
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
