# Author: ZVitoX (GitHub.com/ZVitoX)
# Script for selecting a random option from a list of provided items

from colorama import Fore as color, init as colorama_init
import subprocess
import platform
import argparse
import random
import sys

# Initialize colorama
colorama_init(autoreset=True)

def clear_console():
	"""Clear the console based on the operating system."""
	command = "cls" if platform.system() == "Windows" else "clear"
	subprocess.run(command, shell=True, check=True)

def get_options_from_user():
	"""Prompt the user to input items and add them to a list."""
	clear_console()

	options = []

	while True:
		item = input(f"\n{color.LIGHTCYAN_EX}[+] {color.LIGHTRED_EX}Enter your item name {color.LIGHTCYAN_EX}(0 to end){color.LIGHTRED_EX}:{color.LIGHTWHITE_EX} ")
		
		if item.strip() == "0":
			if options:
				return options

			else:
				input(f"\n{color.LIGHTYELLOW_EX}[!] {color.LIGHTRED_EX}You didn't enter any items! {color.LIGHTYELLOW_EX}(Press Enter to continue) ")

		elif not item.strip():
			input(f"\n{color.LIGHTYELLOW_EX}[!] {color.LIGHTRED_EX}Item cannot be empty! {color.LIGHTYELLOW_EX}(Press Enter to continue) ")

		else:
			options.append(item)

def random_choice(options):
	"""Randomly choose an item from the list of options."""

	# Perform the random selection multiple times to enhance randomness
	for _ in range(1, 6):
		choice = random.choice(options).title()

	input(f"\n{color.LIGHTGREEN_EX}[+] {color.LIGHTCYAN_EX}In my opinion, choose {color.LIGHTRED_EX}{choice}{color.LIGHTCYAN_EX} this time. {color.LIGHTGREEN_EX}(Press Enter to continue) ")		

def display_menu():
	"""Display a menu for the user to choose options."""

	print("")
	print(f"{color.LIGHTRED_EX}1. {color.LIGHTWHITE_EX}Enter items manually")
	print(f"{color.LIGHTRED_EX}2. {color.LIGHTWHITE_EX}Use items from command line arguments")
	print(f"{color.LIGHTRED_EX}3. {color.LIGHTWHITE_EX}Exit")

def handle_user_choice(option, cli_options):
	"""Handle the user's menu choice."""
	
	if option.strip() == "1":
		options = get_options_from_user()
		random_choice(options)

	elif option.strip() == "2":
		if cli_options:
			random_choice(cli_options)

		else:
			input(f"\n{color.LIGHTYELLOW_EX}[!] {color.LIGHTRED_EX}No items provided in command line arguments! {color.LIGHTYELLOW_EX}(Press Enter to continue) ")

	elif option.strip() == "3":
		print(f"{color.LIGHTRED_EX}\nExiting...")
		sys.exit(1)

	else:
		input(f"\n{color.LIGHTYELLOW_EX}[!] {color.LIGHTRED_EX}Invalid choice! Please select a valid option. {color.LIGHTYELLOW_EX}(Press Enter to continue) ")

def main():
	"""Main function to run the script."""

	parser = argparse.ArgumentParser(description="Random option selector")
	parser.add_argument('-l', '--list', nargs='+', help='List of items to choose from')
	args = parser.parse_args()

	cli_options = args.list if args.list else []

	while True:
		clear_console()
		display_menu()

		try:
			option = int(input(f"\n{color.LIGHTYELLOW_EX}[*] {color.LIGHTCYAN_EX}Choose an option {color.LIGHTYELLOW_EX}=> {color.LIGHTRED_EX}"))
			handle_user_choice(option, cli_options)

		except ValueError:
			input(f"\n{color.LIGHTYELLOW_EX}[!] {color.LIGHTRED_EX}Invalid input! Please enter a number. {color.LIGHTYELLOW_EX}(Press Enter to continue) ")

		except KeyboardInterrupt:
			print(f"\n\n{color.LIGHTYELLOW_EX}[!] {color.LIGHTRED_EX}Operation cancelled.")
			sys.exit(1)

		except Exception as e:
			print(f"\n{color.LIGHTYELLOW_EX}[!] There was an error: {color.LIGHTRED_EX}{str(e)}\n")
			sys.exit(1)

if __name__ == "__main__":
	main()
