library('cluster')
#getwd()
#setwd('C:/somethingnull/git/tools/hyades/')
#simbad = read.table('simbad.csv', header=T, sep=';')

hipparcos = read.table('newhipparcos.csv', header=T, sep=';')
cruzados = read.table('id_cruzados.csv', header=T, sep=',')

mallmerge = data.frame(RA=hipparcos$RA_J2000,DE=hipparcos$DE_J2000, PLX=hipparcos$Plx, PMRA=hipparcos$pmRA, PMDE=hipparcos$pmDE, VMAG=hipparcos$Vmag, BV=$hipparcos$BV, HYADES=hipparcos$hyades)

asw <- numeric(20)

for (k in 2:20)
	 asw[k] <- pam(mallmerge[,-1], k) $ silinfo $ avg.width
k.best <- which.max(asw)
cat("silhouette-optimal number of clusters:", k.best, "\n")
plot(1:20, asw, type= "h", main = "pam() clustering assessment",
     xlab= "k  (# clusters)", ylab = "average silhouette width")
axis(1, k.best, paste("best",k.best,sep="\n"), col = "red", col.axis = "red")

########## doing pam with k.best

cluss <- pam(mallmerge, k.best);
plot(cluss)

cluss <- pam(mallmerge, 3);
plot(cluss)

cluss <- pam(mallmerge, 4);
plot(cluss)

cluss <- pam(mallmerge, 5);
plot(cluss)
