#!/usr/bin/perl 
use strict;


# 1 se sustituyen las no letras
# 2 se cambian los multiples espacios en uno
# 3 convierte todas las letras mayusculas en minusculas
# 4 convierte el texto en palabras con la función split
# 5 luego divide cada palabra en letras
# 6 Finalmente las letras son combinadas en pares con la funcion join
# 7 numero de bigramas numero de bigramas elevado a la 2, numero de posibles bigramas

#recibo el archivo como parametro de entrada
my %freq;
my $count;

open (FILE, $ARGV[0]) or die "no existe archivo \n";


while (my $linea=<FILE>){

$linea =~ s/[^a-zA-Z]/ /g;
$linea =~ s/-+/ /g;
$linea =~ s/\s+/ /g;
lc $linea;
#divide en palabras la linea
my @words = split(/\s/, $linea);

    foreach my $word (@words) {

        my @letters = split(//, $word);

        foreach (@letters) {
            my $i; $i++;
            my $bigram =  join ('', @letters[$i..($i+1)]);
            ++$freq{$bigram}; 
            ++$count;
        }
    }

}
close FILE;

#imprimiento resultados de los bigramas

my $bigram;
my $j=0;

foreach $bigram ( sort byReverseValues keys %freq) {
    print "$bigram: $freq{$bigram}\n";
    $j++;
    
    if ($j==10) { last;}
}

#total.

print "Total de numero de bigramas: $count \n";


sub byReverseValues {
#los ordena por la cantidad de veces que sale una letra
#print "a:$a  b:$b \n";
    my $value = $freq{$b} <=> $freq{$a};
    if ($value==0) { return $a cmp $b;}
    else { return $value;}
}

