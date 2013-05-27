package Kintrini;
use Mojolicious::Plugin::Mongodb;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  #$self->plugin('PODRenderer');

  # Routes
  my $r = $self->routes;
  # namespace
  $r->namespace('Kintrini::Controller');

  # Normal route to controller
  $r->route('/')->to('example#welcome');
  $r->route('/index')->to('history#index');

  #Model
  $self->plugin('linked_content', {
                'js_base' => '/jsdir', 
                });
  $self->plugin('mongodb', { 
            host => 'twinfo-j3nnn1-data-0.dotcloud.com',
            port => 22284,
            helper => 'db',
            });
  my $login = $self->db->authenticate("metrics", "twjenn", "twjennni");
  $self->db->get_database(history);
  #select databaase
  $self->db->get_collection("my_collection")->insert({'bar' => 'baz'});
  #
  #my $absolute_path = '../static';
  #$self->app->static->root($absolute_path);

#my_collection
}

1;
