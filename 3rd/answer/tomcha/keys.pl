#!/usr/bin/env perl

use strict;
use warnings;

my %hash = (
  name  => 'tomcha',
  age   => 43,
  food  => 'sushi',
  foo   => 'foooooo',
  bar   => 'barrrrr',
  baz=> 'bazzzzz',
);

my @keys = keys %hash;

for my $k (@keys){
  print ">>$hash{$k}\n";
}
