#!/usr/bin/env perl

use strict;
use warnings;

my $num = <STDIN>;
chomp $num;

my $res = 1;
my @pool = (1 .. $num);
for my $val (@pool) {
    $res  = $res * $val;
}

print $res, "\n";
