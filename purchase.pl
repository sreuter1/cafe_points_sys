#!/usr/bin/perl

# Global variables
my $phone = $ARGV[0];

# Display available items
print "Items available:\n";
@items = `sqlite3 rewards.db "SELECT id, name, point_cost FROM items"`;
foreach $item (@items) {
	print $item;
}

# Get user input for the item to purchase
print "Enter item ID to purchase: ";
$item_id = <STDIN>;
chomp($item_id);

# Get the cost of the selected item
$cost = `sqlite3 rewards.db "SELECT point_cost FROM items WHERE id = $item_id"`;
chomp($cost);

# Get the user's current points
$points = `sqlite3 rewards.db "SELECT points FROM users WHERE phone =
'$phone'"`;
chomp($points);

# Perform the purchase
if ($points >= $cost) {
	`sqlite3 rewards.db "UPDATE users SET points = points - $cost WHERE phone = '$phone'"`;
	$new_points = $points - $cost;
	print "Purchase successful! Remaining points: $new_points\n";
} else {
	print "Insufficient points.\n";
}
