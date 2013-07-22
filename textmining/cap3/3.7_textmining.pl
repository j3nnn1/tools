# 3.7 - Lewis Carroll created the game called Doublets, where the goal is to transform one word into another
# (of the same length) by changing one letter at a time, and such that each intermediate step is itself a word.
# For example, red can be transformed into hot as follows: red, rod, rot, hot.

# One approach to this is to create a word network that shows all the one-letter-change linkages.
# The programming task of creating and storing such a network in a (complex) data structure is 
# challenging because the network can be quite large (depending on the number of letters), and it is possible
# to have loops in the network (the network is not a tree in the graph-theoretic sense).

# This problem presents an easier task: given one word, find all other words that are only a one-letter
# change from the given word. For example, the words deashed, leached, and leashes are all exactly one
# letter different from leashed. 

# Here is one approach. Create a hash from a word list (using, for example, Grady Ward’s CROSSWD.TXT 
# from the Moby Word Lists [123]). Then take the given word, replace the first letter by each letter of
# the alphabet. Check each of these potential words against the hash. Then do this for the second letter,
# and the third, and so forth. See code sample 3.40 to get started.

# Code Sample 3.40: Hint on how to find all words that are one letter different from a specified word. For problem 3.7.

# $len = length of the word in $ARGV[0]
# The keys of %list are from a word list

# for ($i = 0; $i < $len; ++$i) {
  # foreach $letter ( 'a' .. 'z' ) {
    # $word = $ARGV[0];
    # substr($word, $i, 1) = $letter;

    # if ( exists($list{$word}) and $word ne $ARGV[0]) {
      # print "$word\n";
    # }
  # }
# }

# Finally, for more information on Doublets, see chapter 22 of Tony Augarde’s The Oxford Guide to Word Games [5]. 
# Moreover, sections 42 through 44 of Ross Eckler’s Making the Alphabet Dance [41] give examples of word networks.


#______________________SPANISH___________________________

# 3.7 - Lewis Carroll creó el juego llamado Doublets, donde la meta es transformar una palabra en otra
# (del mismo tamaño) cambiando una letra en cada tiempo, y como eso es cada paso intermedio es en si mismo una palabra.
# Por Ejemplo, red puede ser transfomado en hot como se muestra a continuación: red, rod, rot, hot.

# Una aproximación para hacer esto es crear una red de palabras que muestre todo, el unico-cambio-de-letra es el enlace.
# La tarea de programar de crear y almacenar como una red en una (compleja) estructura de data 
# es un reto porque la red puede ser muy grande (dependiendo del numero de letras), y es posible
# tener ciclos en la red (la red no es un arbol en el sentido de teoria de grafos).

# Este problema presenta una fácil tarea: dada una palabra, encuentra todas las otras 
# palabras que solo tienen una letra cambiada a partir de la palabra dada.
# Por Ejemplo, las palabras deashed, leached, y leashes son todas exactamente una letra diferente 
# de leashed  

# Aquí una aproximación. Crea un hash a partir de una lista de palabras (usando, por ejemplo, Grady Ward’s CROSSWD.TXT 
# from the Moby Word Lists [123]). Entonces toma la palabra dada, 
# remplaza la primera letra por cada una letra del alfabeto
# Verifica cada una de estas potenciales palabras contra el hash. Entonces haz esto para la segunda letra,
# y la tercera, y así consecutivamente. Ver codigo de ejemplo 3.40 para iniciar.

# Code Sample 3.40: Hint on how to find all words that are one letter different from a specified word.
# For problem 3.7.

# $len = length of the word in $ARGV[0]
# The keys of %list are from a word list

# for ($i = 0; $i < $len; ++$i) {
  # foreach $letter ( 'a' .. 'z' ) {
    # $word = $ARGV[0];
    # substr($word, $i, 1) = $letter;

    # if ( exists($list{$word}) and $word ne $ARGV[0]) {
      # print "$word\n";
    # }
  # }
# }

# Finally, for more information on Doublets, see chapter 22 of Tony Augarde’s The Oxford Guide to Word Games [5]. 
# Moreover, sections 42 through 44 of Ross Eckler’s Making the Alphabet Dance [41] give examples of word networks.

