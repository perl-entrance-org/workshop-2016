#!/usr/bin/env perl

use strict;
use warnings;

my $ref = [1, 2, 3];
my $ref_h = {name => 'tomcha', age => 43};

print "@$ref\n";
my @key = keys %$ref_h;
print "@key\n";


