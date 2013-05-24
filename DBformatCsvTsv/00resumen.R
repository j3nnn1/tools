#filter class, and future data

si = cred[cred[,171]=='SI',]
no = cred[cred[,171]=='FUTURO',]
futuro = cred[cred[,171]=='NO',]

summary(si[,20:30])
summary(no[,20:30])
summary(futuro[,20:30])
