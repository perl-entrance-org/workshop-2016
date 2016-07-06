#!/usr/bin/env perl
use strict;
use warnings;
use utf8;

use Path::Tiny;

my $src_dir = './src';
my $dst_dir = '.';
my @slides  = qw/
  intro.md
  array-func.md
  qw.md
  hash.md
  hash-func.md
  reference.md
  outro.md
  /;
my $slide
  = "<!-- このファイルは直接編集せずに src ディレクトリ内を編集し build.pl を実行してください。 -->\n";
$slide .= join(
    "\n---\n",
    map {
        my $str = path("$src_dir/$_")->slurp_utf8;
        $str =~ s/\n(##?)/\n___\n$1/g;
        $str
    } @slides
);
path("$dst_dir/slide.md")->spew_utf8($slide);
