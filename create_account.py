#!/usr/bin/python3

import sqlite3
import sys

# Getting the user's name and phone number
name = sys.argv[1]
phone = sys.argv[2]

# Maybe verify that the phone number is all numbers and valid length
# Verify that it doesn't already exist

# Database Connection
connection = sqlite3.connect('rewards.db')
cursor = connection.cursor()

# Perhaps Check if it already exists with select

# Inserting the values to the table
cursor.execute("INSERT INTO users (name, phone, points) VALUES (?,?,?)",
(name,phone,100))
connection.commit()

connection.close()

print ("Account created for", name, "with 100 points!")
