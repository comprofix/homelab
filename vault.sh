#!/bin/bash

# If number of arguments is 0
if [ $# -eq 0 ]
  then
    echo "This script will encrypt of decrypt all files containing secrets."
    echo "There are all files in vars as well as all secrets.yaml files under each service."
    echo "Specify 'decrypt' or 'encrypt' as argument"
    echo "If you put the vault password in a password file named .vault_password, the script will not ask for a password."
    exit 1
fi

#files=`find . \( -type d -name 'group_vars' -o -name 'vars' \) -exec find {} -type f \;`
files=(
  "./group_vars/all.yml"
  "./scripts/rclone.conf"
)

# password_type=--ask-vault-password
# if [ -f "~/.vault_password.txt" ]
#   then
#     if [ `stat -c %a ~/.vault_password.txt` != "600" ]
#       then
#         echo "~/.vault_password.txt file has bad permissions; fixing this to 600"
#         chmod 600 ~/.vault_password.txt
#     fi
#     password_type="--vault-password-file=~/.vault_password.txt"
# fi

if [ $1 == "encrypt" ]
  then
  for file in "${files[@]}"; do
    echo "$file encrypted" 
    ansible-vault encrypt --vault-password-file=~/.vault_password "$file"
    echo $value;
  done

elif [ $1 == "decrypt" ]
  then
  for file in "${files[@]}"; do
    echo "$file decrypted" 
    ansible-vault decrypt --vault-password-file=~/.vault_password "$file"
  done
else
    echo "Wrong argument supplied.  Run without arguments to see allowed ones."
fi
