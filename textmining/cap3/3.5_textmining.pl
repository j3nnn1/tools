#One way to associate a numeric value to a word is as follows.
# Let A=1, B=2, C=3, …, and Z=26, then for a given word, 
#sum up its letter values, for example, cat produces 3+1+20, 
#or 24. This method is sometimes used in word puzzles, for example,
#see section 59 of Ross Eckler’s Making the Alphabet Dance 
# the goal is to write a function that takes a word and returns its number.

#shows one way to do this for all the numerical values at once using a hash
# of hashes. To figure out how the code works, refer back to section 3.8.2. 
#The function ord changes an ASCII character into a number,
# which makes it easy to convert a to 1, b to 2, and so forth.
# The function map applies a function defined with $_ as its argument
# to every entry in an array. For more information on this command,
# try looking it up online at http://perldoc.perl.org/ [3].
# Finally, note that using an array of hashes is another approach to this task.

#Code Sample 3.38: Assuming that WORDS is a filehandle to word list,
# this code finds all words having the same numerical value using the procedure given in problem 3.5.

# $baseline = ord('a')-1;

# while (<WORDS>) {
  # chomp;
  # @letters = split(//);
  # @values = map(ord($_)-$baseline, @letters);
  # $total = 0;  foreach $x (@values) { $total += $x; }
  # push( @{$list{$total}}, $_);

# }

# foreach $value (sort {$a <=> $b} keys %list) {
  # print "$value\n";
  # foreach $word ( @{$list{$value}} ) {
    # print "$word ";
  # }
  # print "\n\n";
# }

#A - Perhaps this problem can be a start of a new type of pseudoscience.
#For your name, find out its value, then examine the words that share this 
#value to discover possible clues to your personality (or love life, or career paths,…). 
#For example, the name Roger has the value 63, which is shared by acetone, catnip, and quiche.
#Not surprisingly, these words describe me quite well

#B - Another numerology angle arises by concatenating the letter values together 
#to form a string. For example, Roger becomes 18157518. It can happen that some numbers are
#associated with more than one word. For example, abode and lode both have the number 121545. 
#For this problem write a Perl program that finds all such words. See the article
#Concatenating Letter Ranks [13] for more information.
#____________SPANISH______________

#Una manera para asociar un valor numerico a una palabra es como como sigue
#asignemos A=1, B=2, C=3, …, and Z=26, entonces para una palabra dada
#suma los valores de las letras, por ejemplo cat produce 3+1+20,
#o 24, Este metodo a veces es usado en los rompecabezas, por ejemplo,
#ver seccion 59 de Ross Eckler’s Making the Alphabet Dance
#La meta es escribir una funcion que tome una palabra y retorne su numero asociado.

#muestra la manera de hacer esto para todos los valores numericos usando un hash de hashes
#para ver como el codigo funciona, ver seccion 3.8.2
#La funcion ord cambia a caracteres ASCII en un numero,
#lo cual hace fácil convertir A á 1, B a 2, y así sucesivamente.
#La funcion map aplica una funcion definida con $_ como su argumento,
#a cada elemento de un arreglo. Para mas información de este comando,
#inteta buscar  en linea en http://perldoc.perl.org/ [3].
#finalmente, note que usando un arreglo de hashes es otra aproximacion a esta tarea.

#Codigo Ejemplo 3.38: Assumiendo que WORDS is a manejador de  archivo con la lista de palabras,
# este codigo encuentra todas las palabras que tienen el mismo 
#valor numerico usando el procedimiento dado en el problema 3.5

#$baseline = ord('a')-1;

#while (<WORDS>) {
#  chomp;
#  @letters = split(//);
#  @values = map(ord($_)-$baseline, @letters);
#  $total = 0;  foreach $x (@values) { $total += $x; }
#  push( @{$list{$total}}, $_);
#}

#foreach $value (sort {$a <=> $b} keys %list) {
#  print "$value\n";
#  foreach $word ( @{$list{$value}} ) {
#    print "$word ";
#  }
#  print "\n\n";
#}

#A - Quizas este problema puede iniciar un nuevo tipo de pseudociencia.
#Para tu nombre, encuentra estos valores, entonces examina las palabras que comparten estos
#valores para descubrir posibles pistas de tu personalidad (o vida amorosa, o carrera profesional, ...)
#Por ejemplo, el nombre Roger tiene el valor 63, el cual es compartido por acetona, catnip, y quiche.
#No sorpresivamente, estas palabras me describen muy bien.

#B - Otro punto de vista numerologico surge por la concatenacion de los valores de las letras juntos.
#para formar una cadena. Por ejemplo Roger inició 18157518. Esto puede suceder con algunos numeros que son
#asociados con mas de una palabra. Por ejemplo abode y lode ambos tienen el numero 121545.
#Para este problema escribe un programa de perl que encuentre todas estas palabras. ver el articulo 
#Rangos de Concatenacion de letras para mas información.

my %list;
my %isograma;

open WORD, 'CROSSWD.txt';

while (<WORD>) {
	chomp;
	#print $_."\n";
	$list{$_}=undef;
}

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

sub falsepositive {
	my $word = shift;
	my $baseline = ord('a')-1; #96
	my @letters = split(//, $word);
	@values = map(ord($_)-$baseline, @letters);
	my $total = 0;  foreach $x (@values) { $total += $x; }
	return $total;
}

sub isogramatrue {
	my $word = shift;
	my $baseline = ord('a') - 1; #96
	my @letters = split(//, $word);
}   

foreach $value (sort {$a <=> $b} keys %list) {
  print "$value\n";
  foreach $word ( @{$list{$value}} ) {
    print "$word ";
  }
  print "\n\n";
}

close WORD;

#el listado del 3.4depurarlo con el peso de las letras.
#separando por letras diferentes, obteniendo su valor numerico y multiplicandolo por 2 si este valor numerico es igual.
#al valor numerico calculado de la palabra entonces NO es un falso positivo y es un isograma.
#dos funciones, converttonumber, converttonumberletters.
