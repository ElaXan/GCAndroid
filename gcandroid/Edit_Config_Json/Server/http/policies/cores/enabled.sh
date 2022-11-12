edit_configjson_Server_http_policies_cores_enabled() {
    editConfigJson_Back="edit_configjson_Server_http_policies_cores"
    if [[ $server_http_policies_cores_enabled == "false" ]]; then
        editJsonJq "server.http.policies.cores.enabled=true"
    elif [[ $server_http_policies_cores_enabled == "true" ]]; then
        editJsonJq "server.http.policies.cores.enabled=false"
    else
        edit_configjson_Server_http_policies_cores
    fi
}