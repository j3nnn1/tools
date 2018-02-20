#!/usr/local/bin/R
library("tm")
library("wordcloud")
library("RColorBrewer") 

#%txt =  DirSource('/media/misperoles/git/tools/twitter/data')
txt <- readLines(file.choose());

#tweets.corpus = Corpus(txt)
tweets.corpus = Corpus(VectorSource(txt))
tweets.corpus <-  tm_map(tweets.corpus, removePunctuation)
tweets.corpus <-  tm_map(tweets.corpus, tolower)
tweets.corpus <-  tm_map(tweets.corpus, function(x) removeWords(x, stopwords("spanish")))
tweets.corpus <-  tm_map(tweets.corpus, function(x) removeWords(x, stopwords("english")))
#tweets.corpus <-  tm_map(tweets.corpus, function(x) removeWords(x, c(stopwords("english"), "oca", "integral", "andreani", "ocaintegral", "chazki","urbano", "chazky", "chazy", "jaula", "interior", "int", "amba" , "solo", "multiint", "carriers", "multiamba", "null")))
tdm <-  TermDocumentMatrix(tweets.corpus)
m <-  as.matrix(tdm)
v <-  sort(rowSums(m),decreasing=TRUE)
d <-  data.frame(word = names(v),freq=v)
pal2 <- brewer.pal(5,"Dark2")
png("wordcloudTwitter.png", width=1280,height=800)
wordcloud(d$word,d$freq, scale=c(6,.2),min.freq=5,max.words=Inf, random.order=FALSE, rot.per=.15, colors=pal2, ordered.colors=T, vfont=c("sans serif","plain"))
dev.off()
