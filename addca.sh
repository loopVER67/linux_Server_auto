cd /etc/openvpn/easy-rsa
 ./easyrsa gen-dh
 ./easyrsa gen-req server 
 ./easyrsa sign-req 
 ./easyrsa gen-req client
 ./easyrsa sign-req
