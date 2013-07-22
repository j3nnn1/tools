#multiplicando dos vectores suponiendo que tienen un ángulo 0
#
@x = (19, 9, 7, 13, 22, 0, 1, 2);
@y = (33, 0, 17, 3, 32, 0, 1, 0);
$answer = dot(\@x, \@y);
print "Dot product = $answer\n";

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

