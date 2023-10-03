edit_configjson_Server_http_encryption_keystore() {
    editConfigJson_Back="edit_configjson_Server_http_encryption"
    echo
    echo -n "${CCB}Enter custom keystore : ${YC}"
    read -r edit_configjson_Server_http_encryption_keystore_input
    echo -n "${WC}"
    if [[ $edit_configjson_Server_http_encryption_keystore_input = "" ]]; then
        edit_configjson_Server_http_encryption
    else
        editJsonJq "server.http.encryption.keystore=\"$edit_configjson_Server_http_encryption_keystore_input\""
    fi
}