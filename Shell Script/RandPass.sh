#!/bin/bash
# Author: ZVitoX (GitHub.com/ZVitoX)
# Script for generate random password 

length=12

password=$(tr -dc '[:alnum:]!@#$%^&*()_+-=[]{}|;:,.<>?~' < /dev/urandom | head -c $length)

echo -e "\nYour random password is: $password\n"
