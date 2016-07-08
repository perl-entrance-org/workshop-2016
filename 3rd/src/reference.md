# リファレンス

## リファレンスとは
リファレンスとは参照(実体を指し示すもの)です。  
リファレンスを使うと複雑なデータ構造を表現できます。

## どういうこと？
例えば、リファレンスを使うとハッシュの中にハッシュを格納し、更にそのハッシュにハッシュを格納する……といった複雑なデータ構造を表現できます。

## 具体例 (1/3)
         |     0     |     1     |
    -----+-----------+-----------+
      0  |  maguro   |   katsuo  |
    -----+-----------+-----------+
      1  |    tai    |   hirame  |
    -----+-----------+-----------+

テーブルのようなデータ構造を表現したいとき

## 具体例 (2/3)
    my @akami = ('maguro', 'katsuo');
    my @shiromi = ('tai', 'hirame');
    my @sushi = (@akami, @shiromi);
    print $sushi[1][1]; # => これはエラーになる

今までの知識であれば、配列を用いて<b>行</b>単位の表現はできますが、`n 行 m 列目は maguro` という様に表現したいですね。

## 具体例 (3/3)
    my $akami = ['maguro', 'katsuo'];
    my $shiromi = ['tai', 'hirame'];
    my @sushi = ($akami, $shiromi);
    print $sushi[1][1]; # => hirame

<b>リファレンス</b> を用いることで、このように複雑なデータ構造を表現することが容易になります。

## その他の使いどころ
関数の引数に複数の配列を渡す必要がある場合などに使います。  
また、関数に引数として配列やハッシュを渡すとそれらをコピー (クローン) してしまうので、非効率になる場合があります。  
リファレンスはコピーするのではなく参照を渡すだけなので、その問題を回避することができます。  
(これらはまた後で出てきます)

## リファレンスの例
    my $scalar     = 'scalar';
    my $scalar_ref = \$scalar   # スカラーのリファレンス;
    my @array      = ( 'this', 'is', 'array' );
    my $array_ref  = \@array;   # 配列のリファレンス
    my %hash       = ( this_is => 'hash' );
    my $hash_ref   = \%hash;    # ハッシュのリファレンス

それぞれのシジルの前にバックスラッシュ (\\) を置くことによってそれぞれリファレンスになります。

## 簡単な書き方 (配列)
    my $array_ref = ['This', 'is', 'array-ref'];

普通のかっこ () ではなく角かっこ [] によって要素をくくることで、配列のリファレンスになります。

## 簡単な書き方 (ハッシュ)
    my $hash_ref = {
        this_is => 'hash_ref'
    };

普通のかっこ () ではなく波括弧 {} によってくくってやることで、ハッシュのリファレンスになります。

## さて、ここで print してみましょう
    my $array_ref = ['This', 'is', 'array-ref'];
    print $array_ref;

`ARRAY(0x7fd8938060b8)` みたいな出力が得られると思います (括弧の中身は実行環境によって異なります)  
スカラーリファレンスの場合はSCALAR()、ハッシュリファレンスの場合はHASH() とそれぞれ表示されます。

## これはなに？
最初に言ったように、リファレンスは参照です。  
SCALAR() や ARRAY()、HASH() の括弧の中身に書いてあるのはその実体が格納されているアドレス（場所の情報）です。

## アドレスではなく実体が欲しい時にはどうすれば？
そこで出てくるのが“デリファレンス”です。

## デリファレンスとは
リファレンス(参照)から、元のスカラーや配列やハッシュ(実体)を得るための操作です。

## デリファレンスの例
    my $scalar     = 'scalar';
    my $scalar_ref = \$scalar;
    print $$scalar_ref; # アドレスではなくスカラーが表示される => "scalar"
    my $array_ref  = ["I'm", "scalar-ref"];
    print @$array_ref;  # アドレスではなく配列の中身が展開される => "I'mscalar-ref"
    my $hash_ref   = { this_is => 'hash-ref' };
    print %$hash_ref;   # アドレスではなくハッシュの中身が展開される => "this_ishash-ref"

## デリファレンス (スカラー)
    my $scalar     = 'scalar';
    my $scalar_ref = \$scalar;
    print $$scalar_ref;

スカラーをデリファレンスするためには、そのリファレンスの前にスカラーのシジル ($) を置きます。

## デリファレンス (配列)
    my $array_ref = ['zero', 'one', 'two'];
    print @$array_ref;      # => 配列の中身が展開されます (zeroonetwo)
    print ${$array_ref}[1]; # => 'one'
    print $array_ref->[1];  # => 上と同じ。こう書く方がベター

配列をデリファレンスするためには、そのリファレンスの前に配列のシジル (@) を置きます。  
配列の要素に対してデリファレンスしたい場合 (配列リファレンスから要素を取り出したい場合)、  
配列リファレンスをスカラーとしてデリファレンスして波括弧でくくり、通常の配列のようにアクセスすると内容を得られます。  
また、中括弧と$を取り除き、その代わりにアロー (->) を入れることによりアクセスする事もできます。  

## デリファレンス (ハッシュ)
    my $hash_ref = { key => 'value' };
    print %$hash_ref;        # => ハッシュの中身が展開されます (keyvalue)
    print ${$hash_ref}{key}; # => 'value'
    print $hash_ref->{key};  # => 上と同じ。こう書く方がベター

ハッシュをデリファレンスするためには、そのリファレンスの前にハッシュのシジル (%) を置きます。  
ハッシュの要素に対してデリファレンスしたい場合、ハッシュリファレンスをスカラーとして  
デリファレンスして波括弧でくくり、通常のハッシュのようにアクセスすると内容を得られます。  
また配列同様、波括弧と$を取り除きその代わりにアロー (->) を入れることによりアクセスする事もできます。

## リファレンスの中身を見る
中身を確認するために毎回デリファレンスをするのは面倒です。
このようなときに `Data::Dumper` モジュールを用いると、一度に中身を見ることができます。

    use Data::Dumper;
    my $hash_ref = {
        name        => 'Kurt',
        job         => 'Guitarist',
        affiliation => 'NIRVANA'
    };
    print $hash_ref; # => HASH(0x7f88d08060b8)
    print Dumper($hash_ref);
    # $VAR1 = {
    #           'name'        => 'Kurt',
    #           'job'         => 'Guitarist',
    #           'affiliation' => 'NIRVANA'
    #         };



## 練習問題
    my $yourname = {
        name    => 'Your Name',
        address => 'Tokyo',
        age     => 25,
    };

上記のような名前・住所・年齢といった要素を持つリファレンスを新たに作成してみましょう。  
さらに `Data::Dumper` を用いて、作ったリファレンスを出力してみましょう。
コードは, `reference_dump.pl`という名前で保存してください.

## リファレンスのはまりどころ
    my $scalar     = 'scalar';
    my $scalar_ref = \$scalar;
    print $scalar; # => 'scalar'
    $$scalar_ref = 'changed!';
    print $scalar; # => 'changed!'

リファレンスはコピーではなく参照なので、デリファレンスして更にその中身を変更すると、参照元(実体)が破壊されます。

## 練習問題
[score.pl](https://github.com/perl-entrance-org/workshop-2016/blob/master/3rd/code/score.pl) には上記のようなハッシュリファレンスがいくつか宣言してあります。

各人物の `perl`, `ruby`, `python` ... といった言語の合計値を key `sum` の value としてリファレンスに追加しましょう。  
例: `$alice` の合計値は `300` なので、以下のようになります。（ただし、key の順番がこの通りになるとは限りません）

```
my $alice = {
    name        => 'Alice',
    country     => 'England',
    perl        => 60,
    python      => 80,
    ruby        => 80,
    php         => 50,
    binary      => 30,
    sum         => 300, # ← 新しいキーに合計値を入れる
};
```

## 練習問題
[practice.md](https://github.com/perl-entrance-org/workshop-2016/blob/master/3rd/practice.md#scorepl) には練習問題の続きがあるので、チャレンジしてみてください。
