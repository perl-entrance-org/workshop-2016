#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;

my $yourname = {
  name    => 'tomcha',
  address =>  'osaka',
  age     => 43,
};

print Dumper $yourname;
