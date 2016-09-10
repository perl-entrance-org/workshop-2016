#!/usr/bin/env perl

use strict;
use warnings;

my @moto = qw(a b c d);
my @copy = @moto;
$copy[2] = 'xxx';

print "moto:$moto[2], copy:$copy[2]\n";

#------------------------------------

my $copy_ref = \@moto;
$copy_ref->[2] = 'zzz';

print "moto:$moto[2], copy_ref:$copy_ref->[2]\n";
