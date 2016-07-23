#!/usr/bin/env perl
use strict;
use warnings;

my $answer = 'perl';

print 'input > ';
my $str = <STDIN>;
chomp $str;

if ($answer eq $str) {
    print "OK!\n";
}
else {
    print "NG!\n";
}
