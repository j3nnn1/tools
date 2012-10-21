library('cluster')

hipparcos = read.table('hipparcoshyades.csv', header=T, sep=';')
cruzados = read.table('id_cruzados.csv', header=T, sep=',')
asw <- numeric(20)
cluspam <- list()

mallmerge = data.frame(RA=hipparcos$RA_J2000,DE=hipparcos$DE_J2000, PLX=hipparcos$Plx, PMRA=hipparcos$pmRA, PMDE=hipparcos$pmDE, VMAG=hipparcos$Vmag, BV=hipparcos$BV, HYADES=hipparcos$hyades)

for (k in 2:20) {
	 cluspam[[k]] <- pam(mallmerge[,-8], k) 
	 asw[k] <- cluspam[[k]]$silinfo$avg.width 
	 print (k)
}
k.best <- which.max(asw)
cat("silhouette-optimal number of clusters:", k.best, "\n")
plot(1:20, asw, type= "h", main = "pam() clustering assessment",
     xlab= "k  (# clusters)", ylab = "average silhouette width")
axis(1, k.best, paste("best",k.best,sep="\n"), col = "red", col.axis = "red")
name = 'cluster'
ext = '.png'
for (k in 2:20) {
	title = paste0(name, k)
	title = paste0(title, ext)
	png(title)
	plot(mallmerge, col=cluspam[[k]]$clustering, pch="+")
	points(cluspam[[k]]$medoids,col = 1:k, pch=8, cex=5)
	grid(col = "lightgray", lty = "dotted", equilogs = TRUE)
	abline(h=0, v=0, untf = FALSE, lty = "dotted")
	dev.off()
}

### scatter plot matrix
pairs(~RA+DE+PLX+PMRA+PMDE+VMAG+BV+HYADES,data=mallmerge,
   main="Matriz de Gráficos de Dispersión")


