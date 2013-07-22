# 3.8 - With HTML, it is possible to encode a variety of information by modifying the font in various ways.
# This problem considers one such example. Section 3.6.1 shows how to compute word frequencies. 
# Given these frequencies, the task here is to convert them into font sizes, which are then used to write
# an HTML page
# Code sample 3.41 assumes that the hash %size contains font sizes in points for each word in Poe’s “The Black Cat.” 
# The HTML is printed to the file BlackCat.html. Add a note hereThese font sizes are based on word counts using all
# of Poe’s short stories, and $size{$word} was set to the function below.

# int(1.5*log($freq)+12.5)

# Add a note hereIn this case, the frequencies went from 1 to 24,401, so the this function reduces this wide range
# of counts to a range appropriate for font sizes. Output 3.33 has the beginning of the HTML that is produced
# by this code.

# For a text of your own choosing, create a word frequency list, and then modify the frequencies to create font sizes.

#______________SPANISH__________________________

# 3.8 - Con HTML, es posible codificar una variedad de informacion por 
# la modificacion de la fuente(letra font) en varias maneras.
# Este problema considera uno como ejemplo. Section 3.6.1 muestra como procesar frecuencias de palabras. 
# dadas estas frecuencias, la tarea aqui es convertirlos en tamaños de fuentes, las cuales son usadas para escribir
# una pagina HTML

# Code sample 3.41 asume que el hash %size contiene el tamaño de las letras(fuentes) 
# en puntos para cada palabra en Poe’s “The Black Cat.” 
# El HTML es impreso a el archivo BlackCat.html. estos tamaños de fuentes estan basados 
# en el conteo de palabras usado en todo Poe’s short stories, y $size{$word}
# fue configurado para la funcion a continuacion.

# int(1.5*log($freq)+12.5)

# En este caso, la frecuencia dada por 1 to 24,401, entonces esta funcion reduce este amplio rango
# de contadores  a un rango apropiado para el tamaño de las fuentes.
# salida 3.33 muestra el HTML que se genera por este codigo

# Para un texto de tu escogencia, crea una lista de frecuencia de palabra, y entonces modifica
# las frequencias para crear el tamaño de la fuente(letra).

