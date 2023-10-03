edit_configjson_database_server() {
    credit_hah
    Center_Text "Edit config.json [Server]"
    getConfigJson "databaseInfo.server"
    echo "1. [${GC}$databaseInfo_server_connectionUri${WC}] connectionUri"
    echo "2. [${GC}$databaseInfo_server_collection${WC}] collection"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_database_server_input
    case $edit_configjson_database_server_input in
    "1") edit_configjson_database_server_connectionUri ;;
    "2") edit_configjson_database_server_collection ;;
    "0") edit_configjson_database ;;
    *)
        echo "${RC}Wrong input!${WC}"
        sleep 0.5s
        edit_configjson_database_server
        ;;
    esac
}