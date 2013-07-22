use Net::Twitter;

my $nt = Net::Twitter->new(
      traits          => ['API::REST', 'OAuth'],
      consumer_key    => "",
      consumer_secret => "",
  );

# You'll save the token and secret in cookie, config file or session database
my($access_token, $access_token_secret) = restore_tokens();
open (FILE, ">>accesstoken.txt") or die 'imposible obtener acceso a twitter';



  if ($access_token && $access_token_secret) {
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
close FILE;

sub save_tokens{
	my $access_token = shift;
	my $access_token_secret = shift;
	print FILE "$access_token;$access_token_secret\n";
}
  # Everything's ready
  
sub restore_tokens{
  open FILE, "accesstoken.txt";
  $linea = <FILE>;
  chomp $linea;
  my @result = split($linea);
  return @result;
}