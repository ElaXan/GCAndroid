
# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

Generate_Keystore() {
    credit_hah
    Center_Text "Generate Keystore File"
    if [ ! -d $grasscutter_path ]; then
        echo "${RC}Error${WC} : The directory ${CCB}$grasscutter_path${WC} does not exist."
        echo
        echo -n "Press any key to back to the main menu..."
        read -n 1
        Grasscutter_Tools
    fi
    getIp=$(ifconfig 2>/dev/null | grep "inet " | sed -n 's/.*inet \([0-9.]*\) .*/\1/p')
    getType=$(ifconfig 2>/dev/null | sed -n 's/^\([a-z0-9_]*\):.*/\1/p')
    echo "${GC}Please choose the ip address to create the keystore file:${WC}"
    numberIp=0
    for ip in $getIp
    do
        numberIp=$(($numberIp+1))
        echo "$numberIp. ${CCB}$ip${WC} (${YC}$(echo "$getType" | sed -n "${numberIp}p")${WC})"
    done
    echo "0. ${RC}Back${WC}"
    echo
    read -p "Please input of the number: " num
    if [ "$num" = "0" ]; then
        Grasscutter_Tools
    fi
    if ! [[ "$num" =~ ^[0-9]+$ ]]; then
        echo "${RC}Error${WC} : Please input the number!"
        echo
        echo -n "Press any key to try again..."
        read -n 1
        Generate_Keystore
    fi
    if [ "$num" -gt "$numberIp" ] || [ "$num" -lt 1 ]; then
        echo "${RC}Error${WC} : Please input the number between 1 and $numberIp!"
        echo
        echo -n "Press any key to try again..."
        read -n 1
        Generate_Keystore
    fi
    ip=$(echo "$getIp" | sed -n "${num}p")
    echo "Are you sure to create the keystore file with the ip address ${CCB}$ip${WC} ?"
    read -p "Please input ${CCB}yes${WC} or ${CCB}no${WC}: " answer
    if [ "$answer" = "yes" ]; then
        echo "Using source code from ${CCB}https://github.com/Grasscutters/Grasscutter/blob/development/install.sh${WC}"
        echo
        mkdir $HOME/.ElaXan/certs
        cd $HOME/.ElaXan/certs
        echo "Generating CA key and certificate pair..."
        openssl req -x509 -nodes -days 25202 -newkey rsa:2048 -subj "/C=GB/ST=Essex/L=London/O=Grasscutters/OU=Grasscutters/CN=$ip" -keyout CAkey.key -out CAcert.crt
        echo "Generating SSL key and certificate pair..."
        openssl genpkey -out ssl.key -algorithm rsa
        echo "Creates a conf file in order to generate a csr"
        cat > csr.conf <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn
[ dn ]
C = GB
ST = Essex
L = London
O = Grasscutters
OU = Grasscutters
CN = $ip
[ req_ext ]
subjectAltName = @alt_names
[ alt_names ]
IP.1 = $ip
EOF
        echo "Creates csr using key and conf"
        openssl req -new -key ssl.key -out ssl.csr -config csr.conf
        echo "Creates conf to finalise creation of certificate"
        cat > cert.conf <<EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, keyAgreement, dataEncipherment
subjectAltName = @alt_names
[alt_names]
IP.1 = $ip
EOF
        echo "Creates ssl cert"
        openssl x509 -req -in ssl.csr -CA CAcert.crt -CAkey CAkey.key -CAcreateserial -out ssl.crt -days 25202 -sha256 -extfile cert.conf
        echo "Generating keystore.p12 from key and certificate..."
        openssl pkcs12 -export -out keystore.p12 -inkey ssl.key -in ssl.crt -certfile CAcert.crt -passout pass:123456
        if [ -f $grasscutter_path/keystore.p12 ]; then
            rm $grasscutter_path/keystore.p12
        fi
        mv ./keystore.p12 $grasscutter_path/keystore.p12
        cd ..
        rm -rf certs
        echo "The keystore file has been created successfully."
        echo "The keystore file is ${CCB}$grasscutter_path/keystore.p12${WC}."
        echo "The password of the keystore file is ${CCB}123456${WC}."
        echo
        echo -n "Press any key to continue..."
        read -n 1
        Grasscutter_Tools
    else
        Generate_Keystore
    fi

}