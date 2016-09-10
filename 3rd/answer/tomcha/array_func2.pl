#!/usr/bin/env perl

use strict;
use warnings;

my @array = ('Alice', 'Bon', 'Chris');

print "@array\n";

unshift @array, 'Eve';
push @array, 'Diana';

print "@array\n";
