#!/usr/bin/env perl

use strict;
use warnings;

my %hash = (
  name    => 'tomcha',
  age     =>  43,
  food    =>  'sushi',
);

my @keys_array = keys %hash;
print "@keys_array\n";

delete $hash{age};

if (exists $hash{age}){
  print "ageはあります。\n";
}
else{
  print "age is not exists\n";
}
