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
## ハッシュとはなんでしょう？

- Perl のデータ構造のひとつで、「連想配列」とも呼ばれます。
- 配列と同じく、任意個の値の格納・取り出しができます。
- しかし配列とは異なり、「数値」ではなく「名前」を使って、格納した個々の「値」を指定します。
    - 要素を指定するための名前を "key"、そして key によって指定された要素を "value" と呼びます。

___
## たとえば

- 名前: Alice
- 職業: Programmer
- 所属: PerlEntrance

という要素を持つ人を表現してみましょう。

___
## 配列と比較してみましょう
配列を使って表現すると、こんな感じになるのではないでしょうか。

    my @user = ('Alice', 'Programmer', 'PerlEntrance');
    print $user[0]; # 最初の要素が表示される  => "Alice"
    print $user[1]; # 2番目の要素が表示される => "Programmer"
    print $user[2]; # 3番目の要素が表示される => "PerlEntrance"

- しかしこの方法を使う場合は、`@user` の添字 `0` が名前、`1` が職業……といった条件を覚えておく必要があります。
- これは非常に面倒ですね。

___
## これがハッシュだと...

    my %user = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    print $user{name}; # name が表示される => "Alice"
    print $user{job};  # job が表示される => "Programmer"
    print $user{affiliation};
        # affiliation が表示される => "PerlEntrance"

なんだかわかりやすい感じがします！

___
## ハッシュの代入と出力
- ハッシュは % を使って定義します。
- ハッシュにアクセスするときは、添字として波括弧 `{}` を使います。
- 1つのハッシュ内に、文字列や数値が混在しても構いません。

以下の例を見てみましょう。

    my %hash;              # ハッシュを定義
    $hash{name} = 'Alice';
    # "name" という key に "Alice" という value を代入
    $hash{age}  = 16;
    # "age" という key に "16" という value を代入
    print "$hash{name}\n"; #=> "Alice"
    print "$hash{age}\n";  #=> 16

___
## ハッシュの代入と出力
ハッシュは配列の一種なので、こういう書き方もできます。

    my %hash = ('name', 'Alice', 'age', 16);
    print "$hash{name}\n"; #=> "Alice"
    print "$hash{age}\n";  #=> "16"

___
## ハッシュの代入と出力
しかし実際には、こういう風に書くのが便利です。

    my %hash = (
        name => 'Alice',
        age  => 16
    );
    # `=>` で key と value の関係を書ける
    # 左側の値は文字列として解釈されるのでクォートの必要がない

    print "$hash{name}\n"; #=> "Alice"
    print "$hash{age}\n";  #=> "16"

- `=>` はファットコンマ演算子と呼ばれ、コンマのような役割を果たします。
- ファットコンマ演算子を使うと、key と value の関係 (`=>`の左がkey, 右がvalue) が見やすくなります。

___
## 結局ハッシュの何が便利なのか？
    my @user = ('Name', 'Job', 'Affiliation');

これがある日突然、

    my @user = ('Affiliation', 'Job', 'Name');

こんな風に順序が入れ替わったらどうしましょう？  
今まで動いていたコードを書き換えなくてはなりません。  
しかしハッシュだと、順序ではなく key で対応づけられているので、そういった問題が起こりません。

___
## 練習問題
- 次のような挙動をする `hash_profile.pl` を作成しましょう。
1. 自分の名前 (name)、年齢 (age)、好きな食べ物 (food) を key にしたハッシュを作ってみましょう。
2. key である `name`, `age`, `food` を使って、それぞれの value を出力してみましょう。

---
## ハッシュの便利関数たち
ここでは、ハッシュを便利に扱うための関数について説明します。

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

keys 関数は、ハッシュの key を配列にして返します。

- ただし、この時 key は順不同で返ります。
- つまり、ハッシュに書かれた順番で返ってくるとは限りません。
- よって、同じ順番で受け取りたい場合は、`sort` を使って並び替えましょう。

___
## values
    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    my @values = values %hash;
    print "@values\n"; #=> "Alice Programmer PerlEntrance"

values 関数は、ハッシュの value を配列にして返します。

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

delete 関数は指定したハッシュの key と、それに対応する value を削除します。

___
## exists
    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );

    if (exists $hash{job})  { print "exists" } #=> exists
    if (exists $hash{team}) { print "exists" } #=>

exists 関数は指定したハッシュの key が存在するか確認します。

___
## 練習問題

- 次の処理を実行する `hash_func.pl` を作成しましょう。
    1. `hash_profile.pl` で作ったハッシュを用意し、そのハッシュの key の一覧を出力してみましょう。
    2. `exists` で年齢の要素が存在するか確認してみましょう。
    3. ハッシュから年齢(age)の要素を取り除いてみましょう。
    4. 年齢(age)の要素を削除した後、きちんと削除できたか確認しましょう。  
       key の一覧を表示した後、`exists` で年齢の要素が存在しているか確認し、削除されている場合は "Age is not exist." と表示するようにしてみましょう。

---
# リファレンス

___
## リファレンスとは
リファレンスとは、配列やハッシュで扱うようなデータそのもの（実体）ではなく、それを指し示すもの（参照）を扱う方法です。  
リファレンスを使うと、複雑なデータ構造を表現できます。

___
## 「複雑なデータ構造」とは？
ここでは、配列の中に配列が入っていたり、その中にさらにハッシュが入っているような「複数の階層を持つデータ」を指します。

___
## リファレンスの利点
たとえば、このような構造のデータを扱いたいときに、

    animal
     ├─ dog
     │    ├─ shiba
     │    └─ bulldog
     └─ cat

配列を使えば1階層分の処理は可能ですが、

    my @animal = ('dog', 'cat');
    print $animal[1]; #=> cat

複数の階層をまたぐ処理はできません。

    my @animal = (('shiba', 'bulldog'), 'cat');
    print $animal[0][1]; #=> `bulldog` を表示したいがエラー

しかし、リファレンスを使えばこれが可能になります。

___
## リファレンスの作り方
変数のシジル（$, @, %）の前にバックスラッシュ (\\) を置くことで  
各種のリファレンスを作れます。

    my $scalar     = 'scalar'; # スカラーを定義
    my $scalar_ref = \$scalar; # スカラーのリファレンスを作成

    my @array      = ( 'foo', 'bar', 'baz' ); # 配列を定義
    my $array_ref  = \@array;   # 配列のリファレンスを作成

    my %hash       = ( foo => 'bar' ); # ハッシュを定義
    my $hash_ref   = \%hash;    # ハッシュのリファレンスを作成

___
## リファレンスの簡単な作り方（1）
先ほどは、配列のリファレンスを作るために元の配列を作りました。

    my @array      = ( 'foo', 'bar', 'baz' ); # リファレンスの元になる配列
    my $array_ref  = \@array;

しかし、配列の要素を [] でくくると、直接配列のリファレンスを作れます。

    my $array_ref = [ 'foo', 'bar', 'baz' ]; # 直接リファレンスを作成

スカラー変数に代入している点に注意してください。  
このように、元の配列を持たない配列リファレンスを無名配列と呼びます。  
初めからリファレンスを作ることが目的の場合はこの方法が便利です。

___
## リファレンスの簡単な作り方（2）
配列と同様、ハッシュの要素を {} でくくると、直接ハッシュリファレンスを作れます。

    my $hash_ref = {
        foo => 'bar'
    };

このように、元のハッシュを持たないハッシュリファレンスを無名ハッシュと呼びます。  
初めからリファレンスを作ることが目的の場合はこの方法が便利です。

___
## 配列リファレンスを使う
では、以下のデータを配列リファレンスで処理してみましょう。

    animal
     ├─ dog
     │    ├─ shiba
     │    └─ bulldog
     └─ cat

先ほどはこのように書いて失敗しましたが、

    my @animal = (('shiba', 'bulldog'), 'cat');

配列のリファレンスを使えば、意図した構造でデータを格納できます。

    my @dog = ('shiba', 'bulldog'); # 配列@dogを作る
    my $dog_ref = \@dog;            # @dogをもとに配列リファレンス$dog_refを作る
    my @animal = ($dog_ref, 'cat'); # $dog_refを含む配列@animalを作る

無名配列を使って、一度にまとめて書くこともできます。

    my @animal = (['shiba', 'bulldog'], 'cat');

___
## 配列リファレンスを使う
では、@animalから`bulldog`を取り出すにはどうすればよいでしょう？

まずは配列の復習をかねて@dogから要素を取り出してみましょう。

    print $dog[1]; #=> bulldog

同様に、配列リファレンス$dog_refから要素を取り出すにはこのようにします。

    print ${$dog_ref}[1]; #=> bulldog

なぜこのような書き方になるのでしょうか？

- じつは、配列のリファレンスを{}で囲んで先頭に@を付けると、元の配列として扱うことができます。
- つまり、`@{$dog_ref}`と`@dog`は等価です。  
- よって、配列から要素を取り出すときと同様に、シジル@を$に変えて、添字[1]を付けることで、要素を取り出すことができるのです。

___
## 配列リファレンスを使う

    1. 配列@dogを作る。
    @dog = ('shiba', 'bulldog');

    2. 複雑なデータ構造を扱えるようにするため、
    配列@dogから配列リファレンス$dog_refを作る。
    my $dog_ref = \@dog;

    3. 配列リファレンス$dog_refを@{$dog_ref}とすることで、
    @dogと同等に扱えるようにする。

    4. @{$dog_ref}から要素`bulldog`を取り出す。
    print ${$dog_ref}[1]; #=> bulldog

4のように、リファレンスから元のデータにアクセスすることを「デリファレンス」と言います。  

___
## 配列リファレンスを使う
配列のデリファレンスは以下のように簡単に書くこともできます。

    print $dog_ref->[1]; #=> bulldog

通常の配列から要素を取り出す形にアロー（->）を加えるだけですから、実際にはこの書き方を使う方が便利です。

    print $dog[1];       # 通常の配列から要素を取り出す場合
    print $dog_ref->[1]; # 配列リファレンスから要素を取り出す場合

___
## 配列リファレンスを使う
では、ここまでの知識を組み合わせて、@animalから要素を取り出してみましょう。

    print ${$animal[0]}[1]; #=> bulldog

アロー（->）を使えばこのように書けます。

    print $animal[0]->[1];  #=> bulldog

アローが添字に挟まれる場合は、省略してこのようにも書けます。

    print $animal[0][1];    #=> bulldog

___
## 練習問題

    animal
     ├─ dog
     │    ├─ shiba
     │    └─ bulldog
     ├─ cat
     │    ├─ mike
     │    └─ abyssinian
     └─ bird
           ├─ eagle
           └─ crow

- 次の処理をする `array_ref.pl` を作りましょう。
    1. 上記のデータ構造を表す配列リファレンス`$animal`を作ってください。
    2. その中から`eagle`を取り出してください。
    3. 余裕があれば、他の要素を取り出したり、要素を増やしたりしてみましょう。

___
## ハッシュリファレンスを使う
以下のようなデータ構造があるときに、

    animal
     └─ dog
           ├─ name: 'Taro'
           └─ color: 'brown'

ハッシュを使えば1階層分の処理は可能ですが、

    my %dog = (
        name => 'Taro',
        color => 'brown',
    );
    print $dog{name}; #=> Taro

___
## ハッシュリファレンスを使う

複数の階層をまたぐ処理はできません。

    my %animal = (
        dog => (
            name => 'Taro',
            color => 'brown',
        ),
    );
    print $animal{dog}{name}; #=> 'Taro'を表示したいがエラー

しかし、リファレンスを使えばこれが可能になります。

___
## ハッシュリファレンスを使う
ハッシュリファレンスを使えば意図した構造でデータを格納できます。

    my %dog = (
        name => 'Taro',
        color => 'brown',
    );
    my $dog_ref = \%dog; # %dogをもとにハッシュリファレンス$dog_refを作る

    my %animal = (
        dog_key => $dog_ref,
    ); # $dog_refをvalueとする%animalを作る

無名ハッシュを使って、一度にまとめて書くこともできます。

    my %animal = (
        dog_key => {
            name => 'Taro',
            color => 'brown',
        },
    );

___
## ハッシュリファレンスを使う
では、%animalから`Taro`を取り出すにはどうすればいいでしょうか？

まずハッシュの復習をかねて%dogから要素を取り出してみましょう。

    print $dog{name}; #=> Taro

同様に、ハッシュリファレンス$dog_refから要素を取り出すにはこのようにします。

    print ${$dog_ref}{name}; #=> Taro

なぜこのような書き方になるのでしょうか？

- じつは、ハッシュリファレンスを{}で囲んで先頭に%を付けると、元のハッシュとして扱うことができます。
- つまり、`%{$dog_ref}`と`%dog`は等価です。  
- よって、ハッシュから要素を取り出すときと同様に、シジル%を$に変えて、{key}を付けることで要素を取り出すことができるのです。

___
## ハッシュリファレンスを使う

    1. ハッシュ%dogを作る。
    my %dog = ( name => 'Taro', color => 'brown',);

    2. 複雑なデータ構造を扱えるようにするため、
    ハッシュ%dogから配列リファレンス$dog_refを作る。
    my $dog_ref = \%dog;

    3. ハッシュリファレンス$dog_refを%{$dog_ref}とすることで、
    %dogと同等に扱えるようにする。

    4. %{$dog_ref}から要素`Taro`を取り出す。
    print ${$dog_ref}{name}; #=> Taro

___
## ハッシュリファレンスを使う
ハッシュのデリファレンスは以下のように簡単に書くこともできます。

    print $dog_ref->{name}; #=> Taro

通常のハッシュから要素を取り出す形にアロー（->）を加えるだけですから、実際にはこの書き方を使う方が便利です。

    print $dog{name};       # 通常のハッシュから要素を取り出す場合
    print $dog_ref->{name}; # ハッシュリファレンスから要素を取り出す場合

___
## ハッシュリファレンスを使う
では、ここまでの知識を組み合わせて、%animalから`Taro`を取り出してみましょう。

    print ${$animal{dog_key}}{name}; #=> Taro

アロー（->）を使えばこのように書けます。

    print $animal{dog_key}->{name}; #=> Taro

アローが{key}に挟まれる場合は、省略してこのようにも書けます。

    print $animal{dog_key}{name}; #=> Taro

___
## 練習問題

    animal
     ├─ dog
     │    ├─ name: 'Taro'
     │    └─ color: 'brown'
     └─ cat
           ├─ name: 'Tama'
           └─ color: 'white'

- 次の処理をする `hash_ref.pl` を作りましょう。
    1. 上記のデータ構造を表すハッシュリファレンス`$animal`を作ってください。
    2. その中から`white`を取り出してください。
    3. 余裕があれば、他の要素を取り出したり、要素を増やしたりしてみましょう。

___
## リファレンスに代入する
配列やハッシュと同様、リファレンスにも新たな要素を代入できます。

    animal
     ├─ dog
     │    ├─ shiba
     │    └─ bulldog
     └─ cat

上記のデータ構造における`dog`の3番目の要素に`poodle`を加えたい場合は、このようにします。

    my @animal = (['shiba', 'bulldog'], 'cat');
    ${$animal[0]}[2] = 'poodle'; # 新たな要素を代入

無名配列を使って、このように書くこともできます。

    $animal[0]->[2] = 'poodle';
    $animal[0][2] = 'poodle';

___
## リファレンスに代入する

    animal
     └─ dog
           ├─ name: 'Taro'
           └─ color: 'brown'

上記の構造における`dog`に、`key: value`の関係が`age: 3`になる新たな要素を代入する場合はこのようにします。

    my %animal = (
        dog => {
            name => 'Taro',
            color => 'brown',
        },
    );
    ${$animal{dog}}{age} = 3; # 新たな要素を代入

無名ハッシュを使って、このように書くこともできます。

    $animal{dog}->{age} = 3;
    $animal{dog}{age} = 3;

___
## リファレンスの中身を全部見る
データ構造の中身を出力したいとき、ここまではその要素の一部だけを取り出してきました。

しかし、中身を一度にすべて見たい場合はどうすればいいでしょうか？

ためしに、以下のハッシュリファレンス（無名ハッシュ）を普通にprintしてみましょう。

    my $dog = {
        name => 'Taro',
        color => 'brown',
    };
    $dog->{age} = 3;

    print $dog; #=> HASH(0x7f8aa2029380)

___
## リファレンスの中身を全部見る

- `HASH(0x7f8aa2029380)` のような出力が得られたと思います。(括弧内の英数字は実行環境によって異なります)
- 今回の例はハッシュリファレンスなのでHASH()となっていますが、スカラーリファレンスならSCALAR()、配列リファレンスならARRAY() と表示されます。
- 初めに説明したように、リファレンスとはデータそのもの（実体）ではなく、それを指し示すもの（参照）を扱うものでした。
- じつはHASH() の括弧内の英数字は、実体が格納されているアドレス（場所の情報）です。
- print関数は実体を出力する働きをもつため、アドレスが表示されてしまうのです。

___
## Data::Dumperを使う
このようなときは、`Data::Dumper` モジュールを使えばリファレンスの中身を一括表示（ダンプ）できます。

    use Data::Dumper; # 最初にモジュールの使用を宣言
    my $dog = {
        name => 'Taro',
        color => 'brown',
    };
    $dog->{age} = 3;
    print Dumper($dog); # Data::Dumperを使ってprint
    # 出力結果↓
    # $VAR1 = {
    #         'name' => 'Taro',
    #         'color' => 'brown',
    #         'age' => 3
    #         };

この例のように、新たな要素を代入した後に中身を確かめたいときや、データの中身を把握していないときなどに役立つので覚えておきましょう。

___
## 最終問題
- 次の処理をする `array_hash_ref.pl` を作りましょう。
    1. ここまでに学んだ内容をもとに、配列リファレンスとハッシュリファレンスが混在するリファレンス`$array_hash_ref`を作ってください。
        - 中身の要素は自由に設定してください。
        - もし題材が思い浮かばない場合は、自分の家族や所属する組織、あるいは野球やサッカーなどのスポーツチームを使ってください。（架空の存在でもよいでしょう）
    2. その中から、配列リファレンスの要素と、ハッシュリファレンスの要素をどれでもよいので一つずつ出力してください。
    3. その後、`Data::Dumper` を使ってリファレンス全体の中身を出力してください。

---
## 復習問題
- <https://github.com/perl-entrance-org/workshop-2016/blob/master/3rd/practice.md>
  - 今回の内容を復習できる問題集です。
  - 不明点があれば、気軽にサポーターに質問してください。
