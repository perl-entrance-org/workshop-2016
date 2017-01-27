#!/usr/bin/env perl
use strict;
use warnings;

# Perl入学式 in東京 2016年度後期第3回 最終問題 解答例
# https://github.com/perl-entrance-org/workshop-2016/blob/master/3rd/slide.md
# see also: https://ja.wikipedia.org/wiki/%E3%82%B5%E3%82%B6%E3%82%A8%E3%81%95%E3%82%93%E3%81%AE%E7%99%BB%E5%A0%B4%E4%BA%BA%E7%89%A9

my $isono = {
    father => 'namihei',
    mother => 'fune',
    son => 'katsuo',
    daughter => ['sazae', 'wakame'],
    cat => 'tama',
};

my $fuguta = {
    father => 'masuo',
    mother => 'sazae',
    son => 'tarao',
};

my $sazae_characters = {
    father => {
        name => 'namihei',
        brother => 'umihei',
        sister => {
            name => 'nagie',
            son => {
                name => 'norisuke',
                wife => 'taiko',
                son => 'ikura',
            }
        }
    },
    mother => 'fune',
    son => {
        name => 'katsuo',
        friend => ['nakajima', 'hanazawa', 'kaori', 'hayakawa'],
    },
    daughter => [ {
            name => 'sazae',
            husband => 'masuo',
            son => {
                name => 'tarao',
                friend => {
                    girl => 'rika',
                    boy => 'takeo',
                },
            },
        }, {
            name => 'wakame',
            friend => 'horikawa',
        }],
    cat => 'tama',
};

# 配列リファレンスの要素を取り出す
print "Isono family's second daughter is $isono->{daughter}->[1].\n";

# ハッシュリファレンスの要素を取り出す
print "Fuguta family's son is $fuguta->{son}.\n";

# ハッシュリファレンスの中の配列リファレンスの中のハッシュリファレンスの要素を取り出す
print "Isono family's eldest daughter's son's friend of boy is $sazae_characters->{daughter}->[0]->{son}->{friend}->{boy}.\n";

# Data::Dumperでリファレンス全体の中身を出力
use Data::Dumper;
print Dumper $sazae_characters;

