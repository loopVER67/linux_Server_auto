sudo apt update
sudo apt install dovecot postfix samba -y
cd /etc/samba

share_content=$(cat <<EOF
  [share]
   comment = Public Folder
   path = /home/lnx_server/sharing
   valid users = samba1, lnx_server
   writable = yes
   read only = no
   #guest ok = yes
   #guest only = no
   browseable = yes
   create mask = 0755
   directory mask = 0755
   #force create mode = 775
   #force directory mode = 775

)
echo '$share_content' >> smb.conf
