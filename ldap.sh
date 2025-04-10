# Range user yang ingin dibuat
START=1
END=10

# Password default atau unik untuk setiap user
USERS="localuser" #ganti nama sesuai perintah
DEFAULT_PASSWORD="12345678" # ganti password sesuai perintah

for i in $(seq $START $END); do
    USERNAME="$USERS$i"
    ldapadduser $USERNAME 1000
    ldapsetpasswd $USERNAME $DEFAULT_PASSWORD
    if [ $? -eq 0 ]; then
        echo "User $USERNAME added successfully with password $PASSWORD"
    else
        echo "Failed to add user $USERNAME"
    fi
done
