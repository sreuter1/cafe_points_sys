#!/usr/bin/perl

# Global variables
my $phone = $ARGV[0];

# Display available items
print "Items available:\n";
@items = `sqlite3 rewards.db "SELECT id, name, usd_cost FROM items"`;
foreach $item (@items) {
	print $item;
}

# Get user input for the item to purchase
print "Enter item ID to purchase: ";
$item_id = <STDIN>;
chomp($item_id);

# Get the cost of the selected item
$cost = `sqlite3 rewards.db "SELECT usd_cost FROM items WHERE id = $item_id"`;
chomp($cost);

# Get the user's current points
$points = `sqlite3 rewards.db "SELECT points FROM users WHERE phone = '$phone'"`;
chomp($points);

$added_points = int($cost);
$total_points = $points + $added_points;

# Updating the points
`sqlite3 rewards.db "UPDATE users SET points = points + $added_points WHERE phone =
'$phone'"`;
print "Updated points: $total_points\n";
