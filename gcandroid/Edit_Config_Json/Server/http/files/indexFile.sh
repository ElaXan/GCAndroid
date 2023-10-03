edit_configjson_Server_http_files_indexFile() {
    editConfigJson_Back="edit_configjson_Server_http_files"
    echo
    echo -n "${CCB}Emter custom indexFile : ${YC}"
    read -r edit_configjson_Server_http_files_indexFile_input
    echo -n "${WC}"
    if [[ $edit_configjson_Server_http_files_indexFile_input == "" ]]; then
        edit_configjson_Server_http_files
    else
        editJsonJq "server.http.files.indexFile=\"$edit_configjson_Server_http_files_indexFile_input\""
    fi
}