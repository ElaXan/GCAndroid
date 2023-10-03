edit_configjson_language() {
    credit_hah
    Center_Text "Edit config.json [language]"
    getConfigJson "language"
    echo "1. [${GC}$language_language${WC}] language"
    echo "2. [${GC}$language_fallback${WC}] fallback"
    echo "3. [${GC}$language_document${WC}] document"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_language_input
    case $edit_configjson_language_input in
    "1") edit_configjson_language_language ;;
    "2") edit_configjson_language_fallback ;;
    "3") edit_configjson_language_document ;;
    "0") edit_configjson ;;
    *)
        echo "${RC}Wrong input!${WC}"
        sleep 0.5s
        edit_configjson_language
        ;;
    esac
}