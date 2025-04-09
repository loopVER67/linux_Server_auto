#!/bin/bash
### edit the nat according to exam
OUT_INT='ens18'

# update the system
apt upgrade && update -y

# install all required package
apt install curl net-tools haproxy bind9 ufw chrony
echo > "start nat"
echo 1 > /proc/sys/net/ipv4/ip_forward
echo "memulai nat"
iptables -t nat -A POSTROUTING -o $OUT_INT -j MASQUERADE
echo 'menyimpan file konfigurasi'

cp /etc/bind/db.local /etc/bind/lksjogja.lan
cp /etc/bind/db.127 /etc/bind/reverse
cd /etc/bind
zone_content=$(cat <<EOF
zone "" {
  type master;
};
zone "" {
  type master;
};

EOF
)
echo $zone_content >> named.conf.local

