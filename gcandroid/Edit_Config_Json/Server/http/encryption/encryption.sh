edit_configjson_Server_http_encryption() {
    credit_hah
    getConfigJson "Server.HTTP.Encryption"
    echo "1. [$server_http_encryption_useEncryptionOut] useEncryption"
    echo "2. [$server_http_encryption_useInRoutingOut] useInRouting"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_Server_http_encryption_input
    case $edit_configjson_Server_http_encryption_input in
    "1") edit_configjson_Server_http_encryption_useEncryption ;;
    "2") edit_configjson_Server_http_encryption_useInRouting ;;
    "0") edit_configjson_Server_http ;;
    *)
        echo "${RC}Wrong input!${WC}"
        sleep 0.3s
        edit_configjson_Server_http_encryption
        ;;
    esac
}
