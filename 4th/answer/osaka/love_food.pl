#!/usr/bin/env perl

use strict;
use warnings;


my $words_ref = [
    'alice loves meat!',
    'bob loves sushi!',
];

love_food($words_ref);

sub love_food {
    my $array_ref = shift;
    for my $item (@$array_ref) {
        #printf "- %s\n", $item;
        if ($item =~ /(.+) loves (.+)!/) {
            printf "$1 -> $2\n";
        } else {
            printf "error\n";
        }
    }
}
