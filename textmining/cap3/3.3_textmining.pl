#Discusses word ANAGRAMS,

#which are two (or more) words using the same group of letters, but with different orders.
#For example, algorithm is an anagram of logarithm since the former is a permutation of the latter. 
#Instead of allowing all permutations,
#one challenge is finding word anagrams limited to only certain types of permutations,
#A - The easiest permutation to check is reversing the letters because there is already a Perl function to do this,  reverse. 
#examples of which are given below. Examples can be found by using a word list, for example, Grady Ward’s CROSSWD.TXT from the Moby Word Lists [123].
#Find all the words that are also words when read backwards.
#Hint: One way to do this is to create a hash, say %list, where its keys are the words in the word list.
#Then loop through the keys checking to see if the reversal of the word is also a key, as done in code sample 3.36.
#Note that this also finds palindromes, that is, words that are the same backwards as forwards, for example, deified. 
#B - Another simple permutation is taking the last letter and putting it first (sometimes called a rotation). 
#Find words for which this rotation is also a word. For example, rotating trumpets produces strumpet, 
#or rotating elects produces select.
#Hint: Use the function rotate in code sample 3.37 instead of reverse in code sample 3.36.
	
	#sub rotate {
	#  my $word = $_[0];
	#  my @letters = split(//, $word);
	#  unshift(@letters, pop(@letters));
	#  return join('', @letters);
	#}

# C - Create a function that is a rotation in the opposite sense of rotate in code sample 3.37. 
#Then find all words that are still words under this new rotation. For example, rotating swear 
#in this way produces wears. Question: how does this list compare with the list from problem 3.3.b?

#______________________________SPANISH_____________________________________

#ANAGRAMAS,
#Los anagramas son dos o más palabras usando el mismo grupo de letras, pero con diferente orden.
#Por ejemplo, algoritmo es un anagrama de logaritmo. A pesar de permitir todas las permutaciones,
#una forma es encontrar palabras anagramas limitar por ciertos tipos de permutaciones,
#Un ejemplo puede ser encontrado usando una lista de palabras, 
#como Grady Ward’s CROSSWD.TXT de la lista de Moby.

#A - la forma más fácil de revisar la permutación es revertiendo las letras, porque ya existe una función en perl
#que hace esto, reverse. Encuentra todas las palabras que son tambien palabras cuando son leidas al reves. 
#Pista: Una forma para hacer esto es crear un hash, llamado %list, donde sus llaves son las palabras en la lista 
#de palabras. Entonces recorre las llaves chequeando para ver si la palabra al revés es entonces una llave,
#Como en el codigo de ejemplo 3.36. 
#Note que esto tambien encuentra PALINDROMES,
#que son palabras que tienen el mismo significado escritas al revés y de forma normal, por ejemplo deified.

	#foreach $x (sort %list) {
	#  if ( exists($list{reverse($x)}) ) {
	#    print "$x\n";
	#  }
	#}

#B - Otra simple permutacion es tomando la ultima letra y colocandola de primero (algunas veces llamada rotación).
#encuentra palabras en las cuales esta rotación es tambien una palabra por ejemplo, rotando  trumpets se produce strumpet,
#o rotando elects se produce select.
#Pista: Usa la función rotate en el codigo de ejemplo 3.37 así como tambien de reverse en el codigo de ejemplo 3.36
#Code Sample 3.37: A function to move the last letter of a word to the front for problem 3.3.b.

#sub rotate {
#  my $word = $_[0];
#  my @letters = split(//, $word);
#  unshift(@letters, pop(@letters));
#  return join('', @letters);
#}

#C - Crea una funcion que se llame rotacion, en opuesto sentido de rotate en el ejemplo de codigo del 3.37
#Encuentra todas las  que todavia son palabras en esta nueva rotación, por ejemplo rotando swear
#En esta manera produce wears. Pregunta: Como esta lista compara con la lista del problema 3.3b?

#leyendo CROSSWD.txt

my %list;
my %palindrome;
my %rotate;
my %rotacion;
 
open WORD, 'CROSSWD.txt';

while (<WORD>) {
	chomp;
	#print $_."\n";
	$list{$_}=undef;
}

close WORD;

print "Ejercicio A \n";
foreach my $word (sort %list){
	if (exists($list{reverse($word)})) {
		print "$word : ".reverse($word)."\n";
		$palindrome{$word}=undef;
	}
}
print "Total palindromes: ". scalar (keys (%palindrome ))."\n";
print "Total palabras CROSSWD.txt: " . scalar (keys (%list))."\n";

print "Ejercicio B \n";
sub rotate {
  my $word = $_[0];
  my @letters = split(//, $word);
  unshift(@letters, pop(@letters));
  return join('', @letters);
}

foreach my $word (sort %list){
	if (exists($list{rotate($word)})) {
		print "$word : ".rotate($word)."\n";
		$rotate{$word}=undef;
	}
}
print "Total rotate: ". scalar (keys (%rotate ))."\n";
print "Total palabras CROSSWD.txt: " . scalar (keys (%list))."\n";

print "Ejercicio C \n";

sub rotacion {
	my $word = shift;
	my @letters = split //, $word;
	push(@letters, shift(@letters));
	return join('', @letters);
}

foreach my $word (sort %list){
	if (exists($list{rotacion($word)})) {
		print "$word : ".rotacion($word)."\n";
		$rotacion{$word}=undef;
	}
}
print "Total palindromes: ". scalar (keys (%palindrome ))."\n";
print "Total rotate: ". scalar (keys (%rotate ))."\n";
print "Total rotacion: ". scalar (keys (%rotacion ))."\n";
print "Total palabras CROSSWD.txt: " . scalar (keys (%list))."\n";
