#!/bin/bash

apt update && upgrade -y

apt install openssh-client openssh-server ovpn-server -y
apt install icinga2 monitoring_plugins
##############################################
#           dns                              #
##############################################
ns=(
"175.15.#.1"
"175.15.#.3"
"8.8.8.8"
)
sed -i '/servername d/' /etc/resolv.conf
for $ns in name
