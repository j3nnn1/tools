#!/usr/bin/perl

#USAGE > perl  count_characters_text.pl  filename.txt
#this program is case insensitive
#this program counts all characters, not just letters.

open (FILE, "$ARGV[0]") or die("$ARGV[0] not found");

#variable especial que contiene el separador utilizado al hacer print
#Paragraph mode used
$/= "";

#contando letras del archivo.

while (<FILE>) {
chomp;
s/\n/ /; #Reemplazo nueva líneas por espacios
$_ = lc; #llevando todo a minuscula
@chars = split(//); #todos los caracteres de una linea para el  @chars

    foreach $char (@chars) {
        #hash que contiene la frecuencia con que sale una letra en el texto
        ++$freq{$char};
    }
}


#probabilidad 


$count=0; #Almacena el numero total de letras

foreach $char (sort byReverseValues keys %freq) {
    if ('a' le $char and $char le 'z') {
        $count += $freq{$char};
    }
    print "$char: $freq{$char}\n";
}

print "\nTotal numero de letras $count\n";

foreach $letter ('a'.. 'z') { 

    print "$letter: $freq{$letter}\n"
}

sub byReverseValues {
    #los ordena por la cantidad de veces que sale una letra
    print "a:$a  b:$b \n";
    $value = $freq{$b} <=> $freq{$a};
    if ($value==0) { return $a cmp $b;}
    else { return $value;}
}


