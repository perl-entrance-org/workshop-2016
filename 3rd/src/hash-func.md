## ハッシュの便利関数たち

- keys
- values
- delete
- exists

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

## exsits
    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );

    if (exists $hash{job})  { print "exists" } # => exists
    if (exists $hash{team}) { print "exists" } # => 

exists 関数は指定したハッシュの key が存在するかを確認します。

## 練習問題

- 次のような処理を実行する`hash_func.pl`を作成しましょう。
    1. `hash_profile.pl`で作ったハッシュを用意し、そのハッシュの key の一覧を出力してみましょう。
    2. `exists`で年齢の要素が存在するかどうかを確認してみましょう。
    3. ハッシュから、年齢(age)の要素を取り除いてみましょう。
    4. 年齢(age)の要素を削除した後、きちんと削除したか確認します。key の一覧を表示した後、`exists`で年齢の要素が存在しないことを調べ、きちんと削除されている場合は"Age is not exist."と表示するようにしてみましょう。
