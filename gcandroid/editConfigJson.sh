editJsonJq() {
    cd $HOME/Grasscutter || exit 1
    fileConfig="config.json"
    jq .$1 $fileConfig > ZEdit.json
    cat ZEdit.json > $fileConfig
    rm ZEdit.json
    $editConfigJson_Back
}