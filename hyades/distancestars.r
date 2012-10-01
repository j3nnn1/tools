#!/usr/bin/R

dirout = './out'
simbad = read.table('simbad.csv', header=T, sep=';')
hipparcos = read.table('HIPPARCOS.csv', header=T, sep=';')
cruzados = read.table('id_cruzados.csv', header=T, sep=',')

#dist
mdistances = dist(rbind(hipparcos[,2:3], simbad[,4:5])) 

#dist to matrix 
mdist =as.matrix(mdistances)

#matrix to vector
vecdist <- c(mdist)

#unclassify stars, do a hist
hist(vecdist,col="gray20");

#classify stars, do a hist
allcruzados = rbind(as.matrix(cruzados[2:nrow(cruzados),3:4]), as.matrix(cruzados[2:nrow(cruzados),5:6]))

#dist cruzados
mdistcruz = dist(allcruzados)

#matrix to vector.
vecdistcruz = c(as.matrix(mdistcruz))

#oh god why
hist(vecdistcruz, col="green", add=T)



