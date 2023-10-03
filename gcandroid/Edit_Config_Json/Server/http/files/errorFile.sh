edit_configjson_Server_http_files_errorFile() {
    editConfigJson_Back="edit_configjson_Server_http_files"
    echo
    echo -n "${CCB}Emter custom errorFile : ${YC}"
    read -r edit_configjson_Server_http_files_errorFile_input
    echo -n "${WC}"
    if [[ $edit_configjson_Server_http_files_errorFile_input == "" ]]; then
        edit_configjson_Server_http_files
    else
        editJsonJq "server.http.files.errorFile=\"$edit_configjson_Server_http_files_errorFile_input\""
    fi
}