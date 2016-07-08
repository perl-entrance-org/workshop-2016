<!-- このファイルは直接編集せずに src ディレクトリ内を編集し build.pl を実行してください。 -->
#Perl入学式 第3回
___
### 配列操作/ハッシュ/リファレンス編

___
## 諸注意
- 会場について
- 写真撮影について

___
## 紹介
- 講師・サポーター紹介
- 自己紹介

___
##今日の流れ
- 前回の復習
- 配列の関数
- ハッシュ
- リファレンス

___
## 用語説明

___
### シジル
$, @, %, & といった、変数名の前に付く記号の事を指します。

___
### リスト

    ('this', 'is', 'list', 1, 2, 3);

- このように, 数値や文字列などを, コンマ(`,`)で区切って並べて, かっこ(`( ... )`)で囲ったものを, ｢リスト｣と呼びます

___
## 前回までに学んできたこと
- 変数
- 標準入力
- 演算子
- if, else 文
- for 文
- 配列

___
# 復習問題

[practice.md](https://github.com/perl-entrance-org/workshop-2016/blob/master/2nd/src/practice.md)の `sum.pl` と `even_or_odd.pl` をやってみましょう。

---
# 配列 (関数)

___
## 配列
前回、皆さんは配列の基本を勉強しました。

さて、そもそも配列ってどんな時に使う (使いたくなる) と思いますか？

___
## 配列の用途
- 要素間の順序関係を表現したい場合 (e.g. 待ち行列)
- 要素の単純な集まりとして表現したい場合 (e.g. 集合)

**そしてそれらを同じように操作したい時**に, 配列は役立ちます

___
## 配列を扱う
配列を自在に操るためには, 配列の要素を自由に

- 追加
- 取り出し

できる必要があります。

___
## 要素の追加
- push
- unshift

___
## 要素の取り出し
- pop
- shift

___
## 追加と取り出しの関係
- push / pop
- unshift / shift

___
## push / pop

    my @array = ('Alice', 'Bob');
    push @array, 'Chris';     # ('Alice', 'Bob', 'Chris')
    my $element = pop @array; # ('Alice', 'Bob')
    print $element;           # => "Chris"

配列が  
□□□  
こういう状態の場合...
<h3>push</h3>
□□□■ ←末尾に要素を追加する
<h3>pop</h3>
□□≡■ ←末尾の要素を取り出す

___
## unshift / shift

    my @array = ('Alice', 'Bob');
    unshift @array, 'Zappa';    # ('Zappa', 'Alice', 'Bob')
    my $element = shift @array; # ('Alice', 'Bob')
    print $element;             # => "Zappa"

配列が  
□□□  
こういう状態の場合...
<h3>unshift</h3>
先頭に要素を追加する→ ■□□□
<h3>shift</h3>
先頭の要素を取り出す→ ■≡□□

___
## 練習問題(1/2)

- 次のような操作をするコードが書かれた`array_func1.pl`を作成しましょう.
    1. ('Alice', 'Bob', 'Chris') という配列を作って出力してみましょう。
    2. 関数を使って 'Alice' を取り出して出力してみましょう。
    3. 関数を使って 'Chris' を取り出して出力してみましょう。

___
## 練習問題(2/2)
- 次のような操作をするコードが書かれた`array_func2.pl`を作成しましょう.
    1. ('Alice', 'Bob', 'Chris') という配列を作って出力してみましょう。
    2. 1.の配列を元に、関数を使って ('Zappa', 'Alice', 'Bob', 'Chris', 'Diana') という配列を作って出力してみましょう。

---
## qw ショートカット
    my @array = qw( Alice Bob Chris ); # ('Alice', 'Bob', 'Chris')

- これまでのリストの書き方, `('this', 'is', 'list', 1, 2, 3)` と違って、クォート記号が不要です。
- 空白文字 (スペース、タブ、改行など) は捨てられ、残ったものがリストの要素になります。
- なので、こういう書き方もできます。

    my @arary = qw(
        Alice
        Bob
    );

___
## qw ショートカット
    # デリミタ (区切り文字) には任意の記号文字が使えます。例えば...
    qw! Alice Bob !
    qw# Alice Bob #
    qw/ Alice Bob /

これらは前述の

    qw( Alice Bob )

と等しくなります。

___
## qw ショートカット
    qw/http://www.perl-entrance.org http://www.yahoo.com/
    # エラーになってしまう！
    # デリミタがスラッシュ (/) で、要素中にもスラッシュが含まれてしまっている

解決法は2つ

    # 1. スラッシュをバックスラッシュでエスケープしてあげる
    qw/ http:\/\/www.perl-entrance.org http:\/\/www.yahoo.com /  # => 読みにくく感じるかもしれない
    # 2. デリミタを変える
    qw! http://www.perl-entrance.org http://www.yahoo.com !      # => ちょっと読みやすいかもしれない

___
## 便利な関数
- ここから, 配列やリストを便利に扱うための, 以下の関数について説明をしていきます.
    - split
    - join
    - reverse
    - sort

___
## split
split は指定したパターンに従って文字列を分割します。

    my $poem  = 'I Love Perl.';
    my @words = split / /, $poem; # => ('I', 'Love', 'Perl.')

引数として与えた文字列を // でくくった文字 (上の例だと半角スペース) で分割して配列に格納します。

(ところで、// は正規表現リテラルと呼ばれるものです。正規表現リテラルの話は長くなるので、次回以降に紹介します。今は「そういうものなんだ…」と耐えてください)

___
## join
join は 分割された文字列をくっつけて1つの文字列にします。(split の逆の働きです)

    my @words = qw( I Love Perl. ); # => qw ショートカット
    my $poem  = join '_', @words;
    print $poem;  # => 'I_Love_Perl.'

join の受け取る第1引数は糊のようなものです。リストの要素をくっつけるときに、その間にはさみます。
(今回の場合だと、 '\_' という風に指定しているので、リストの各要素をアンダースコアでくっつけます)
第2引数はバラバラになった文字列の配列です。

___
## reverse
reverse は リストを逆順に並べ替えてリストで返します。

    my @lang = qw(perl php ruby python java go);
    my @reversed = reverse @lang;
    print "@reversed"; # => go java python ruby php perl

___
## sort
sort は リストをルール順に並べ替えてリストで返します。

    my @lang = qw(perl php ruby python java go);
    my @sorted = sort @lang;
    print "@sorted"; # => go java perl php python ruby

今回の例ではルールを指定しなかったので文字コード順に並び替えられました。
ルールを指定すればさらに複雑な並び替えも可能です。 => http://perldoc.jp/func/sort

___
## 練習問題 (1/2)
- 次のような挙動をするコードを, `join.pl`として作成しましょう.
    1. `("0120", "123", "XXX")` という内容の配列を qw ショートカットを使って作ってみましょう。
    2. 上の問題で作った配列を繋げて(連結して)みましょう。なんだか電話番号っぽいので、ハイフン ('-') を間にはさみましょう。

___
## 練習問題 (2/2)
- 次のような挙動をするコードを, `split.pl`として作成しましょう.
    1. 文字列 "/usr/bin/env perl" という文字列をスラッシュ ('/') で分割し、配列に格納してみましょう。
    2. その配列を出力した時の結果を予想してみましょう. 予想出来たら実際に出力してみましょう. 期待通りに出力されましたか? そうでない場合, なぜそのような挙動になったか考えてみましょう(わからなければ, サポーターの方に聞いてみましょう!)

---
# ハッシュ

___
## ハッシュとはなんでしょう
- Perl のデータ構造のひとつで、「連想配列」とも呼ばれます。
- 配列と同じく、任意個の値の格納・取り出しができます。
- ハッシュは配列とは異なり、「数値」ではなく「名前」を使って、格納した個々の「値」を指定します。
    - 要素を指定する為の名前を "key"、key によって指定された要素を "value" と呼びます。

___
## たとえば

- 名前: Alice
- 職業: Programmer
- 所属: PerlEntrance

...という人をデータとして表現してみましょう。

___
## 配列と比較してみましょう
配列の場合だとこんな感じになるのではないでしょうか。

    my @user = ('Alice', 'Programmer', 'PerlEntrance');
    print $user[0]; # 最初の要素が表示される => "Alice"
    print $user[1]; # 2番目の要素が表示される => "Programmer"
    print $user[2]; # 3番目の要素が表示される => "PerlEntrance"

`@user`の添字`0`が名前, `1`が職業... といった形で覚えなくてはなりません. これは非常に面倒です.

___
## これがハッシュだと...

    my %user = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    print $user{name};        # 名前 (name) が表示される => "Alice"
    print $user{job};         # 職業 (job) が表示される => "Programmer"
    print $user{affiliation}; # 所属 (affiliation) が表示される => "PerlEntrance"

なんだかわかりやすい感じがします！

___
## ハッシュの代入と出力
- ハッシュは % を使って定義します。
- ハッシュにアクセスするときは、添字として波括弧`{}`を使います。
- 1つのハッシュ内に、文字列や数値が混在していても構いません。

以下の例を見てみましょう。

    my %hash;              # ハッシュを定義
    $hash{name} = 'Alice'; # "name" という key に "Alice" という value を代入
    $hash{age}  = 16;      # "age" という key に "16" という value を代入
    print "$hash{name}\n"; # => "Alice"
    print "$hash{age}\n";  # => 16

___
## ハッシュの代入と出力
ハッシュは配列の一種なので、こういう書き方もできます。

    my %hash = ('name', 'Alice', 'age', 16);
    print "$hash{name}\n"; # => "Alice"
    print "$hash{age}\n";  # => "16"

___
## ハッシュの代入と出力
実際には、こういう風に書くのが便利で良いです。

    my %hash = (
        name => 'Alice',   # ファットコンマ演算子 (=>) で key と value の関係を書ける
        age  => 16       # 左側の値は文字列として解釈されるのでクォートの必要がない
    );
    print "$hash{name}\n"; # => "Alice"
    print "$hash{age}\n";  # => "16"

- ファットコンマ演算子は基本的にコンマのようなものです。
- ハッシュではファットコンマ演算子を使うと、 key と value の関係性(`=>`の左がkey, 右がvalue)が見やすくなるので便利です。

___
## 結局ハッシュの何が便利なのか？
    my @user = ('Name', 'Job', 'Affiliation');

これがある日突然

    my @user = ('Affiliation', 'Job', 'Name');

という風に順序が入れ替わったらどうしましょう？ 今まで動いていたコードを書き換えなくてはならなくなります。  
ハッシュだと、順序ではなく key で対応付けられているので、そういった問題が起こりません。

___
## 練習問題
- 次のような挙動をするプログラムを`hash_profile.pl`という名前で作成しましょう.
1. 自分の名前 (name)、年齢 (age)、好きな食べ物 (food) を key にしたハッシュを作ってみましょう。
2. key である `name`, `age`, `food` を用いて、それぞれの value をprintしてみましょう。

---
## ハッシュの便利関数たち

- ここでは, ハッシュを便利に扱うための関数の説明を行います.
    - keys
    - values
    - delete
    - exists

___
## keys
    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    my @keys = keys %hash;
    print "@keys\n";    # => "name job affiliation"

keys 関数はそのハッシュの key を配列にして返してくれます。

この時、key は順不同になります。

___
## values
    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    my @values = values %hash;
    print "@values\n"; # => "Alice Programmer PerlEntrance"

values 関数はそのハッシュの value を配列にして返してくれます。
この時、value は順不同になります(常に同じ順番で帰ってくるとは限りません)。
もし, 常に同じ順番にしたいのであれば, `sort`を使って並び替えましょう

___
## delete
    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    delete $hash{affiliation};
    # この時、%hash は以下のようになっています
    # %hash = ( name => 'Alice', job => 'Programmer' );

delete 関数は指定したハッシュの key と、それに対応する value を削除します。

___
## exsits
    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );

    if (exists $hash{job})  { print "exists" } # => exists
    if (exists $hash{team}) { print "exists" } # => 

exists 関数は指定したハッシュの key が存在するかを確認します。

___
## 練習問題

- 次のような処理を実行する`hash_func.pl`を作成しましょう。
    1. `hash_profile.pl`で作ったハッシュを用意し、そのハッシュの key の一覧を出力してみましょう。
    2. `exists`で年齢の要素が存在するかどうかを確認してみましょう。
    3. ハッシュから、年齢(age)の要素を取り除いてみましょう。
    4. 年齢(age)の要素を削除した後、きちんと削除したか確認します。key の一覧を表示した後、`exists`で年齢の要素が存在しないことを調べ、きちんと削除されている場合は"Age is not exist."と表示するようにしてみましょう。

---
# リファレンス

___
## リファレンスとは
リファレンスとは参照(実体を指し示すもの)です。  
リファレンスを使うと複雑なデータ構造を表現できます。

___
## どういうこと？
例えば、リファレンスを使うとハッシュの中にハッシュを格納し、更にそのハッシュにハッシュを格納する……といった複雑なデータ構造を表現できます。

___
## 具体例 (1/3)
         |     0     |     1     |
    -----+-----------+-----------+
      0  |  maguro   |   katsuo  |
    -----+-----------+-----------+
      1  |    tai    |   hirame  |
    -----+-----------+-----------+

テーブルのようなデータ構造を表現したいとき

___
## 具体例 (2/3)
    my @akami = ('maguro', 'katsuo');
    my @shiromi = ('tai', 'hirame');
    my @sushi = (@akami, @shiromi);
    print $sushi[1][1]; # => これはエラーになる

今までの知識であれば、配列を用いて<b>行</b>単位の表現はできますが、`n 行 m 列目は maguro` という様に表現したいですね。

___
## 具体例 (3/3)
    my $akami = ['maguro', 'katsuo'];
    my $shiromi = ['tai', 'hirame'];
    my @sushi = ($akami, $shiromi);
    print $sushi[1][1]; # => hirame

<b>リファレンス</b> を用いることで、このように複雑なデータ構造を表現することが容易になります。

___
## その他の使いどころ
関数の引数に複数の配列を渡す必要がある場合などに使います。  
また、関数に引数として配列やハッシュを渡すとそれらをコピー (クローン) してしまうので、非効率になる場合があります。  
リファレンスはコピーするのではなく参照を渡すだけなので、その問題を回避することができます。  
(これらはまた後で出てきます)

___
## リファレンスの例
    my $scalar     = 'scalar';
    my $scalar_ref = \$scalar   # スカラーのリファレンス;
    my @array      = ( 'this', 'is', 'array' );
    my $array_ref  = \@array;   # 配列のリファレンス
    my %hash       = ( this_is => 'hash' );
    my $hash_ref   = \%hash;    # ハッシュのリファレンス

それぞれのシジルの前にバックスラッシュ (\\) を置くことによってそれぞれリファレンスになります。

___
## 簡単な書き方 (配列)
    my $array_ref = ['This', 'is', 'array-ref'];

普通のかっこ () ではなく角かっこ [] によって要素をくくることで、配列のリファレンスになります。

___
## 簡単な書き方 (ハッシュ)
    my $hash_ref = {
        this_is => 'hash_ref'
    };

普通のかっこ () ではなく波括弧 {} によってくくってやることで、ハッシュのリファレンスになります。

___
## さて、ここで print してみましょう
    my $array_ref = ['This', 'is', 'array-ref'];
    print $array_ref;

`ARRAY(0x7fd8938060b8)` みたいな出力が得られると思います (括弧の中身は実行環境によって異なります)  
スカラーリファレンスの場合はSCALAR()、ハッシュリファレンスの場合はHASH() とそれぞれ表示されます。

___
## これはなに？
最初に言ったように、リファレンスは参照です。  
SCALAR() や ARRAY()、HASH() の括弧の中身に書いてあるのはその実体が格納されているアドレス（場所の情報）です。

___
## アドレスではなく実体が欲しい時にはどうすれば？
そこで出てくるのが“デリファレンス”です。

___
## デリファレンスとは
リファレンス(参照)から、元のスカラーや配列やハッシュ(実体)を得るための操作です。

___
## デリファレンスの例
    my $scalar     = 'scalar';
    my $scalar_ref = \$scalar;
    print $$scalar_ref; # アドレスではなくスカラーが表示される => "scalar"
    my $array_ref  = ["I'm", "scalar-ref"];
    print @$array_ref;  # アドレスではなく配列の中身が展開される => "I'mscalar-ref"
    my $hash_ref   = { this_is => 'hash-ref' };
    print %$hash_ref;   # アドレスではなくハッシュの中身が展開される => "this_ishash-ref"

___
## デリファレンス (スカラー)
    my $scalar     = 'scalar';
    my $scalar_ref = \$scalar;
    print $$scalar_ref;

スカラーをデリファレンスするためには、そのリファレンスの前にスカラーのシジル ($) を置きます。

___
## デリファレンス (配列)
    my $array_ref = ['zero', 'one', 'two'];
    print @$array_ref;      # => 配列の中身が展開されます (zeroonetwo)
    print ${$array_ref}[1]; # => 'one'
    print $array_ref->[1];  # => 上と同じ。こう書く方がベター

配列をデリファレンスするためには、そのリファレンスの前に配列のシジル (@) を置きます。  
配列の要素に対してデリファレンスしたい場合 (配列リファレンスから要素を取り出したい場合)、  
配列リファレンスをスカラーとしてデリファレンスして波括弧でくくり、通常の配列のようにアクセスすると内容を得られます。  
また、中括弧と$を取り除き、その代わりにアロー (->) を入れることによりアクセスする事もできます。  

___
## デリファレンス (ハッシュ)
    my $hash_ref = { key => 'value' };
    print %$hash_ref;        # => ハッシュの中身が展開されます (keyvalue)
    print ${$hash_ref}{key}; # => 'value'
    print $hash_ref->{key};  # => 上と同じ。こう書く方がベター

ハッシュをデリファレンスするためには、そのリファレンスの前にハッシュのシジル (%) を置きます。  
ハッシュの要素に対してデリファレンスしたい場合、ハッシュリファレンスをスカラーとして  
デリファレンスして波括弧でくくり、通常のハッシュのようにアクセスすると内容を得られます。  
また配列同様、波括弧と$を取り除きその代わりにアロー (->) を入れることによりアクセスする事もできます。

___
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



___
## 練習問題
    my $yourname = {
        name    => 'Your Name',
        address => 'Tokyo',
        age     => 25,
    };

上記のような名前・住所・年齢といった要素を持つリファレンスを新たに作成してみましょう。  
さらに `Data::Dumper` を用いて、作ったリファレンスを出力してみましょう。
コードは, `reference_dump.pl`という名前で保存してください.

___
## リファレンスのはまりどころ
    my $scalar     = 'scalar';
    my $scalar_ref = \$scalar;
    print $scalar; # => 'scalar'
    $$scalar_ref = 'changed!';
    print $scalar; # => 'changed!'

リファレンスはコピーではなく参照なので、デリファレンスして更にその中身を変更すると、参照元(実体)が破壊されます。

___
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

___
## 練習問題
[practice.md](https://github.com/perl-entrance-org/workshop-2016/blob/master/3rd/practice.md#scorepl) には練習問題の続きがあるので、チャレンジしてみてください。

---
## 復習問題

- <https://github.com/perl-entrance-org/workshop-2016/blob/master/3rd/src/practice.md>

  - 今回の内容を復習することができる問題集です。
  - 不明点があれば、気軽にサポーターに質問してください。

