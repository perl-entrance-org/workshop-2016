#!/usr/bin/env perl

use strict;
use warnings;


my @array = (1, 2, "three");
my %hash = (
    name       => 'takasago',
    twitter_id => 'sago35tk',
);

use Data::Dumper;
#print Dumper @array;
#print Dumper \%hash;
output_array_and_hash(\@array, \%hash);

sub output_array_and_hash {
    my $array_ref = shift @_;
    my $hash_ref  = shift @_;

    # ここに出力プログラムを書く
    #printf "$array_ref\n";
    #printf "@$array_ref\n";
    printf "-- array_ref --\n";
    for my $x (@$array_ref) {
        printf "%s\n", $x;
    }

    printf "\n";
    printf "-- hash_ref --\n";
    #printf "$hash_ref\n";
    #print Dumper $hash_ref;
    for my $key (keys %$hash_ref) {
        printf "%-10s => %s\n", $key, $hash_ref->{$key};
    }
}
