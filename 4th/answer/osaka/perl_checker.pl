#!/usr/bin/env perl

use strict;
use warnings;

perl_checker("perl");
perl_checker("Perl");
perl_checker("ruby");
perl_checker("pearl");
perl_checker("abcperlefg");

sub perl_checker {
    my $str = shift @_;
    printf "%s -> ", $str;
    # perl もしくは Perl が含まれる場合
    if ($str =~ /[pP]erl/) {
        printf "Perl Monger!\n";
    } else {
        printf "Not Perl Monger!\n";
    }
}

