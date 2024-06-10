#!/bin/bash
# Author: ZVitoX (GitHub.com/ZVitoX)
# Script for generate random password 

bold_red="\e[1;31m" 
bold_blue="\e[1;36m" 
bold_green="\e[1;32m"
bold_white="\e[1;37m" 
bold_yellow="\e[1;33m"

# Default settings
count=1
chars=8
minchars=8
maxchars=8
use_md5=false
use_sha256=false
use_sha512=false
character_set='[:alnum:]!@#$%^&*()_+-=[]{}|;:,.<>?~'

# Helper function to display usage
usage() {
	echo ""
	echo "Generate Random Passwords."
	echo ""
	echo "Usage: $0 [OPTIONS]"
	echo ""
	echo "Options:"
	echo "	-c, --count NUM		Number of passwords to generate (default: 1)"
	echo "	-l, --length NUM	Length of each password (default: 8)"
	echo "	-m, --min NUM		Minimum length of each password (default: 8)"
	echo "	-x, --max NUM		Maximum length of each password (default: 8)"
	echo "	--md5			Generate MD5 hashed passwords"
	echo "	--sha-256		Generate SHA-256 hashed passwords"
	echo "	--sha-512		Generate SHA-512 hashed passwords"
	echo "	-h, --help		Show this help message and exit"
}

# Processing command-line arguments
while [[ "$#" -gt 0 ]]
do
	case $1 in
		-c|--count) count="$2"; shift ;;
		-l|--length) chars="$2"; minchars="$2"; maxchars="$2"; shift ;;
		-m|--min) minchars="$2"; shift ;;
		-x|--max) maxchars="$2"; shift ;;
		--md5) use_md5=true ;;
		--sha-256) use_sha256=true ;;
		--sha-512) use_sha512=true ;;
		-h|--help) usage; exit 0 ;;
		*) echo -e "\n${bold_yellow}[!] ${bold_red}Unknown parameter passed${bold_yellow}: ${bold_white}$1\n"; usage; exit 1 ;;
	esac
	shift
done

# Helper function to generate a password
generate_password() {

	length=$((minchars + RANDOM % (maxchars - minchars + 1)))
	password=$(tr -dc "$character_set" < /dev/urandom | head -c $length)
	
	echo -e "\n${bold_yellow}[+] ${bold_red}Your random password is${bold_yellow}: ${bold_green}$password"
}

# Generating passwords
for ((i = 0; i < count; i++)); do

	if $use_md5; then
		hashed_password=$(echo -n "$password$salt" | md5sum | awk '{print $1}')
		generate_password
		echo -e "${bold_yellow}[*] ${bold_red}MD5 password${bold_yellow}: ${bold_green}$hashed_password"

	elif $use_sha256; then
		hashed_password=$(echo -n "$password$salt" | sha256sum | awk '{print $1}')
		generate_password
		echo -e "${bold_yellow}[*] ${bold_red}SHA-256 password${bold_yellow}: ${bold_green}$hashed_password"

	elif $use_sha512; then
		hashed_password=$(echo -n "$password$salt" | sha512sum | awk '{print $1}')
		generate_password
		echo -e "${bold_yellow}[*] ${bold_red}SHA-512 password${bold_yellow}: ${bold_green}$hashed_password"

	else
		generate_password
	fi
done
