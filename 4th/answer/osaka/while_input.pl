#!/usr/bin/env perl

use strict;
use warnings;

while (chomp(my $input = <STDIN>)) {
    if ($input eq "0") {
        last;
    } elsif ($input =~ /[Pp]erl/) {
        printf "Find Perl!\n";
    } elsif ($input =~ /python/i) {
        printf "Find Python!\n";
    }

    if ($input =~ /perl|ruby|python/) {
        printf "Love Programming!\n";
    }

    if ($input =~ /^papix/) {
        printf "Find papix!\n";
    }

    if ($input =~ /Hello (.+)/) {
        printf "Hello! $1!\n";
    }
}
