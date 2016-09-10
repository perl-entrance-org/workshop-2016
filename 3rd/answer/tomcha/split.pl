#!/usr/bin/env perl

use strict;
use warnings;

my $string = "/usr/bin/env perl";
my @array = split /\//, $string;
print "@array\n";
print "$array[0]\n";

# printする時に、
# print "@array\n";
# ではなく、
# print $array[1];
# みたいに、要素を出して確認してみましょう。
