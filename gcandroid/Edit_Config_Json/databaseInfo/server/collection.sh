edit_configjson_database_server_collection() {
    editConfigJson_Back="edit_configjson_database_server"
    echo
    echo -n "${CCB}Enter custom collection : ${YC}"
    read -r collection
    echo -n "${WC}"
    if [[ -z $collection ]]; then
        edit_configjson_database_server
    else
        editJsonJq "databaseInfo.server.collection=\"$collection\""
    fi
}