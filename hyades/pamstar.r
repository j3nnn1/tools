library('cluster')
getwd()
setwd('C:/somethingnull/git/tools/hyades/')
simbad = read.table('simbad.csv', header=T, sep=';')
hipparcos = read.table('HIPPARCOS.csv', header=T, sep=';')
cruzados = read.table('id_cruzados.csv', header=T, sep=',')
mallmerge = rbind(hipparcos[2:nrow(hipparcos),2:3], simbad[2:nrow(simbad),4:5])
asw <- numeric(20)
for (k in 2:20)
	 asw[k] <- pam(mallmerge, k) $ silinfo $ avg.width
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