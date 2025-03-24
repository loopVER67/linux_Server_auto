#!/bin/bash

apt update && upgrade -y

apt install openssh-client openssh-server ovpn-server -y
apt install icinga2 monitoring_plugins
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

echo "install ido-pgsql"
apt install icinga2-ido-pgsql


