#!/usr/bin/perl

open IND, 'texto.txt' or die 'no existe archivo texto.txt'; 
open OUT, '> salidatexto.csv' or die 'No se pudo crear archivo'; 

while (<IND>) {
    chomp;
    $_=lc;
    s/[.,:;?"!()]//g;
    s/--//g;
    s/ +/ /g;

    if ( not /^$/ ) { # Ignore empty lines
        @words = split(/ /);

        foreach $x (@words) {
            ++$tokens;
            ++$freq{$x};
        }
        $types = scalar keys %freq;
        $ratio = $tokens/$types;
        print OUT "$tokens, $types, $ratio\n";
  }
}

close IN;
close OUT;
