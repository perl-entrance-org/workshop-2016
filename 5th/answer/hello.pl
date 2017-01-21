#!/usr/bin/env perl
use Mojolicious::Lite;

# Documentation browser under "/perldoc"
plugin 'PODRenderer';

get '/' => sub {
    my $c = shift;
    $c->stash(title => 'Hello Perl');
    $c->stash(name => 'nqounet');
    $c->stash(hobby => '日本語');
    $c->stash(language => 'Perl');
    $c->render(template => 'profile');
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
<h1>ほげほげ real-time web framework!</h1>
To learn more, you can browse through the documentation
<%= link_to 'here' => '/perldoc' %>.

@@ profile.html.ep
<html>
<head><title><%= $name %>のプロフィール</title></head>
<body style='padding: 30px;'>
  私の名前は<%= $name %>です.<br>
  趣味は
  %= $hobby
  で, 好きなプログラミング言語は
  %= $language
  です.
  <p>
  % my $num = 8;
  1から<%= $num %>までを足すと、合計は
  % my $sum = 0;
  % for my $i (1 .. $num) { $sum += $i }
  %= $sum;
  になります。
  </p>
</body>
</html>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
