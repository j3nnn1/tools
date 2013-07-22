 use Net::Twitter;
 use Scalar::Util 'blessed';

  # As of 13-Aug-2010, Twitter requires OAuth for authenticated requests
  my $nt = Net::Twitter->new(
      traits   => [qw/OAuth API::REST/],
      consumer_key        => $consumer_key,
      consumer_secret     => $consumer_secret,
      access_token        => $token,
      access_token_secret => $token_secret,
  );

  my $result = $nt->update('Hello, world!');

  eval {
      my $statuses = $nt->friends_timeline({ since_id => $high_water, count => 100 });
      for my $status ( @$statuses ) {
          print "$status->{created_at} <$status->{user}{screen_name}> $status->{text}\n";
      }
  };
  if ( my $err = $@ ) {
      die $@ unless blessed $err && $err->isa('Net::Twitter::Error');

      warn "HTTP Response Code: ", $err->code, "\n",
           "HTTP Message......: ", $err->message, "\n",
           "Twitter error.....: ", $err->error, "\n";
  }