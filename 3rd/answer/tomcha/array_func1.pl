#!/usr/bin/env perl

use strict;
use warnings;

my @array = ('Alice', 'Bob', 'Chris');

print "@array\n";
my $name = shift @array;
print "$name\n";
print "@array\n";


my $name2 = pop @array;
print "$name2\n";
print "@array\n";
