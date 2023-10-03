edit_configjson_Server_http_accessAddress() {
    editConfigJson_Back="edit_configjson_Server_http"
    echo
    echo -n "${CCB}Enter new accessAddress : ${YC}"
    read -r edit_configjson_Server_http_accessAddress_input
    if [[ $edit_configjson_Server_http_accessAddress_input = "" ]]; then
        edit_configjson_Server_http
    elif ! (echo $edit_configjson_Server_http_accessAddress_input | grep ".*\..*\..*\..*" &> /dev/null); then
        echo "${RC}Error${WC}"
        sleep 0.3s
        edit_configjson_Server_http
    else
        editJsonJq "server.http.accessAddress=\"$edit_configjson_Server_http_accessAddress_input\""
    fi
}