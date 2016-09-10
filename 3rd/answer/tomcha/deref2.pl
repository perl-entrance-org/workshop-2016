#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;

my $ref = [1, 2, 3];
my $ref_h = {name => 'tomcha', age => $ref};
my @array = ($ref_h);

print Dumper @array;
print "---------\n";
print $array[0]->{age}->[2];
#print "$ref->[0]\n";
#print "$ref_h->{age}\n";
#
#$ref->[0];
#$ref_h->{age};
