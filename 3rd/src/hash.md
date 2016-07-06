# ハッシュ

## ハッシュとはなんでしょう
- Perl のデータ構造のひとつで、「連想配列」とも呼ばれます。
- 配列と同じく、任意個の値の格納・取り出しができます。
- ハッシュは配列とは異なり、「数値」ではなく「名前」を使って、格納した個々の「値」を指定します。
    - 要素を指定する為の名前を "key"、key によって指定された要素を "value" と呼びます。

## たとえば

- 名前: Alice
- 職業: Programmer
- 所属: PerlEntrance

...という人をデータとして表現してみましょう。

## 配列と比較してみましょう
配列の場合だとこんな感じになるのではないでしょうか。

    my @user = ('Alice', 'Programmer', 'PerlEntrance');
    print $user[0]; # 最初の要素が表示される => "Alice"
    print $user[1]; # 2番目の要素が表示される => "Programmer"
    print $user[2]; # 3番目の要素が表示される => "PerlEntrance"

`@user`の添字`0`が名前, `1`が職業... といった形で覚えなくてはなりません. 面倒ですね.

## これがハッシュだと...

    my %user = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    print $user{name};        # 名前 (name) が表示される => "Alice"
    print $user{job};         # 職業 (job) が表示される => "Programmer"
    print $user{affiliation}; # 所属 (affiliation) が表示される => "PerlEntrance"

なんだかわかりやすい感じがしますね！

## ハッシュの代入と出力
- ハッシュは % を使って定義します。
- ハッシュにアクセスするときは、添字として波括弧 {} を使います。
- 1つのハッシュ内に、文字列や数値が混在していても構いません。

百聞は一見に如かず。以下の例を見てみましょう。

    my %hash;              # ハッシュを定義
    $hash{name} = 'Alice'; # "name" という key に "Alice" という value を代入
    $hash{age}  = 16;      # "age" という key に "16" という value を代入
    print "$hash{name}\n"; # => "Alice"
    print "$hash{age}\n";  # => 16

## ハッシュの代入と出力
ハッシュは配列の一種なので、こういう書き方もできます。

    my %hash = ('name', 'Alice', 'age', 16);
    print "$hash{name}\n"; # => "Alice"
    print "$hash{age}\n";  # => "16"

## ハッシュの代入と出力
実際には、こういう風に書くのが便利で良い感じです。

    my %hash = (
        name => 'Alice',   # ファットコンマ演算子 (=>) で key と value の関係を書ける
        age  => 16       # 左側の値は文字列として解釈されるのでクォートの必要がない
    );
    print "$hash{name}\n"; # => "Alice"
    print "$hash{age}\n";  # => "16"

- ファットコンマ演算子は基本的にコンマのようなものです。
- ハッシュではファットコンマ演算子を使うと、 key と value の関係性(`=>`の左がkey, 右がvalue)が見やすくなるので便利です。

## 結局ハッシュの何が便利なのか？
    my @user = ('Name', 'Job', 'Affiliation');

これがある日突然

    my @user = ('Affiliation', 'Job', 'Name');

という風に順序が入れ替わったらどうしましょう？ 今まで動いていたコードを書き換えなくてはならなくなります。  
ハッシュだと、順序ではなく key で対応付けられているので、そういった問題が起こりません。

## 練習問題
- 次のような挙動をするプログラムを`hash_profile.pl`という名前で作成しましょう.
1. 自分の名前 (name)、年齢 (age)、好きな食べ物 (food) を key にしたハッシュを作ってみましょう。
2. key である `name`, `age`, `food` を用いて、それぞれの value をprintしてみましょう。
