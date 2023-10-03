edit_configjson_language_language() {
    editConfigJson_Back="edit_configjson_language"
    echo
    echo -n "${CCB}Enter custom language${WC} : ${YC}"
    read -r language_language_input
    echo -n "${WC}"
    if [ -z "$language_language_input" ]; then
        edit_configjson_language
    else
        editJsonJq "language.language=\"$language_language_input\""
    fi
}