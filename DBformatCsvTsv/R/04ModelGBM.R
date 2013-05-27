library('caret')
library("ipred")
library("gbm")
library("survival")
library("splines")

df.creditos  = read.table('smote_training.csv', sep=',', header=T);

#2 parametro de entrada para crear un modelos que admita cross validation con caret
fitControl <- trainControl(method = "repeatedcv",
			number = 5,
			repeats = 2,
			returnResamp = "all")

#3 dataframe con solo los atributos. Este dataframe NO tiene la clase.
tmp <- subset(df.creditos, select = 1:(ncol(df.creditos) -3))

gbmFit <- train (tmp, 
		as.factor(df.creditos$clase),
		method = "gbm",
		trControl= fitControl,
		verbose=FALSE)

save.image('01ModelCreditos_5BIN3repeat.RData');

write.csv(gbmFit$results, 'resultadosGBM_smote_training.csv')

#write.csv(as.data.frame(as.matrix(confusionMatrix(gbmFit))), 'matrizconfusionGBM.csv')

