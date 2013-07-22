# Angles are in degrees
# Requires subroutines cosine() and dot()
# Requires the existence of the hash %freq

use Math::Trig;  # Load all trig functions and pi

@pronouns = qw(he she him her his hers himself herself);


foreach $story (keys %freq) { # Print out the story names
  print "$story\n";
}

print "\nCOSINE ANGLES\n\n";
foreach $story1 (keys %freq) {
  foreach $story2 (keys %freq) {
    %hash1 = %{$freq{$storyl}};

    %hash2 = %{$freq{$story2}};
    @vector1 = @hash1{@pronouns};
    @vector2 = @hash2{@pronouns};
    $angle = acos(cosine(\@vector1, \@vector2))/pi*180;
    printf " %.1f", $angle;
  }
  print "\n";

}


sub cosine {
  # This uses the subroutine dot
  my ($vector_ref1, $vector_ref2) = @_;
  my @vector1 = @{$vector_ref1};
  my @vector2 = @{$vector_ref2};


  if ($#vector1 == $#vector2) { # Do vectors have the same length?
    my $length1 = sqrt(dot(\@vector1, \@vector1));
    my $length2 = sqrt(dot(\@vector2, \@vector2));
    my $answer = dot(\@vector1, \@vector2)/($length1*$length2);

    return($answer);
  } else {
    return('Error');
}
}

sub dot {
  my ($vector_ref1, $vector_ref2) = @_;
  my $sum_cross = 0;

  my @vector1 = @{$vector_ref1}; # Dereference pointer
  my @vector2 = @{$vector_ref2}; # Dereference pointer

  if ($#vector1 == $#vector2) { # Ensure vectors have same length
    for (my $i=0; $i <= $#vector1; ++$i) {

      $sum_cross += $vector1 [$i] *$vector2[$i] ;
    }
    return($sum_cross);
  }
}
