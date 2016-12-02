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
$, @, %, & といった、変数名の前に付く記号を指します。

___
### リスト

    ('this', 'is', 'list', 1, 2, 3);

- このように、数値や文字列などをコンマ(`,`)で区切って並べて、括弧で囲ったものを｢リスト｣と呼びます

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

[practice.md](https://github.com/perl-entrance-org/workshop-2016/blob/master/2nd/practice.md) の `sum.pl` と `even_or_odd.pl` をやってみましょう。

---
# 配列 (関数)

___
## 配列
前回、皆さんは配列の基本を勉強しました。

でも、そもそも配列ってどんな時に使うものだと思いますか？

___
## 配列の用途
- 要素間の順序関係を表現したい場合 (例: 待ち行列)
- 要素の単純な集まりとして表現したい場合 (例: 集合)

**これらを同じように操作したい時**、配列は役立ちます

___
## 配列を扱う
配列を自在に操るためには、配列の要素を自由に

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
    push @array, 'Chris';     #=> ('Alice', 'Bob', 'Chris')
    my $element = pop @array; #=> ('Alice', 'Bob')
    print $element;           #=> "Chris"

<h3>push</h3>
`[a][b][c] <=[d]` 末尾に要素を追加する
<h3>pop</h3>
`[a][b] =>[c]` 末尾の要素を取り出す

___
## unshift / shift

    my @array = ('Alice', 'Bob');
    unshift @array, 'Chris';    #=> ('Chris', 'Alice', 'Bob')
    my $element = shift @array; #=> ('Alice', 'Bob')
    print $element;             #=> "Chris"

<h3>unshift</h3>
`[d]=> [a][b][c]` 先頭に要素を追加する
<h3>shift</h3>
`[a]<= [b][c]` 先頭の要素を取り出す

___
## 練習問題 (1/2)

- 次のような操作をする `array_func1.pl` を作成しましょう。
    1. ('Alice', 'Bob', 'Chris') という配列を作って出力しましょう。
    2. 1の配列から 'Alice' を取り出してみましょう。
    3. 1の配列から 'Chris' を取り出してみましょう。

___
## 練習問題 (2/2)
- 次のような操作をする `array_func2.pl` を作成しましょう。
    1. ('Alice', 'Bob', 'Chris') という配列を作って出力しましょう。
    2. 1の配列に `Diana` と `Eve` を追加して、 ('Eve', 'Alice', 'Bob', 'Chris', 'Diana') という配列を作って出力しましょう。

___
## 便利な関数
ここからは、配列やリストを便利に扱うための関数について説明していきます。

    - split
    - join
    - reverse
    - sort

___
## split
split は指定したパターンに従って文字列を分割します。

    my $poem  = 'I Love Perl.';
    my @words = split / /, $poem; #=> ('I', 'Love', 'Perl.')

引数として与えた文字列を、 // でくくった文字 (上の例だと半角スペース) で分割して配列に格納します。

※ところで、// は正規表現リテラルと呼ばれるものです。正規表現リテラルの話は長くなるので、次回以降に紹介します。今は「そういうものなんだ…」と耐えてください。

___
## join
join は 分割された文字列をくっつけて1つの文字列にします。  
※split の逆の働きです。

    my @words = qw( I Love Perl. ); # => qw ショートカット
    my $poem  = join '_', @words;
    print $poem;  # => 'I_Love_Perl.'

join が受け取る第1引数 (上の例だとアンダースコア) は、リストの要素をくっつける糊のような役割を果たします。

第2引数は、バラバラになった文字列の配列です。

___
## reverse
reverse はリストを逆順に並べ替えて、そのリストを返します。

    my @lang = qw(perl php ruby python java go);
    my @reversed = reverse @lang;
    print "@reversed"; #=> go java python ruby php perl

___
## sort
sort はリストをルール順に並べ替えて、そのリストを返します。

    my @lang = qw(perl php ruby python java go);
    my @sorted = sort @lang;
    print "@sorted"; # => go java perl php python ruby

- 今回の例ではルールを指定しなかったので、文字コード順に並び替えられました。
- ルールを指定すればさらに複雑な並び替えも可能です。
- 参考: http://perldoc.jp/func/sort

___
## 練習問題 (1/2)
- 次のような挙動をする `join.pl` を作成しましょう。
    1. `("0120", "123", "XXX")` という内容の配列を qw ショートカットを使って作ってみましょう。
    2. 1の配列を連結してみましょう。  
       なんだか電話番号っぽいので、ハイフン ('-') を間にはさむことにしましょう。

___
## 練習問題 (2/2)
- 次のような挙動をする `split.pl` を作成しましょう。
    1. "/usr/bin/env perl" という文字列をスラッシュ ('/') で分割し、配列に格納してみましょう。
    2. その配列を出力した時の結果を予想してみましょう。  
       予想出来たら実際に出力してみましょう。  
       期待通りに出力されましたか？ もし予想と違ったら、なぜそのような挙動になったか考えてみましょう。  
       ※わからなければ、サポーターに聞いてみましょう！

---
# ハッシュ

___
## ハッシュとは

- ハッシュはPerlのデータ構造の1つで、「連想配列」とも呼ばれます。
- 配列と同じく、値の格納・取り出しができます。
- しかし配列とは異なり、「数値」ではなく「名前」を使って、格納する「値」を指定します。
    - 要素を指定するための「名前」を "key"、key によって指定された「値」を "value" と呼びます。

___
## ハッシュの基本

以下の要素を持つ人物をハッシュで表現してみましょう。

- 名前: Alice
- 職業: Programmer
- 所属: PerlEntrance

___
## ハッシュの基本
もしこれを配列で表現するなら、以下のようになるでしょう。

    my @user = ('Alice', 'Programmer', 'PerlEntrance');
    print $user[0]; # 最初の要素が表示される  => "Alice"
    print $user[1]; # 2番目の要素が表示される => "Programmer"
    print $user[2]; # 3番目の要素が表示される => "PerlEntrance"

- しかしこの場合は、添字 `0` が名前、`1` が職業、といった条件を覚えておく必要があります。
- これは非常に面倒ですね。

___
## ハッシュの基本
同じ内容をハッシュで表現すると、このようになります。

    my %user = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    print $user{name}; # nameが表示される => "Alice"
    print $user{job};  # jobが表示される => "Programmer"
    print $user{affiliation}; # affiliationが表示される => "PerlEntrance"

- 添字（key）から値（value）を連想できるため、配列を使うよりわかりやすいですね。

___
## ハッシュの基本
ハッシュには他にも利点があります。

以下のような配列があったとき、

    my @user = ('Name', 'Job', 'Affiliation');

もし突然、要素の順番が入れ替わってしまったらどうなるでしょう？  

    my @user = ('Affiliation', 'Job', 'Name');

添字と値の関係が変わってしまうため、影響するコードを書き換えなくてはいけません。  
しかしハッシュを使えば、値は添字の数値（順番）ではなく、名前（key）で対応づけられているので、そういった問題が起こりません。

___
## ハッシュを使ってみよう
では、ハッシュを作ってみましょう。

    my %hash = (
        name => 'Alice',
        age  => 16
    );

- ハッシュは % を使って定義します。
- `=>` はファットコンマ演算子と呼ばれ、コンマと同等の役割を果たします。
- `=>` の左にkey（名前）、右にvalue（値）を書くことで、関係性が明らかになります。
- keyは文字列として解釈されるので、クォートの必要はありません。
- 1つのハッシュ内に文字列や数値が混在しても構いません。

___
## ハッシュを使ってみよう
ハッシュの要素にアクセスし、取り出してみましょう。  
ハッシュにアクセスするときは、添字として波括弧 `{}` を使います。  
`{}`にkeyを入れることで、対応するvalue（値）を取り出せます。

    my %hash = (
        name => 'Alice',
        age  => 16,
    );
    print $hash{name}; #=> 'Alice'
    print $hash{age}; #=> 16

___
## ハッシュを使ってみよう
ハッシュに新たな要素を代入してみましょう。  
取り出すときと同様に、`{key}` を使います。

    $hash{job} = 'Programmer'; # 新たな値'Programmer'をkey'job'で代入

これで、ハッシュの中身は以下のようになりました。

    my %hash = (
        name => 'Alice',
        age  => 16,
        job  => 'Programmer',
    );

取り出してみましょう。

    print $hash{job}; #=> 'Programmer'

※ハッシュの中身を一度に全部見たい場合は、`Data::Dumper`モジュールを使います。これについては後で解説します。

___
## ハッシュを使ってみよう
じつはハッシュは配列の一種なので、このように書くこともできます。

    my %hash = ('name', 'Alice', 'age', 16);
    print $hash{name}; #=> "Alice"
    print $hash{age};  #=> "16"

実際にこのように書くことは少ないですが、配列の一種であることは覚えておくとよいでしょう。

___
## 練習問題
- 次の処理をする `hash_profile.pl` を作りましょう。
    1. 自分の名前 (name)、年齢 (age)、好きな食べ物 (food) を key にしたハッシュ %my_profile を作ってください。
    2. key である `name`, `age`, `food` を使って、それぞれの value を出力してください。

---
## ハッシュの便利な関数たち
ハッシュを便利に扱うための関数について説明します。

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
    print "@keys\n";    #=> "name job affiliation"

keys関数は、ハッシュの key を配列にして返します。

- ただし、この時 key は順不同です。（※とても重要）
- つまり、ハッシュに書かれた順番で返ってくるとは限りません。
- よって、同じ順番で受け取りたい場合は、`sort`関数を使って並び替えましょう。

___
## values

    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    my @values = values %hash;
    print "@values\n"; #=> "Alice Programmer PerlEntrance"

values関数は、ハッシュの value を配列にして返します。

- value も順不同で返ります。

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

delete関数は、指定したハッシュの key と、それに対応する value を削除します。

___
## exists

    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    if (exists $hash{job})  { print "exists" } #=> 'exists'
    if (exists $hash{team}) { print "exists" } # 何も出てこない

exists関数は、指定したハッシュの key が存在するか確認します。

___
## 練習問題

- 次の処理をする `hash_func.pl` を作りましょう。
    1. keys関数を使って、`hash_profile.pl` で作ったハッシュのkeyをすべて出力してください。
    2. delete関数を使って、1で使ったハッシュから年齢(age)の要素を削除してください。
    3. exists関数を使って、年齢の要素が存在するか確認してください。削除されている場合は "Age is not exist." と表示するようにしてみましょう。


---
# リファレンス

___
## リファレンスとは
リファレンスとは、実体を指し示すもの(参照)です。  
リファレンスを使うと、複雑なデータ構造を表現できます。

___
## どういうこと？
たとえば、ハッシュの中にハッシュを格納し、さらにそのハッシュの中にハッシュを格納し……といった複雑なデータ構造を表現できるようになります。

___
## 具体例 (1/3)
このようなデータ構造を表現したいとき、

                     |     0     |     1     |
                -----+-----------+-----------+
                  0  |  maguro   |   katsuo  |
                -----+-----------+-----------+
                  1  |    tai    |   hirame  |
                -----+-----------+-----------+

___
## 具体例 (2/3)
配列を用いれば <b>行</b> 単位の表現はできますが、それでは「n行目のm列目は `maguro`」 といった複数の行をまたぐ表現ができません。

    my @akami = ('maguro', 'katsuo');
    my @shiromi = ('tai', 'hirame');
    my @sushi = (@akami, @shiromi);
    print $sushi[1][1]; #=> これはエラーになる

___
## 具体例 (3/3)
<b>リファレンス</b> を用いることで、以下のように複雑なデータ構造を表現することが容易になります。

    my $akami = ['maguro', 'katsuo'];
    my $shiromi = ['tai', 'hirame'];
    my @sushi = ($akami, $shiromi);
    print $sushi[1][1]; #=> hirame

___
## その他の使いどころ
- その他、リファレンスは関数の引数に複数の配列を渡す必要がある場合に使います。  
- また、関数の引数として通常の配列やハッシュを渡すと、それらをコピーしてしまうので、非効率になる場合があります。  
    - リファレンスはコピーではなく参照(実体を指し示すもの)を渡すので、その問題を回避することができます。  
- (これらはまた後で出てきます)

___
## リファレンスの作り方
    my $scalar     = 'scalar';
    my $scalar_ref = \$scalar;   # スカラーのリファレンス
    my @array      = ( 'this', 'is', 'array' );
    my $array_ref  = \@array;   # 配列のリファレンス
    my %hash       = ( this_is => 'hash' );
    my $hash_ref   = \%hash;    # ハッシュのリファレンス

それぞれのシジルの前にバックスラッシュ (\\) を置くことによって  
リファレンスになります。

___
## 簡単な書き方 (配列)
    my $array_ref = ['This', 'is', 'array-ref'];

普通の括弧 () ではなく角括弧 [] で要素をくくると  
配列のリファレンスになります。

___
## 簡単な書き方 (ハッシュ)
    my $hash_ref = {
        this_is => 'hash_ref'
    };

普通の括弧 () ではなく波括弧 {} でくくると  
ハッシュのリファレンスになります。

___
## ここで print してみましょう
    my $array_ref = ['This', 'is', 'array-ref'];
    print $array_ref;

- `ARRAY(0x7fd8938060b8)` みたいな出力が得られると思います (括弧内の英数字は実行環境によって異なります)  
- スカラーリファレンスの場合はSCALAR()、ハッシュリファレンスの場合はHASH() とそれぞれ表示されます。

___
## これはなに？
最初に言ったように、リファレンスは参照です。  
SCALAR() や ARRAY()、HASH() の括弧内の英数字は、その実体が格納されているアドレス (場所の情報) です。

___
## 普通の中身を見たいのですが...
そこで出てくるのが <b>デリファレンス</b> です。

___
## デリファレンスとは
リファレンス(参照)から、元のスカラーや配列やハッシュの中身を得るための操作です。

___
## デリファレンスの例

    my $scalar     = 'scalar';
    my $scalar_ref = \$scalar;
    print $$scalar_ref;
    # アドレスではなくスカラーが表示される => "scalar"

    my $array_ref  = ["I'm", "scalar-ref"];
    print @$array_ref;
    # アドレスではなく配列の中身が展開される => "I'mscalar-ref"

    my $hash_ref   = { this_is => 'hash-ref' };
    print %$hash_ref;
    # ハッシュの中身が展開される # => "this_ishash-ref"

___
## デリファレンス (スカラー)
    my $scalar     = 'scalar';
    my $scalar_ref = \$scalar;
    print $$scalar_ref;

スカラーをデリファレンスするためには、そのリファレンスの前にスカラーのシジル ($) を置きます。

___
## デリファレンス (配列)
    my $array_ref = ['zero', 'one', 'two'];
    print @$array_ref;      #=> 配列の中身を展開 (zeroonetwo)
    print ${$array_ref}[1]; #=> 'one'
    print $array_ref->[1];  #=> 上と同じ。こう書く方がベター
    $array_ref->[3] = 'three'; # => 値の代入

- 配列をデリファレンスするためには、リファレンスの前に配列のシジル (@) を置きます。  
- 配列の要素に対してデリファレンスしたい場合 (配列リファレンスから要素を取り出したい場合)は、配列リファレンスをスカラーとしてデリファレンスして波括弧でくくり、通常の配列のようにアクセスすると内容を得られます。  
- また、中括弧と$を取り除き、代わりにアロー (->) を入れてアクセスすることもできます。  

___
## デリファレンス (ハッシュ)
    my $hash_ref = { key => 'value' };
    print %$hash_ref;        # => ハッシュの中身を展開 (keyvalue)
    print ${$hash_ref}{key}; # => 'value'
    print $hash_ref->{key};  # => 上と同じ。こう書く方がベター
    $hash_ref->{key} = 'value'; # => 値の代入

- ハッシュをデリファレンスするためには、リファレンスの前にハッシュのシジル (%) を置きます。  
- ハッシュの要素に対してデリファレンスしたい場合は、ハッシュリファレンスをスカラーとしてデリファレンスして波括弧でくくり、通常のハッシュのようにアクセスすると内容を得られます。  
- 配列と同様に、波括弧と$を取り除き、代わりにアロー (->) を入れてアクセスすることもできます。

___
## リファレンスの中身を一気に見る
中身を確認するために一つ一つデリファレンスをするのは面倒です。  
`Data::Dumper` モジュールを使うと、一度に中身を確認できます。

    use Data::Dumper;
    my $hash_ref = {
        name        => 'Kurt',
        job         => 'Guitarist',
        affiliation => 'NIRVANA'
    };
    print $hash_ref; #=> HASH(0x7f88d08060b8)
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

- 上記のような名前・住所・年齢といった要素を持つリファレンスを作成してみましょう。  
- さらに `Data::Dumper` を用いて、作ったリファレンスを出力してみましょう。
- コードは `reference_dump.pl`という名前で保存してください。

___
## リファレンスのはまりどころ
    my $scalar     = 'scalar';
    my $scalar_ref = \$scalar;
    print $scalar; #=> 'scalar'
    $$scalar_ref = 'changed!';
    print $scalar; #=> 'changed!'

リファレンスはコピーではなく参照なので、デリファレンスして中身を変更すると、参照元(実体)が破壊されます。

___
## 練習問題
[score.pl](https://github.com/perl-entrance-org/workshop-2016/blob/master/3rd/code/score.pl) には以下のようなリファレンスが複数宣言されています。

```
my $alice = {
    name        => 'Alice',
    country     => 'England',
    perl        => 60,
    python      => 80,
    ruby        => 80,
    php         => 50,
    binary      => 30,
};
```

- `perl`, `ruby` などの言語の合計値を、key `sum` の value として、各リファレンスに追加するコードを score.pl の下方に追記してください。
    - コードを書けたら、`Data::Dumper` で出力しましょう。
- ヒントや解答例は以下を参照してください。  
[https://github.com/perl-entrance-org/workshop-2016/blob/master/3rd/practice.md#2-scorepl](https://github.com/perl-entrance-org/workshop-2016/blob/master/3rd/src/practice.md#2-scorepl)

___
## 練習問題
[practice.md](https://github.com/perl-entrance-org/workshop-2016/blob/master/3rd/practice.md#2-2-言語ごとの平均) には練習問題の続きがあるので、チャレンジしてみてください。

---
## 復習問題

- <https://github.com/perl-entrance-org/workshop-2016/blob/master/3rd/practice.md>
  - 今回の内容を復習することができる問題集です。
  - 不明点があれば、気軽にサポーターに質問してください。
