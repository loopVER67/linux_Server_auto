#!/bin/bash

apt install docker docker-compose smbclient slapd ldap-utils pip -y
apt install python3.12-venv
python3 -m venv .venv
