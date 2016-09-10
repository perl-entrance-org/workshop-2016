#!/usr/bin/env perl

use strict;
use warnings;

my @array = qw(Alice Bob Chris);
my $ref = \@array;
my %hash = (
  name => 'tomcha',
  age  => 43,
);
my $ref_h = \%hash;

my $ref2 = ['Alice', 'Bob', 'Chris'];
my $ref_h2 = {
  name => 'tomcha',
  age  => 43,
};


