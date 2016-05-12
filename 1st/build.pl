#!/usr/bin/env perl
use utf8;
use strict;
use warnings;

use Path::Tiny;

my $src_dir = './src';
my $dst_dir = '.';
my @part1 = qw/
/;
my @part2 = qw/
/;
my @part3 = qw/
  about_perl_entrance.md
  about_perl_language.md
  more_study.md
  hello_world.md
/;

path("$dst_dir/part1.md")->spew_utf8(slurp_md(@part1));
path("$dst_dir/part2.md")->spew_utf8(slurp_md(@part2));
path("$dst_dir/part3.md")->spew_utf8(slurp_md(@part3));

sub slurp_md {
    my @slides = @_;

    my $slide
        = "<!-- このファイルは直接編集せずに src ディレクトリ内のファイルを編集し build.pl を実行してください。 -->\n";
    $slide .= join(
        "\n---\n",
        map {
        my $str = path("$src_dir/$_")->slurp_utf8;
        $str =~ s/\n(##? )/\n___\n$1/g;
        $str =~ s!public/image!src/public/image!g;
        $str;
        } @slides
    );
}
