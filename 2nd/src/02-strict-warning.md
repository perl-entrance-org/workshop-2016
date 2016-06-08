# 前回の復習

## Hello, World!
    print "Hello, World!\n";

- このように書いたものを, `hello.pl`として保存します
- `print`は, 端末に文字を出力します
- `\n`は改行を表します
- 最後に`;`を忘れずに!

## Hello, World! の実行
    $ perl hello.pl
    Hello, World!

- `perl`の引数に実行するスクリプトファイル名を与えると, そのスクリプトを実行します

## おまじない
    #!/usr/bin/env perl
    use strict;
    use warnings;

- おまじないとして, 冒頭の3行を書くようにしよう
- `use strict` -> 厳密な書式を定めたり, 未定義の変数を警告するといった効果があります
- `use warnings` -> 望ましくない記述を警告してくれる効果があります
    - 以下, この資料のサンプルコードでは｢お約束｣を省略します
    - **書かれているもの**として扱ってください

## 復習問題
- `Hello, Perl Entrance!`という文字列を出力する`hello_perl.pl`を書いて下さい
    - わからない所があれば, 近くのサポーターに聞いて下さい!
