edit_configjson_folderStructure_packets() {
    editConfigJson_Back="edit_configjson_folderStructure"
    echo
    echo -n "${CCB}Enter custom packets : ${YC}"
    read -r edit_configjson_folderStructure_packets_input
    echo -n "${WC}"
    if [[ $edit_configjson_folderStructure_packets_input == "" ]]; then
        edit_configjson_folderStructure
    else
        editJsonJq "folderStructure.packets=\"$edit_configjson_folderStructure_packets_input\""
    fi
}