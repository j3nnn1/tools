library("caret")
df.creditos = read.table('creditos.csv', sep=',', header=T);

#2 verificando atributos que tienen varianza cercana a 0
cerovalores = nearZeroVar(df.creditos, freqCut = 95/5, uniqueCut = 10, saveMetrics = TRUE)

#3 Devuelve los indices de las columnas que tienen varianza cercana a 0
cerovaloresquitar = nearZeroVar(df.creditos)

#4 obtengo las columnas que tienen varianza cercana a 0, solo para observar que atributos son.
quitar = cerovalores[cerovalores$nzv==TRUE,]

#5 diccionario nuevo contiene un dataframe sin los atributos que tienen varianza cercana a 0
df.creditos.clean = df.creditos[, -c(cerovaloresquitar)]
df.creditos.clean$ganancia = df.creditos$ganancia
df.creditos.clean$canarito = df.creditos$canarito
df.creditos.clean$training = df.creditos$training
df.creditos.clean$clase = df.creditos$clase

#6 guardar data frame final que sera evaluado por 3 metodos.
write.csv(df.creditos.clean, 'creditosForSPSS_clean.csv');
write.csv(quitar, 'creditos_quitados.csv');

