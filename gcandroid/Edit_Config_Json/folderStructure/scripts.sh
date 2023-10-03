edit_configjson_folderStructure_scripts() {
    editConfigJson_Back="edit_configjson_folderStructure"
    echo
    echo -n "${GC}Enter custom scripts : ${YC}"
    read -r edit_configjson_folderStructure_scripts_input
    echo -n "${WC}"
    if [[ $edit_configjson_folderStructure_scripts_input == "" ]]; then
        edit_configjson_folderStructure
    else
        editJsonJq "folderStructure.scripts=\"$edit_configjson_folderStructure_scripts_input\""
    fi
}