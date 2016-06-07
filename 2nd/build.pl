#!/usr/bin/env perl
use strict;
use warnings;
use utf8;

use Path::Tiny;

my @slides = qw/
  01-intro.md
  02-use.md
  03-scalar.md
  04-stdin-calc.md
  05-if-else.md
  06-logical-operator.md
  07-array-for.md
  08-outro.md
/;

my $slide = join("\n---\n", map {
    my $str = path("src/$_")->slurp_utf8;
    $str =~ s/\n(##?)/\n___\n$1/g;
    $str
} @slides);
path("slide.md")->spew_utf8($slide);
