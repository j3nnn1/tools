#!/usr/bin/perl -w
use strict;

# THE BAG-OF-WORDS MODEL
# es una apropiada metadora tomar las palabras y agruparlas en una bolsa 
# sin tomar en cuenta el orden, y luego regresarlas a su sitio.
# la bolsa de palabras: es el analisis de frecuencia de uso de una palabra
# limitations
# el orden de las palabras es irrelevante
# pierdes importante información
#

my %freq;
my @words;

open (FILE, $ARGV[0]) or die "no existe archivo \n";


while (my $linea=<FILE>){

    $linea =~ s/[^a-zA-Z]/ /g;
    $linea =~ s/-+/ /g;
    $linea =~ s/\s+/ /g;
    $linea = lc $linea;
    #divide en palabras la linea
    @words = split(/\s/, $linea);

    foreach my $word (@words) {
        $freq{$word}++;
   }
}
close FILE;

#imprimiento resultados de los bigramas

my $bigram;
my $j=0;

foreach $bigram ( sort byReverseValues keys %freq) {
        print "$bigram: $freq{$bigram}\n";
            $j++;

                #if ($j==10) { last;}
}

#total.

print "Total de numero de bigramas: ".($#words+1)." \n";


sub byReverseValues {
#los ordena por la cantidad de veces que sale una letra
#print "a:$a  b:$b \n";
        my $value = $freq{$b} <=> $freq{$a};
            if ($value==0) { return $a cmp $b;}
                else { return $value;}
}

