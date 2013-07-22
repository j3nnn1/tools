#producto de dos vectores
#tomando en cuenta su ángulo.

@x = (19, 9, 7, 13, 22, 0, 1, 2);
@y = (33, 0, 17, 3, 32, 0, 1, 0);


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

$answer = cosine(\@x, \@y);
print "Cosine = $answer\n";

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