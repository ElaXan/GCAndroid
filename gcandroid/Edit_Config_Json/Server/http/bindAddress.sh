edit_configjson_Server_http_bindAddress() {
    echo
    echo -n "${CCB}Enter new bindAddress : ${YC}"
    read -r edit_configjson_Server_http_bindAddress_input
    echo -n "${RC}"
    if [[ $edit_configjson_Server_http_bindAddress_input = "" ]]; then
        edit_configjson_Server_http
    elif ! (echo $edit_configjson_Server_http_bindAddress_input | grep ".*\..*\..*\..*" &> /dev/null); then
        echo "${RC}Error${WC}"
        sleep 0.3s
        edit_configjson_Server_http
    else
        editConfigJson_Back="edit_configjson_Server_http"
        editJsonJq "server.http.bindAddress=\"$edit_configjson_Server_http_bindAddress_input\""
    fi   
}