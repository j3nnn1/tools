#!/usr/bin/perl
#subrutina coseno 
#textmining

#subrutina que retorna el tamaño de un vector
@vector = (19, 9, 7, 13, 22, 0, 1, 2);
$length = vector_length(@vector);
print "Length of vector = $length\n";

sub vector_length {
  my $sum = 0;
  for(my $i = 0; $i <= $#_; $i++) {
    $sum += $_[$i]*$_[$i];

  }
  return(sqrt($sum));
}