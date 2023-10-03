edit_configjson_Server_http_policies_cors_enabled() {
    editConfigJson_Back="edit_configjson_Server_http_policies_cors"
    if [[ $server_http_policies_cors_enabled == "true" ]]; then
        editJsonJq "server.http.policies.cors.enabled=false"
    elif [[ $server_http_policies_cors_enabled == "false" ]]; then
        editJsonJq "server.http.policies.cors.enabled=true"
    else
        edit_configjson_Server_http_policies_cors
    fi
}