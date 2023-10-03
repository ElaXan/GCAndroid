edit_configjson_Server_http_policies_cors() {
    credit_hah
    Center_Text "Edit config.json [cors]"
    getConfigJson "Server.http.policies.cors"
    echo "1. [$server_http_policies_cors_enabledOut] enabled"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_Server_http_policies_cors_input
    case $edit_configjson_Server_http_policies_cors_input in
    "1") edit_configjson_Server_http_policies_cors_enabled ;;
    "0") edit_configjson_Server_http_policies ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 0.5
        edit_configjson_Server_http_policies_cors
        ;;
    esac
}
