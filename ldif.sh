#!/bin/bash

cat <<EOF 
  dn: ou=VPN,dc=lksjogja8,dc=lan
  objectClass: organizationalUnit
  ou: VPN

  dn: ou=Mail,dc=lksjogja8,dc=lan
  objectClass: organizationalUnit
  ou: Mail

  dn: ou=Misc,dc=lksjogja8,dc=lan
  objectClass: organizationalUnit
  ou: Misc
EOF > ou.ldif
