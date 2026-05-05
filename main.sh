#!/bin/bash

DB="rewards.db"

# Creating display menu func
display_menu()
{
	echo "1. Create Account"
	echo "2. Log In"
	echo "3. Make Transaction with Points"
	echo "4. Make Transaction with Money"
	echo "5. Log Out"
	for item in "${menu_items[@]}"; do
		if [[$item =~^[0-9\..* ]]; then # Regex to validate format
			echo "$item"
		else
			echo "Invalid menu item format: $item"
		fi
	done
}

# Creating the create_account func
create_account()
{
	read -p "Please enter your name: " name
	read -p "Please enter your phone number: " phone

	# Can create any checks for the phone and such here
	
	python3 create_account.py "$name" "$phone"
}

# Creating the login_user func
login_user()
{
	read -p "Please enter your name: " name
	read -p "Please enter your phone number: " phone
	python3 auth.py "$name" "$phone"
	if [ $? -eq 0 ]; then
		logged_in=true
	fi
}

# Creating the use_points func
use_points()
{
	if [ "$logged_in" = true ]; then
		./purchase.pl $phone
	else
		echo "Please log in first."
	fi
}

# Creating the gain_points func
gain_points()
{
	if [ "$logged_in" = true ]; then
		./transaction.pl $phone
	else
		echo "Please log in first"
	fi
}

# Main program loop
logged_in=false
while true; do
	display_menu
	read -p "Choose an option: " choice
	# Modify choice using AWK (e.g., normalize input)
	choice=$(echo "$choice" | awk '{if ($1 ~ /^[1-5]$/) print $1; else print "invalid";}')

	case $choice in
		1)
			echo "You selected Create Account."
			create_account
			;;
		2)
			echo "You selected Log In."
			login_user
			;;
		3)
			echo "You selected Purchase With Points."
			use_points
			;;
		4)
			echo "You selected Purchase With Money."
			gain_points
			;;
		5)
			echo "You selected Log Out."
			echo "Goodbye!"; exit
			;;
		invalid)
			echo "Invalid choice. Please select a valid option."
			;;
		*)
			echo "Unexpected error occurred."
			;;
	esac
done
