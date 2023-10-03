edit_configjson_Server_http_files() {
    credit_hah
    Center_Text "Edit config.json [files]"
    getConfigJson "server.http.files"
    echo "1. [${GC}$server_http_files_indexFile${WC}] indexFile"
    echo "2. [${GC}$server_http_files_errorFIle${WC}] errorFile"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_Server_http_files_input
    case $edit_configjson_Server_http_files_input in
    "1") edit_configjson_Server_http_files_indexFile ;;
    "2") edit_configjson_Server_http_files_errorFile ;;
    "0") edit_configjson_Server_http ;;
    *)
        echo "${RC}Wrong input!${WC}"
        sleep 0.5s
        edit_configjson_Server_http_files
        ;;
    esac
}
