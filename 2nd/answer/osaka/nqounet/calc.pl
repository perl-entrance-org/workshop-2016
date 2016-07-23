#!/usr/bin/env perl
use strict;
use warnings;

print 'input 1st number > ';
my $foo = <STDIN>;
chomp $foo;
print 'input 2nd number > ';
my $bar = <STDIN>;
chomp $bar;

my $sum = $foo + $bar;
my $sub = $foo - $bar;
my $mul = $foo * $bar;
my $div = $foo / $bar;
my $mod = $foo % $bar;
my $pow = $foo**$bar;

print "$foo + $bar = $sum\n";
print "$foo - $bar = $sub\n";
print "$foo * $bar = $mul\n";
print "$foo / $bar = $div\n";
print "$foo % $bar = $mod\n";
print "$foo ** $bar = $pow\n";
