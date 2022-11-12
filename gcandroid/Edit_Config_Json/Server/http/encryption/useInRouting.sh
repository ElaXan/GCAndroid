edit_configjson_Server_http_encryption_useInRouting() {
    editConfigJson_Back="edit_configjson_Server_http_encryption"
    if [ $server_http_encryption_useInRouting = "true" ]; then
        editJsonJq "server.http.encryption.useInRouting=false"
    elif [ $server_http_encryption_useInRouting = "false" ]; then
        editJsonJq "server.http.encryption.useInRouting=true"
    fi
}