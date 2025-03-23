#!/bin/bash

apt update && upgrade -y

apt install openssh-client openssh-server ovpn-server -y
apt install icinga2 monitoring_plugins

