edit_configjson_Server_http_policies_cores() {
    credit_hah
    line5 "Edit config.json [cores]"
    getConfigJson "Server.http.policies.cores"
    echo "1. [$server_http_policies_cores_enbaledOut] enbaled"
    echo "2. [$server_http_policies_cores_enabledOut] enabled"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_Server_http_policies_cores_input
    case $edit_configjson_Server_http_policies_cores_input in
    "1") edit_configjson_Server_http_policies_cores_enbaled ;;
    "2") edit_configjson_Server_http_policies_cores_enabled ;;
    "0") edit_configjson_Server_http_policies ;;
    *)
        echo "${RC}Wrong Input!${RC}"
        sleep 1s
        edit_configjson_Server_http_policies_cores
        ;;
    esac
}
