package Kintrini::Controller::History;
use Mojo::Base 'Mojolicious::Controller';
use Mojo::Loader;
use Data::Dumper;

sub index {
    my $self = shift;     
    my $dato;
    my $collection;
    $dato  = $self->db('metrics')->getcollection('history');
    $collection = $self->db('metrics')->my_collection;
    $dato = $collection->find_one({screenname => '@tatadbb'});

    $self->app->log->debug(Dumper $dato); 
    $self->stash(titulo => 'buscando.. palabras claves', collection => $collection);
}
#
#sub create {
#    
#    
#}
#
#sub getall {
#    
#    
#}
#
1;
