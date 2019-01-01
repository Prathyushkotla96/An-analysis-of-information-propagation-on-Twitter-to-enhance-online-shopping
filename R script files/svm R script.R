library(readr)
library("e1071")

library(e1071)
set.seed(333)
set <- read_csv("C:/Users/PRATHYUSH/Desktop/dataset.csv")
x <- subset(set, select=-Label)
y <- subset(set, select=Label)

index <- 1:nrow(set)
testindex <- sample(index, trunc(length(index)*50/100))
train <- x[-testindex, ]
test <- x[testindex, ]

Model <-svm(Label~., data=set, gamma=1, cost=10)
prediction <- predict(Model, test)
summary(prediction)
prediction
