require "twitterflisolconf.pl";
use Net::Twitter;
use Data::Dumper;
use random;
#use Mozilla::CA;

my  %hash = 0;
my $nt = Net::Twitter->new(
      traits          => ['API::REST', 'OAuth', 'Legacy'],
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
    while (1) {
        do{
            $num = rand $#tweets;
            $hash{$num}=$hash{$num} + 1;
            eval {
                $nt->update({status => "$tweets[$num]"});
                $dent->update({status => "$tweets[$num]"});
            };
            if ($@) { $error=1; print $!."\n". $tweets[$num]."\n"; } 
            else {$error=0;}
        } while($error);
        foreach my $key (keys %hash) {
            print "$key: $hash{$key}\n";
        }
        sleep(900);
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
