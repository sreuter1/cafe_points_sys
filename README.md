# cafe_points_sys

This is a project where I use Perl, Bash, Python, AWK and SQLite3 to create a simple cafe points database where the more money you spend, the more points you get to unlock discounts.

The following is the project flow chart that was made to get the scope and functionality of the project down with my partner George Good. We collaborated on the whole project:
<img width="441" height="281" alt="Screenshot 2026-05-04 at 6 47 53 PM" src="https://github.com/user-attachments/assets/b0f9a0ab-f47a-4aa5-919a-8941b2401d23" />

You may need to change permissions and look at the database to be able to test. I recommend changing permissions on the Perl scripts and main.sh. To run the scripts this is what should be ran:

chmod +x main.sh
chmod +x transaction.pl
chmod +x purchase.pl
./main.sh

Given more time, I would try to configure the users database to MySQL instead of SQLite3 because that can be accessed from beyond the local machine. Additionally, I would use gui to make this more readable and have a greater user experience, since reading from the terminal doesn't feel as nice or official. Additionally, I would like to offer more encryption to the user data as well, through MySQL. 
