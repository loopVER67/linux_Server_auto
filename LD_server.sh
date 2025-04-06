#!/bin/bash
### edit the nat according to exam
OUT_INT='ens18'

# update the system
apt upgrade && update -y

# install all required package
apt install curl net-tools haproxy bind9 ufw chrony
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
####################NAT##########################
# activate the nat
echo > "start nat"
echo 1 > /proc/sys/net/ipv4/ip_forward
echo "memulai nat"
iptables -t nat -A POSTROUTING -o $OUT_INT -j MASQUERADE
echo 'menyimpan file konfigurasi'









