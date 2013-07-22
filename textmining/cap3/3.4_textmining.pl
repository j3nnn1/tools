#Using a word list, for example, Grady Ward’s CROSSWD.TXT from the Moby Word Lists [123], 
#find all the words where every letter appears exactly twice using a regex. For example,
#this is true of the word hotshots. 
#This property is called an isogram. For more information on these, see section 29 and figure
# 29c of Ross Eckler’s Making the Alphabet Dance

#First hint: Sort the letters of each word into alphabetical order, 
#then try to create a regex that matches pairs of letters. 
#Note that /^((\w)\1)+$/ seems promising, but does not work.
#Second hint: define a pair of letters regex using qr// as shown below.
$pattern = qr/(\w)\1/;

#Then use the regex /^$pattern+$/. This regex allows false positives (describe them). 
#Is there a simple way to correct this?


#____________SPANISH______________

#USANDO una lista de palabras, por ejemplo Grady ward's CROSSWD.TXT de la lista de palabras Moby,
#Encuentra todas las palabras donde cada letra aparece exactamente 2 veces usando una expresión regular,
#por Ejemplo, esto es verdadero en la palabra hotshots
#Esta propiedad es llamada Isograma, para mas información de esto, ver la seccion 29 y figura 29c

#PRIMERA PISTA: Organiza las letras de cada palabra en orden alfabetico,
#Entonces intenta crear una expresion regular que extraiga solo par de letras,
#Note que  /^((\w)\1)+$/ parece prometer, pero esto no funciona.
#SEGUNDA PISTA: define un par de letras en regex usando qr// como se muestra a continuacion.
#$pattern = qr/(\w)\1/;
#Entonces usa la expresion regular /^$pattern+$/. esta expresion regular permite falsos positivos (descríbelos)
#Existe una manera simple de corregir esto?

my %list;
my %isograma;

open WORD, 'CROSSWD.txt';

while (<WORD>) {
	chomp;
	#print $_."\n";
	$list{$_}=undef;
}

close WORD;

sub isogram {
	my $word = shift;
	my @letters = split //, $word;
	my @orden = sort @letters;
	my $word2 = join '', @orden;
	$pattern = qr/(\w)\1/;
	if ($word2 =~/^$pattern+$/) {
		return $word;
	}
	else {
		return undef;
	}
}

foreach my $word (sort %list){
	if (exists($list{isogram($word)})) {
		print "$word : ".isogram($word)."\n";
		$isograma{$word}=undef;
	}
}

print "Total isogramas: ". scalar (keys (%isograma ))."\n";
print "Total palabras CROSSWD.txt: " . scalar (keys (%list))."\n";
