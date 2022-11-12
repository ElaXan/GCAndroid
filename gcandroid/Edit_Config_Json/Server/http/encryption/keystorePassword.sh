edit_configjson_Server_http_encryption_keystorePassword() {
    editConfigJson_Back="edit_configjson_Server_http_encryption"
    echo
    echo -n "${CCB}Enter custom keystorePassword : ${YC}"
    read -r edit_configjson_Server_http_encryption_keystorePassword_input
    echo -n "${WC}"
    if [[ $edit_configjson_Server_http_encryption_keystorePassword_input = "" ]]; then
        edit_configjson_Server_http_encryption
    else
        editJsonJq "server.http.encryption.keystorePassword=\"$edit_configjson_Server_http_encryption_keystorePassword_input\""
    fi
}