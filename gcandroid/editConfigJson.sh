editJsonJq() {
    cd $HOME/Grasscutter || exit 1
    fileConfig="config.json"
    cat $fileConfig | jq .$1 > ZEdit.json
    cat ZEdit.json > $fileConfig
    rm ZEdit.json
    $editConfigJson_Back
}