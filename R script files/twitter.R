
library(dplyr)
library(twitteR)
library(knitr)
library(ggplot2)
api_key <- "Jt5YgTw4ILoiXpFam1ondaFiM"
api_secret <- "jOkcZddCZRvH8foShg4dy5cMYaydzSyHxHjSF2AQqBTMlZBXBw"
token <- "1057924366917402624-4TVa87VYaJUhzUyMcbSagqPgj8LmHk"
token_secret <- "vaQimKRe2Zp8iNMFjhbAZjjS6vtDl4ac4afrIOxsnlJme"
setup_twitter_oauth(consumer_key = api_key,
                    consumer_secret = api_secret,
                    access_token = token,
                    access_secret = token_secret)
tweets_sanders <- searchTwitter('@Walmart', n=200)
tweets <- searchTwitter('@Walmart', n=150)
tweet<-tweets_sanders
tweetsDF <- twListToDF(tweet)
