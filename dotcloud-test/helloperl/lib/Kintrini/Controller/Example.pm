package Kintrini::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';
use Mojolicious::Renderer;


# This action will render a template
sub welcome {
  my $self = shift;
  #   $c      = $c->app(Mojolicious->new);
  # Render template "example/welcome.html.ep" with message
  $self->stash( otavariable => 'Hola probando');
  $self->flash( error => 'Wrong password or user doesn');
  $self->render( message=> 'Welcome to the Mojolicious real-time web framework!');
}

1;
