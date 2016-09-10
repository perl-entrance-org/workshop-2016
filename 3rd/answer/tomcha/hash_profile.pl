#!/usr/bin/env perl

use strict;
use warnings;

my %hash = (
  name    =>  'tomcha',
  age     =>  43,
  food    =>  'sushi',
);

delete $hash{name};

if (exists $hash{name}){
  print "name はあります \n";
}
else{
  print "name はありません \n";
}

#my @keys = keys %hash;
#my @vals = values %hash;
#
#print "keys: @keys\n";
#print "vals: @vals\n";
#
