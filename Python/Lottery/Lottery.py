# Author: ZVitoX (GitHub.com/ZVitoX)
# Script for selecting a random winner from a list of names stored in a file

from rich.console import Console 
from rich.text import Text 
from playsound import playsound 
from pyfiglet import Figlet 
import subprocess 
import platform 
import random 

console = Console()

# Function to clear the console based on the operating system
def clear_console():
	if platform.system() == "Windows":
		subprocess.run("cls", shell=True)
	else:
		subprocess.run("clear", shell=True)

# Function to read names from a file and return as a list
def read_names_from_file(filename):
	with open(filename, "r") as file:
		return [line.strip() for line in file.readlines()]

# Function to display countdown 
def countdown(seconds):
	figlet = Figlet(font='big')
	for sec in range(seconds, 0, -1):
		clear_console()
		figlet_text = figlet.renderText(str(sec))
		console.print(Text(f"\n{figlet_text}", style="bold red"), justify="center")
		playsound("beep.mp3")

# Main function to execute the program
def main():
	clear_console()

	countdown_seconds = 10
	countdown(countdown_seconds)
	
	clear_console()

	names_list = read_names_from_file("list.txt")
	winner = random.choice(names_list)

	winner_text = Text(f"<<-- ", style="bold red") + Text(f"{winner}", style="bold green") + Text(f" -->>", style="bold red")

	console.print(Text("\nThe lucky winner is:\n", style="bold cyan"), justify="center")
	console.print(winner_text, justify="center")

	playsound("win.mp3")

main()
