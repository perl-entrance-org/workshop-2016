#!/usr/bin/env perl

use strict;
use warnings;


my $str = 'I love ruby';

printf "before: %s\n", $str;

$str =~ s/ruby/perl/;
printf "after : %s\n", $str;

$str =~ s/ruby/python/;
printf "after2: %s\n", $str;

$str =~ s/perl/python/;
printf "after3: %s\n", $str;

