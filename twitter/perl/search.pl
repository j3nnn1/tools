require "twitterflisolconf.pl";
use Net::Twitter;
use Data::Dumper;
use feature "say";
#use common::sense;
use random;
#use Mozilla::CA;
#con oAuth son 350

my @ultimoenviado;
my $mintimetosleep = 0;
my  %hash = 0;
my $id_new;
my $nt = Net::Twitter->new(
      traits          => ['API::REST', 'OAuth', 'Legacy', 'RateLimit'],
      consumer_key    => '',
      consumer_secret => '',
      clientname      => 'otro_cliente_mas',
      clienturl       => 'www.flisol.org.ve'

);


my($access_token, $access_token_secret) = restore_tokens();

if (defined($access_token) && defined($access_token_secret)) {
      $nt->access_token($access_token);
      $nt->access_token_secret($access_token_secret);
}


unless ( $nt->authorized ) {
      # The client is not yet authorized: Do it now
      print "Authorize this app at ", $nt->get_authorization_url, " and enter the PIN#\n";
      my $pin = <STDIN>; # wait for input
      chomp $pin;

      my($access_token, $access_token_secret, $user_id, $screen_name) = $nt->request_access_token(verifier => $pin);
      save_tokens($access_token, $access_token_secret); # if necessary
}
else {
    srand(time);
    while (1) {
        if ($nt->rate_remaining > 1) {
            my $busqueda = $nt->search('Flisol2011');
            my $busqueda2 = $nt->search('Flisolve');
            my $busqueda3 = $nt->search('Flisol');
            #listar mentions
            foreach my $tweet (@{$busqueda->{results}}) {
                $id_new = $tweet->{id_str};
                unless(existe($id_new)) {
                        push @ultimoenviado, $id_new;
                        open FILE, ">>busquedaflisol2011.txt";
                        print FILE "$tweet->{id_str};$tweet->{sender_screen_name};$tweet->{sender_id};$tweet->{created_at};$tweet->{text}\n";
                        close FILE;
                        if ($#ultimoenviado>19) {
                            shift @ultimoenviado;
                        }
                }
            }
            foreach my $tweet (@{$busqueda2->{results}}) {
                $id_new = $tweet->{id_str};
                unless(existe($id_new)) {
                        push @ultimoenviado, $id_new;
                        open FILE, ">>", "busquedaflisol2011.txt";
                        print FILE "$tweet->{id_str};$tweet->{sender_screen_name};$tweet->{sender_id};$tweet->{created_at};$tweet->{text}\n";
                        close FILE;
                        if ($#ultimoenviado>19) {
                            shift @ultimoenviado;
                        }
                }

            }
             foreach my $tweet (@{$busqueda3->{results}}) {
                $id_new = $tweet->{id_str};
                unless(existe($id_new)) {
                        push @ultimoenviado, $id_new;
                        open FILE, ">>busquedaflisol2011.txt";
                        print FILE "$tweet->{id_str};$tweet->{sender_screen_name};$tweet->{sender_id};$tweet->{created_at};$tweet->{text}\n";
                        close FILE;
                        if ($#ultimoenviado>19) {
                            shift @ultimoenviado;
                        }
                }

            }
        
            sleep(300);
            print '--------------------------------------------------------------------------------------------'."\n";
        }
        else {sleep  $nt->until_rate(1.0) || $mintimetosleep;}
    }
}

sub existe {
    my $id=shift;
    if (grep {$_ eq $id}  @ultimoenviado){ return 1;}
    else {
        return 0;
    }
}
sub restore_tokens {
my $a = shift;
my $b = shift;
open FILE, "tokenaccess.db.nosubir";
my $linea = <FILE>;
chomp $linea;
my @result = split ';', $linea;
close FILE;
return @result;  
}

sub save_tokens {
my $a = shift;
my $b = shift;
open FILE, ">>tokenaccess.db.nosubir";
print FILE $a.';'.$b;
close FILE;
}
