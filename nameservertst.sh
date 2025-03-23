#!/bin/bash

# adding nameserver
NS = (
  "10.10.10.30"
  "10.10.10.12"
  "8.8.8.8"
)

sudo sed -i '/nameserver /d' /etc/resolv.conf

for name in "${NS[@]}"
do
  echo "nameserver $name" >> /etc/resolv.conf
done

for name in "${NS[@]}"
do
  echo "- $name"
done
