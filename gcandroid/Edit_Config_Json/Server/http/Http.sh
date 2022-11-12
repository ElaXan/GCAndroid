edit_configjson_Server_http() {
    credit_hah
    line7 "Edit config.json [HTTP]"
    getConfigJson "Server.HTTP"
    echo "1. [${GC}$server_http_bindAddress${WC}] bindAddress"
    echo "2. [${GC}$server_http_accessAddress${WC}] accessAddress"
    echo "3. [${GC}$server_http_accessPort${WC}] accessPort"
    echo "4. ${CCB}encryption${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_Server_http_input
    case $edit_configjson_Server_http_input in
    "1") edit_configjson_Server_http_bindAddress ;;
    "2") edit_configjson_Server_http_accessAddress ;;
    "3") edit_configjson_Server_http_accessPort ;;
    "4") edit_configjson_Server_http_encryption ;;
    "0") edit_configjson_Server_main ;;
    *)
        echo "${WC}Wrong Input!${RC}"
        sleep 0.5s
        edit_configjson_Server_http
        ;;
    esac
}
