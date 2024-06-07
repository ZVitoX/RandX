#!/bin/bash
# Author: ZVitoX (GitHub.com/ZVitoX)
# Script for selecting a random winner from a list of names stored in a file

bold_red="\e[1;31m" 
bold_blue="\e[1;36m" 
bold_green="\e[1;32m"
bold_white="\e[1;37m" 

# Function to read names from a file and return as a list
read_names_from_file() {
	local filename=$1
	names=()
	while IFS= read -r line; do
		names+=("$line")
	done < "$filename"
}

# Function to display countdown
countdown() {
	local seconds=$1
	for (( sec=seconds; sec>0; sec-- )); do
		clear
		echo 
		echo -e "${bold_red}"; figlet -f "big" "$sec"
		#sleep 1
		mpg123 beep.mp3 > /dev/null 2>&1
	done
}

# Main function to execute the program
main() {
	clear

	countdown_seconds=5
	countdown $countdown_seconds
	
	clear

	read_names_from_file "list.txt"

	winner=${names[RANDOM % ${#names[@]}]}

	echo -e "\n ${bold_blue}The lucky winner is:"
	echo -e "\n ${bold_red}<<-- ${bold_green}$winner ${bold_red}-->>"
	mpg123 win.mp3 > /dev/null 2>&1
}

# Ensure required tools are installed
if ! command -v figlet &> /dev/null
then
	echo "Please install figlet to run this script."
	exit 1
fi

main
