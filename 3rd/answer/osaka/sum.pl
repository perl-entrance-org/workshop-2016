#!/usr/bin/env perl

use strict;
use warnings;

my @pool = (1 .. 100);

my $res = 0;
for my $val (@pool) {
    $res = $res + $val;
}

print $res, "\n";

