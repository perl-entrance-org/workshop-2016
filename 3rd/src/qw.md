## qw ショートカット
    my @array = qw( Alice Bob Chris ); # ('Alice', 'Bob', 'Chris')

- これまでのリストの書き方, `('値をコンマで区切って', '並べて', 'カッコで囲んだもの')` と違って、クォート記号が不要です。
- 空白文字 (スペース、タブ、改行など) は捨てられ、残ったものがリストの要素になります。
- なので、こういう書き方もできます。

    my @arary = qw(
        Alice
        Bob
    );

## qw ショートカット
    # デリミタ (区切り文字) には任意の記号文字が使えます。例えば...
    qw! Alice Bob !
    qw# Alice Bob #
    qw/ Alice Bob /

これらは前述の

    qw( Alice Bob )

と等しくなります。

## qw ショートカット
    qw/http://www.perl-entrance.org http://www.yahoo.com/
    # これは困った！ エラーになってしまう！
    # デリミタがスラッシュ (/) で、要素中にもスラッシュが含まれてしまっている

解決法は2つ

    # 1. スラッシュをバックスラッシュでエスケープしてあげる
    qw/ http:\/\/www.perl-entrance.org http:\/\/www.yahoo.com /  # => 読みにくく感じるかもしれない
    # 2. デリミタを変える
    qw! http://www.perl-entrance.org http://www.yahoo.com !      # => ちょっと読みやすいかもしれない

## split
split は指定したパターンに従って文字列を分割します。

    my $poem  = 'I Love Perl.';
    my @words = split / /, $poem; # => ('I', 'Love', 'Perl.')

引数として与えた文字列を // でくくった文字 (上の例だと半角スペース) で分割して配列に格納します。

(ところで、// は正規表現リテラルと呼ばれるものです。正規表現リテラルの話は長くなるので、次回以降に紹介します。今は「そういうものなんだ…」と耐えてください)

## join
join は 分割された文字列をくっつけて1つの文字列にします。(split の逆の働きですね)

    my @words = qw( I Love Perl. ); # => qw ショートカット
    my $poem  = join '_', @words;
    print $poem;  # => 'I_Love_Perl.'

join の受け取る第1引数は糊のようなものです。リストの要素をくっつけるときに、その間にはさみます。
(今回の場合だと、 '\_' という風に指定しているので、リストの各要素をアンダースコアでくっつけます)
第2引数はバラバラになった文字列の配列です。

## reverse
reverse は リストを逆順に並べ替えてリストで返します。

    my @lang = qw(perl php ruby python java go);
    my @reversed = reverse @lang;
    print "@reversed"; # => go java python ruby php perl
## sort
sort は リストをルール順に並べ替えてリストで返します。

    my @lang = qw(perl php ruby python java go);
    my @sorted = sort @lang; 
    print "@sorted"; # => go java perl php python ruby

今回の例ではルールを指定しなかったので文字コード順に並び替えられました。
ルールを指定すればさらに複雑な並び替えも可能です。 => http://perldoc.jp/func/sort

## 練習問題 (1/2)
- 次のような挙動をするコードを, `join.pl`として作成しましょう.
    1. ("0120" "123" "XXX") という内容の配列を qw ショートカットを使って作ってみましょう。
    2. 上の問題で作った配列を繋げてみましょう。なんだか電話番号っぽいので、ハイフン ('-') を間にはさみましょう。

## 練習問題 (2/2)
- 次のような挙動をするコードを, `split.pl`として作成しましょう.
    1. 文字列 "/usr/bin/env perl" という文字列をスラッシュ ('/') で分割し、配列に格納してみましょう。
    2. その配列を出力した時の結果を予想してみましょう. 予想出来たら実際に出力してみましょう. 期待通りに出力されましたか? そうでない場合, なぜそのような挙動になったか考えてみましょう(わからなければ, サポーターの方に聞いてみましょう!)
