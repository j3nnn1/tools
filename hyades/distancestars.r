#!/usr/bin/R

dirout = './out'
simbad = read.table('simbad.csv', header=T, sep=';')
hipparcos = read.table('HIPPARCOS.csv', header=T, sep=';')
cruzados = read.table('id_cruzados.csv', header=T, sep=',')


#diit to matrix 
mdist =as.matrix(mdistances)

#matrix to vector
vecdist <- c(mdist)

#withoutzero
vecdist <- vecdist[vecdist>0]

#unclassify stars, do a hist
hdatadist = hist(vecdist);

#where cut
hdatadist$breaks

#classify stars, do a hist
allcruzados = rbind(as.matrix(cruzados[2:nrow(cruzados),3:4]), as.matrix(cruzados[2:nrow(cruzados),5:6]))

#dist cruzados
mdistcruz = dist(allcruzados)

#matrix to vector.
vecdistcruz = c(as.matrix(mdistcruz))

#oh god why
hdatacruz = hist(vecdistcruz, col="green", add=T)

#where cut
hdatacruz$breaks

#deleting with out zerc
sincero = vecdistcruz[vecdistcruz>0]

#min distance to be hyades de 0 a 2
mincruz = min(sincero)

#plotting
h = hist(vecdist);
plot(h$counts, log="xy", pch=20, col="blue",
	main="Log-normal distribution",
	xlab="Value", ylab="Frequency")

hc = hist(sincero)
points(hc$counts, pch=20, col="green",
	main="Log-normal distribution",
	xlab="Value", ylab="Frequency")

#filtering distances







