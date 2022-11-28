edit_configjson_language_fallback() {
    editConfigJson_Back="edit_configjson_language"
    echo
    echo -n "${CCB}Enter custom fallback${WC} : ${YC}"
    read -r language_fallback_input
    echo -n "${WC}"
    if [ -z "$language_fallback_input" ]; then
        edit_configjson_language
    else
        editJsonJq "language.fallback=\"$language_fallback_input\""
    fi
}