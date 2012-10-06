#!R /usr/bin/R
#graficando resultados
join = read.table('newcandidatetohyades2.csv', header=T, sep=',')
plot(join$RA_HIPPARCOSJ2000, join$DE_HIPPARCOSJ2000, pch='*', col='green')
title(main = 'Estrellas simbad cruzadas con hipparcos')
points(join$RA_SIMBADJ2001, join$DE_SIMBADJ2001, col='blue', pch='O')
grid(col = "lightgray", lty = "dotted", equilogs = TRUE)
legend(5.5,15,c('* hipparcos','O simbad'), col=c("green", "blue"), plot=TRUE, pch="-", lty=0)
