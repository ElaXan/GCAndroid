edit_configjson_folderStructure_resources() {
    editConfigJson_Back="edit_configjson_folderStructure"
    echo
    echo -n "${CCB}Enter custom resources : ${YC}"
    read -r edit_configjson_folderStructure_resources_input
    echo -n "${WC}"
    if [[ $edit_configjson_folderStructure_resources_input == "" ]]; then
        edit_configjson_folderStructure
    else
        editJsonJq "folderStructure.resources=\"$edit_configjson_folderStructure_resources_input\""
    fi
}