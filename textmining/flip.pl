#!/usr/bin/perl

#USAGE > perl flip.pl value
#Este programa simula la probabilidad de  lanzar una moneda
# $ARGV[0] de veces


for ($n=1; $n<=$ARGV[0]; ++$n) {
    if (rand > 0.5) {
        print 'H';
        ++$count;
    }
    else {
        print 'T';
    }
}


#Probabilidad empírica.
#evento es probabilidad que salga cara en $ARGV[0] intentos
$proportion = $count/$ARGV[0];

print "\n". 'Probabilidad de que salga cara en '.$ARGV[0].' intentos ='.$proportion; 
