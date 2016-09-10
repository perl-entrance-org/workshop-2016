#!/usr/bin/env perl

use strict;
use warnings;

my @telno = qw(0123 123 XXXX);
my $string = join '-', @telno;
print "$string\n";
