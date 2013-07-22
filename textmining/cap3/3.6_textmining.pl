#3.6 - Transaddition is the following process: take a word, add a letter such that all the letters can be
#rearranged to form a new word. For example, adding the letter t to learn produces antler (or learnt or rental).
# A transdeletion is the removal of a letter so that what remains can be rearranged into a word, for example,
# removing l from learn produces earn (or near). For an extensive discussion on these two ideas, see sections 41
# and 49 of Ross Eckler’s Making the Alphabet Dance

#Code sample 3.39 shows how to take a word and find what words can be found by adding a letter and then rearranging all
# of them. Starting with this code, try changing it so that it can find transdeletions instead. Assume that WORDS is
# the filehandle for a word list.
#Code Sample 3.39: Code to find all transadditions of a given word. For problem 3.6.

#while (<WORDS>) {
#  chomp;
#  $key = join('',sort(split(//, $_)));
#  if ( exists($list{$key}) ) {
#    $list{$key} .= ",$_";
#  } else {
#    $list{$key} = $_;
#  }
#}

# Transaddition

#$word = $ARGV[0];
#@letters = split(//, $word);
#foreach $x ('a' .. 'z') {
#  @temp = @letters;
#  push(@temp, $x);
#  $key = join('', sort(@temp));
#  if ( exists($list{$key}) ) {
#    print "$list{$key}\n";
#  }
#}	

#___________________SPANISH_____________________________

#3.6 - TRANSADICIÓN ES el siguiente proceso: toma una palabra, añade una letra como esta, todas las letras pueden ser
#reorganizadas para formar una nueva palabra. 
# Por ejemplo, añadiendo la letra t para aprender producir antler (o learnt o rental).
# UNA TRANSELIMINACION ES la eliminación de una letra entonces el resto resultante puede ser reorganizado en una nueva palabra,
# Por ejemplo, eliminando l de learn produce earn (or near).
# Para una extensa discución en estas dos ideas, ver las secciones 41
# and 49 of Ross Eckler’s Making the Alphabet Dance

#Code de ejemplo 3.39 muestra como tomar una palabra y encontrar que palabras
# pueden ser halladas añadiendo una letra a ellas y reorganizandolas todas
# Iniciando con este codigo, intenta cambiarlo y encontrar en él una transeliminacion dentro de él. 
# Asume que WORDS is el manejador de archivos para una lista de palabras
#Code Sample 3.39: Codigo para encontrar todas las transadiciones de una palabra dada. For problem 3.6.

#while (<WORDS>) {
#  chomp;
#  $key = join('',sort(split(//, $_)));
#  if ( exists($list{$key}) ) {
#    $list{$key} .= ",$_";
#  } else {
#    $list{$key} = $_;
#  }
#}

# Transaddition

#$word = $ARGV[0];
#@letters = split(//, $word);
#foreach $x ('a' .. 'z') {
#  @temp = @letters;
#  push(@temp, $x);
#  $key = join('', sort(@temp));
#  if ( exists($list{$key}) ) {
#    print "$list{$key}\n";
#  }
#}	
