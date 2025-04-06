#!/bin/bash

apt update && upgrade -y

apt install openvpn openvpn-auth-ldap icinga2 monitoring-plugins icinga2-ido-mysql easy-rsa -y
##############################################
#           dns                              #
##############################################

echo "adding dns server address"

NS=(
"175.15.#.1"
"175.15.#.3"
"8.8.8.8"
)
sed -i '/servername d/' /etc/resolv.conf
for name in "${NS[@]}"
do
  echo "nameserver $name" >> /etc/resolv.conf
done
for name in "${NS[@]}"
do
  echo "- $name"
done

cp -r /usr/share/easy-rsa /etc/openvpn
cd /etc/openvpn/easy-rsa
./easy-rsa ini-pki
mv vars.example vars
cp vars vars.bak
vars_content=$(cat <<EOF
set_var EASYRSA  "$PWD"
set_var EASYRSA_PKI             "$PWD/pki"
set_var EASYRSA_DN      "cn_only"
set_var EASYRSA_REQ_COUNTRY     "ID"
set_var EASYRSA_REQ_PROVINCE    "yogyakarta"
set_var EASYRSA_REQ_CITY        "Kota"
set_var EASYRSA_REQ_ORG         "SMK N 2 Yogyakarta"
set_var EASYRSA_REQ_EMAIL       "avarellzepanzer@gmail.com"
set_var EASYRSA_REQ_OU          "vpn.lksjogja8.lan"
set_var EASYRSA_KEY_SIZE        2048
set_var EASYRSA_ALGO            rsa
set_var EASYRSA_CA_EXPIRE       7500
set_var EASYRSA_CERT_EXPIRE     365
set_var EASYRSA_NS_SUPPORT      "no"
set_var EASYRSA_NS_COMMENT      "it says: Generated Certificate"
set_var EASYRSA_EXT_DIR "$EASYRSA/x509-types"
set_var EASYRSA_DIGEST          "sha256"
EOF
)

echo "$vars_content" >> vars

./easy-rsa build-ca
./easy-rsa gen-req vpnserver nopass
./easy-rsa sign-req server vpnserver
openssl verify -CAfile pki/ca.crt pki/issued/vpnserver.crt
./easy-rsa gen-dh
./easy-rsa gen-req vpnclient nopass
./easy-rsa sign-req client vpnclient
openssl verify -CAfile pki/ca.crt pki/issued/vpnclient.crt
cp pki/ca.crt /etc/openvpn/server
cp pki/issued/vpnserver.crt /etc/openvpn/server
cp pki/private/vpnserver.key /etc/openvpn/server
cp pki/dh.pem /etc/openvpn/server
cp pki/ca.crt /etc/openvpn/client
cp pki/issued/vpnclient.crt /etc/openvpn/client
cp pki/private/vpnclient.key /etc/openvpn/client

CONF_FILE="/etc/openvpn/server.conf"

# Membuat file konfigurasi server.conf
cat > "$CONF_FILE" <<EOF
port 1194
proto udp
dev tun
ca /etc/openvpn/server/ca.crt
cert /etc/openvpn/server/vpnserver.crt
key /etc/openvpn/server/vpnserver.key
dh /etc/openvpn/server/dh.pem
mode server
tls-server
ifconfig 168.168.168.1 255.255.255.0
ifconfig-pool 168.168.168.10 168.168.168.100
route-gateway 168.168.168.1
#push "route-gateway 168.168.168.1"
keepalive 10 300
comp-lzo
persist-key
persist-tun
log /etc/openvpn/openvpn-status.log
verb 3
topology subnet
push "redirect-gateway def1 bypass-dhcp"
EOF

client_file="etc/openvpn/client.ovpn"
cat > "$client_file" <<EOF





