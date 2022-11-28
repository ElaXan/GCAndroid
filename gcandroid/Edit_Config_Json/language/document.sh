edit_configjson_language_document() {
    editConfigJson_Back="edit_configjson_language"
    echo
    echo -n "${CCB}Enter custom document${WC} : ${YC}"
    read -r language_document_input
    echo -n "${WC}"
    if [ -z "$language_document_input" ]; then
        edit_configjson_language
    else
        editJsonJq "language.document=\"$language_document_input\""
    fi
}