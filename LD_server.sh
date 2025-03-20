#!/bin/bash
### edit the nat according to exam
OUT_INT='ens18'


# update the system
apt upgrade && update -y

# install all required package
apt install curl net-tools haproxy bind9 ufw open-y
####################NAT##########################
# activate the nat
echo 1 > /proc/sys/net/ipv4/ip_forward
echo "memulai nat"
iptables -t nat -A POSTROUTING -o $OUT_INT -j MASQUERADE
echo 'menyimpan file konfigurasi'
sudo sh -c “iptables-save > /etc/iptables.rules”



