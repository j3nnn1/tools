require "twitterflisolconf.pl";
use Net::Twitter;
use Data::Dumper;
use feature "say";
use random;
#use Mozilla::CA;
#con oAuth son 350

my %hash = 0;
my $mintimetosleep=600; 
my $nt = Net::Twitter->new(
      traits          => ['API::REST', 'OAuth', 'Legacy', 'RateLimit'],
      consumer_key    => '',
      consumer_secret => '',
      clientname      => 'otro_cliente_mas',
      clienturl       => 'www.flisol.org.ve'

);

my $dent = Net::Twitter->new( username        => '',
                              password        => '',
                              clientname      => 'otro_cliente_mas',
                              identica        => 1);

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
    my @ultimoenviado;
    while (1) {
        if ($nt->rate_remaining > 1) {

    	my $arrayref = $nt->direct_messages();
	    #listar DMS
	    foreach (@{$arrayref}) {
            my $id_new = $_->{id_str};
            if ($#ultimoenviado > 80){
                #elimina Dms
                map $nt->destroy_direct_message($_), @ultimoenviado;
            }
            unless (grep {$_ eq $id_new}  @ultimoenviado) {
                if (length($_->{text})<120) {
                    #armando tweet
                    my $tweet = substr("(via \@$_->{sender_screen_name}) ". $_->{text}, 0, 140);
                    print $tweet."\n";
                    push @ultimoenviado, $_->{id_str};
                    open FILE, ">>", "enviados.txt";
                    print FILE "$_->{id_str};$_->{sender_screen_name};$_->{sender_id};$_->{created_at};$_->{text}\n";
                    close FILE;
                    #validaratelimit
                    sleep $nt->until_rate(1.0) || $mintimetosleep;
                    #update tweet
                    $nt->update({status=>$tweet});
                    #eliminodm();
                }
                else {
                #desecha tweet
                open FILE, ">>eliminados.txt";
                print FILE "$_->{id};$_->{sender_screen_name};$_->{sender_id};$_->{created_at};$_->{text}\n";
                $nt->destroy_direct_message($_->{id_str});
                }
            }
	    }
        sleep $mintimetosleep;
        }
        else {sleep  $nt->until_rate(1.0) || $mintimetosleep;}
    }
}

sub restore_tokens {
my $a = shift;
my $b = shift;
open FILE, "tokenaccess.db";
my $linea = <FILE>;
chomp $linea;
my @result = split ';', $linea;
close FILE;
return @result;  
}

sub save_tokens {
my $a = shift;
my $b = shift;
open FILE, ">>tokenaccess.db";
print FILE $a.';'.$b;
close FILE;
}
