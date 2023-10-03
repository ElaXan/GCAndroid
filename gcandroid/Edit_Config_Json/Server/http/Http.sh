edit_configjson_Server_http() {
    credit_hah
    Center_Text "Edit config.json [HTTP]"
    getConfigJson "Server.HTTP"
    echo "1. [${GC}$server_http_bindAddress${WC}] bindAddress"
    echo "2. [${GC}$server_http_accessAddress${WC}] accessAddress"
    echo "3. [${GC}$server_http_accessPort${WC}] accessPort"
    echo "4. ${CCB}encryption${WC}"
    echo "5. ${CCB}policies${WC}"
    echo "6. ${CCB}files${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_Server_http_input
    case $edit_configjson_Server_http_input in
    "1") edit_configjson_Server_http_bindAddress ;;
    "2") edit_configjson_Server_http_accessAddress ;;
    "3") edit_configjson_Server_http_accessPort ;;
    "4") edit_configjson_Server_http_encryption ;;
    "5") edit_configjson_Server_http_policies ;;
    "6") edit_configjson_Server_http_files ;;
    "0") edit_configjson_Server_main ;;
    *)
        echo "${RC}Wrong Input!${RC}"
        sleep 0.5s
        edit_configjson_Server_http
        ;;
    esac
}
