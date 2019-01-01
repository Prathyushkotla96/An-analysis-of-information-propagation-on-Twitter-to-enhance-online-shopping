# data collection
library(dplyr)
library(twitteR)
library(knitr)
library(ggplot2)
library(igraph)
library(readr)
library(e1071)
set.seed(333)
api_key <- "Jt5YgTw4ILoiXpFam1ondaFiM"
api_secret <- "jOkcZddCZRvH8foShg4dy5cMYaydzSyHxHjSF2AQqBTMlZBXBw"
token <- "1057924366917402624-4TVa87VYaJUhzUyMcbSagqPgj8LmHk"
token_secret <- "vaQimKRe2Zp8iNMFjhbAZjjS6vtDl4ac4afrIOxsnlJme"
setup_twitter_oauth(consumer_key = api_key,
                    consumer_secret = api_secret,
                    access_token = token,
                    access_secret = token_secret)
tweets <- searchTwitter('@Walmart', n=500)
tweetsDF <- twListToDF(tweets)
write.csv(tweetsDF,'tweetsdata.csv')
# selecting retweets
df2 <- subset(tweetsDF, select = c(8, 12))
# caluculate centrality 
el <- as.matrix(df2)
el[,2] <- as.character(el[,2])
g <- graph.data.frame(el, directed=FALSE)
plot(g, edge.arrow.size=.5)
betweennessG <- betweenness(g)
betweennessG
centrality<-centr_degree(g)
centrality
centralityG<-as.data.frame(centrality)
c.d   <- degree(g)
c.d
c.d.g<-as.data.frame(c.d)
# applying svm to the dataset
x3 <-tdata[1:39,1:2]
final_centrality<-as.data.frame(x3)
x <- subset(x3, select=-V2)
index <- 1:nrow(x3)

testindex <- sample(index, trunc(length(index)*50/100))
train <- x[-testindex, ]
test <- x[testindex, ]
Model <-svm(V2~., data=x3, gamma=1, cost=10)
prediction <- predict(Model, test)
prediction
summary(prediction)
x4<-as.data.frame(prediction)
