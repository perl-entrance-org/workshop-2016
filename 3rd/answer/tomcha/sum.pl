#!/usr/bin/env perl

use strict;
use warnings;

my @array;
@array = (1..100);

my $ans = 0;
for my $i (@array){
  $ans = $ans + $i;
}
print "$ans\n";
