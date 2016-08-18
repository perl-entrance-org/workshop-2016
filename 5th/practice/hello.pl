#!/usr/bin/env perl
use Mojolicious::Lite;

# Documentation browser under "/perldoc"
plugin 'PODRenderer';

get '/' => sub {
  my $self = shift;
  $self->stash(title => 'Hello');
  $self->render(template => 'index');
};

get '/profile' => sub {
    my $self = shift;
    $self->stash(name     => 'htk291');
    $self->stash(hobby    => 'anime');
    $self->stash(language => 'Perl');
    #$self->render(template => 'profile');
    $self->render('profile');
};

get '/fizzbuzz' => sub {
    my $self = shift;
    $self->render('fizzbuzz');
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
<h1>Welcome to the Mojolicious real-time web framework!</h1>
To learn more, you can browse through the documentation
<%= link_to 'here' => '/perldoc' %>.

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>

@@ profile.html.ep
<html>
<head><title><%= $name %>のプロフィール</title></head>
<body style='padding: 30px;'>
  私の名前は<%= $name %>です.<br>
  趣味は<%= $hobby %>で, 好きなプログラミング言語は<%= $language %>です.
</body>
</html>

@@ fizzbuzz.html.ep
<html>
<head><title>FizzBuzz</title></head>
<body>

%  for my $i (1 .. 100) {
%    if ($i % 15 == 0) {
%=      'FizzBuzz';
%    } elsif ($i % 3 == 0) {
%=      'Fizz';
%    } elsif ($i % 5 == 0) {
%=      'Buzz';
%    } else {
%=      $i;
%    }
     <br/>
%  }
</body>
</html>

