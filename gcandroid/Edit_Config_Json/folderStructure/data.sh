edit_configjson_folderStructure_data() {
    editConfigJson_Back="edit_configjson_folderStructure"
    echo
    echo -n "${CCB}Enter custom data : ${YC}"
    read -r edit_configjson_folderStructure_data_input
    echo -n "${WC}"
    if [[ $edit_configjson_folderStructure_data_input == "" ]]; then
        edit_configjson_folderStructure
    else
        editJsonJq "folderStructure.data=\"$edit_configjson_folderStructure_data_input\""
    fi
}