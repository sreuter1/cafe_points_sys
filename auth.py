#!/usr/bin/python3

import sqlite3
import sys

# Prompting for the name and phone number
name = sys.argv[1]
phone = sys.argv[2]

# Database connection and authentication
connection = sqlite3.connect('rewards.db')
cursor = connection.cursor()

cursor.execute("SELECT * FROM users WHERE name = ? AND phone = ?", (name, phone))
user = cursor.fetchone()

if user:
	print("Welcome back,",name,"You have",user[2],"points")
else:
	print("Couldn't find user in the database.")

# Closing the connection
connection.close()
