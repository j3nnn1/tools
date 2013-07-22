#!/usr/bin/perl -w
use strict;

#probabilidad condicional
# P(B|C) => la probabilidad que el evento B ocurra dado que el evento C ya ocurrio.
# la probabilidad de B dado C
# n => el numero de posibilidades

# P(E|F) = n (E and F) / n (F)
# Probabilidad de que ocurran ambos 
# Probabilidad del que ocurrio.
# P(C) => probabilidad que tenga una letra q al comienzo de la palabra 
# P(B && C) => probailidad que tenga la letra q al comienzo y siguiente la letra u
# P(B) => Probabildiad que salga una letra u como segunda letra.
# P(B|C) = P (B|C) / P(C)
# 

open (FILE, $ARGV[0]) or die "ups.. No existe archivo, o problemas al abrir";

my $n;
my $n_q_first;
my $n_u_second;
my $n_q_then_u;
my $n_nada;
my $n_hice;
my $n_hace;
my $n_todo;

while (my $linea=<FILE>) {

    chomp $linea;
    $linea = lc $linea;
    $linea =~ s/[^a-zA-Z]/ /g;
    $linea =~ s/-+/ /g;
    $linea =~ s/\s+/ /g;

    #divide en palabras la linea
    my @words = split(/\s/, $linea);

    foreach (@words) {
    
        if ( length == 4 ) {
        ++$n;
        print $_, "\n";
        if ( /q.../ ) { ++$n_q_first }
        if ( /.u../ ) { ++$n_u_second }
        if ( /qu../ ) { ++$n_q_then_u }
        if ( /nada/ ) { ++$n_nada; }
        if ( /hice/ ) { ++$n_hice; }
        if ( /hace/ ) { ++$n_hace; }
        if ( /todo/ ) { ++$n_todo; }

        }
    }

}

print "# 4 letter words = ".($n || 'Nada' )."\n";
print "# 4 letter words with q first = ".($n_q_first || 'Nada')."\n";
print "# 4 letter words with u second = ".($n_u_second|| 'nada' )."\n";
print "# 4 letter words starting with qu =".( $n_q_then_u || 'nada' )."\n";
print "Contando los nada: ".$n_nada. "\n";
print "Contando los hice: ".$n_hice. "\n";
print "Contando los hace: ".$n_hace. "\n";
print "Contando los todo: ".$n_todo. "\n";

close FILE;
