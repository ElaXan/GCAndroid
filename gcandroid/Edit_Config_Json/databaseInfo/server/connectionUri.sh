edit_configjson_database_server_connectionUri() {
    editConfigJson_Back="edit_configjson_database_server"
    echo
    echo -n "${CCB}Enter custom connectionUri : ${YC}"
    read -r connectionUri
    echo -n "${WC}"
    if [[ -z $connectionUri ]]; then
        edit_configjson_database_server
    else
        editJsonJq "databaseInfo.server.connectionUri=\"$connectionUri\""
    fi
}