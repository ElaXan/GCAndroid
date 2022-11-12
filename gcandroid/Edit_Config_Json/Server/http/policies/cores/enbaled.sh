edit_configjson_Server_http_policies_cores_enbaled() {
    editConfigJson_Back="edit_configjson_Server_http_policies_cores"
    if [[ $server_http_policies_cores_enbaled = "true" ]]; then
        editJsonJq "server.http.policies.cores.enbaled=false"
    elif [[ $server_http_policies_cores_enbaled = "false" ]]; then
        editJsonJq "server.http.policies.cores.enbaled=true"
    else
        edit_configjson_Server_http_policies_cores
    fi
}