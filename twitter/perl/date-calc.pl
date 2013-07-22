#!/usr/bin/perl
#flisol 2011
use strict;
use Date::Calc qw{Delta_Days Delta_DHMS};
use Data::Dumper;
use Net::Twitter;
use common::sense;
use random;

my @enddate = (2011, 4, 9);

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
	#main

	while (1) {
    	my @today   = localtime(time);
	my $Dd = Delta_Days(($today[5] + 1900) ,($today[4] + 1),($today[3]+1),
						$enddate[0],$enddate[1],$enddate[2]);
	my $error;
	do{
			my $tweet = 'Faltan '. $Dd .' días para el #Flisol2011,q esperas?busca la sede más cercana y participa,libera tu computador http://ur1.ca/3p6m3 te esperamos!';

            print $tweet."\n";

	    eval {
                $nt->update({status => $tweet});
                $dent->update({status => $tweet});
            };
            if ($@) { $error=1; print $! .'- '. $@."\n". $tweet."\n"; } 
            else {$error=0;}
			
    	} while($error);
		
	sleep(86400);
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
