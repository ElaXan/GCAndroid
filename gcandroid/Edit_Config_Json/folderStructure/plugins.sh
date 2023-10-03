edit_configjson_folderStructure_plugins() {
    editConfigJson_Back="edit_configjson_folderStructure"
    echo
    echo -n "${CCB}Enter custom plugins : ${YC}"
    read -r edit_configjson_folderStructure_plugins_input
    echo -n "${WC}"
    if [[ $edit_configjson_folderStructure_plugins_input == "" ]]; then
        edit_configjson_folderStructure
    else
        editJsonJq "folderStructure.plugins=\"$edit_configjson_folderStructure_plugins_input\""
    fi
}