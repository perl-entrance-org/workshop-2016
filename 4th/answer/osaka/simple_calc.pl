#!/usr/bin/env perl

use strict;
use warnings;

sub add {
    my ($left, $right) = @_;
    return $left + $right;
}

sub min {
    my ($left, $right) = @_;
    return $left - $right;
}

sub mul {
    my ($left, $right) = @_;
    return $left * $right;
}

sub div {
    my ($left, $right) = @_;
    return $left / $right;
}

printf "add(2,5) = %s\n", add(2,5);
printf "min(2,5) = %s\n", min(2,5);
printf "mul(2,5) = %s\n", mul(2,5);
printf "div(2,5) = %s\n", div(2,5);
