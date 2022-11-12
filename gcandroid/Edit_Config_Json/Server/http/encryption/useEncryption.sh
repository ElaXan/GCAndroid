edit_configjson_Server_http_encryption_useEncryption() {
    editConfigJson_Back="edit_configjson_Server_http_encryption"
    if [ $server_http_encryption_useEncryption = "true" ]; then
        editJsonJq "server.http.encryption.useEncryption=false"
    elif [ $server_http_encryption_useEncryption = "false" ]; then
        editJsonJq "server.http.encryption.useEncryption=true"
    fi
}