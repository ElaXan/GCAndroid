edit_configjson_database_server_collection() {
    editConfigJson_Back="edit_configjson_database_server"
    echo
    echo -n "${CCB}Enter custom collection$ : ${YC}"
    read -r collection
    echo -n "${WC}"
    if [[ -z $collection ]]; then
        echo -e "${RC}Invalid input!${WC}"
        sleep 0.5s
        edit_configjson_database_server_collection
    else
        editJsonJq "databaseInfo.server.collection=\"$collection\""
    fi
}