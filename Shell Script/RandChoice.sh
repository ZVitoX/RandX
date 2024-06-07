#!/bin/bash
# Author: ZVitoX (GitHub.com/ZVitoX)
# Script for selecting a random option from a list of provided items

bold_red="\e[1;31m" 
bold_blue="\e[1;36m" 
bold_green="\e[1;32m"
bold_white="\e[1;37m" 

# Function to randomly choose an item from the provided arguments
random_choice () {
	# Perform the random selection multiple times to enhance randomness
	for _ in {1..6}
	do
		choice=$(shuf -n1 -e "$@")	
	done
	
	echo -e "\n${bold_blue}In my opinion, choose ${bold_red}${choice^}${bold_blue} this time.\n"
}

# Check if at least one argument is provided
if [ "$#" -lt 2 ]
then
	echo -e "\n${bold_red}Usage: ${bold_white}$0 ${bold_green}Item1 Item2 ...\n"
	exit 1

else 
	random_choice "$@"
fi
