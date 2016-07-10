#!/usr/bin/env perl

use strict;
use warnings;

my $num = <STDIN>;
chomp $num;

if ($num % 2 == 0) {
    print "even\n";
} else {
    print "odd\n";
}
