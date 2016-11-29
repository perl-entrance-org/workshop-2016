#!/usr/bin/env perl

use strict;
use warnings;

my $alice = {
    name        => 'Alice',
    country     => 'England',
    perl        => 60,
    python      => 80,
    ruby        => 80,
    php         => 50,
    binary      => 30,
};
my $bob = {
    name        => 'bob',
    country     => 'America',
    perl        => 40,
    python      => 10,
    ruby        => 20,
    php         => 30,
    binary      => 50,
};
my $carol = {
    name        => 'Carol',
    country     => 'England',
    perl        => 100,
    python      => 70,
    ruby        => 80,
    php         => 50,
    binary      => 50,
};
my $dave = {
    name        => 'Dave',
    country     => 'Canada',
    perl        => 10,
    python      => 11,
    ruby        => 1,
    php         => 100,
    binary      => 100,
};
my $ellen = {
    name        => 'Ellen',
    country     => 'America',
    perl        => 1,
    python      => 15,
    ruby        => 0.5,
    php         => 60,
    binary      => 0.01,
};

#printf "%s\n", $alice->{name};
#printf "%s\n", $alice->{country};
#my $sum = 0;
#$sum = $sum + $alice->{perl};
#$sum += $alice->{python};
#printf "%s\n", $sum;

my @people = (
    $alice,
    $bob,
    $carol,
    $dave,
    $ellen,
);

foreach my $p (@people) {
#    #printf "%s\n", $p->{name};
#    #printf " perl : %s\n", $p->{perl};
    my $sum = 0;
    $sum += $p->{perl};
    $sum += $p->{python};
    $sum += $p->{ruby};
    $sum += $p->{php};
    $sum += $p->{binary};
#    #printf " sum : %s\n", $sum;

    $p->{sum} = $sum;
}

use Data::Dumper;
print Dumper @people;

my $average = {};

foreach my $p (@people) {
    #printf "%s\n", $p->{name};
    #printf " perl   : %s\n", $p->{perl};
    #printf " ruby   : %s\n", $p->{ruby};
    #printf " python : %s\n", $p->{python};
    my $sum = 0;
    $sum += $p->{perl};
    $sum += $p->{ruby};
    $sum += $p->{python};
    #printf " sum : %s\n", $sum;
    #printf " ave : %s\n", $sum / 3;
    $average->{$p->{name}} = $sum / 3;
}

print Dumper $average;


