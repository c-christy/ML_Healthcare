library(gbm)
library(data.table)
library(ROCR)
library(rpart)
library(rpart.plot)
library(caret)
library(caTools)
library(dplyr)
library(ggplot2)
library(kernlab)
library(e1071)

setwd("/Users/aimeechen/Desktop/Berkeley/capstone/capstone/")
training <-read.csv("HepatitisSmote.csv")

############## Gradient Boosting with cross validation #################
training$Hepatitis<-factor(training$Hepatitis)

set.seed(1)
train.ids = sample(nrow(training), 0.7*nrow(training))
train.svm = training[train.ids,]
test.svm = training[-train.ids,]

set.seed(1)
train.svm <- train(Hepatitis ~ .,
                     data = train.svm,
                     method = "svmPoly",
                     tuneGrid = expand.grid(.degree=(2:5), .scale=.1, .C=c(0.01,0.1,1,3,5,10,20)), 
                     trControl = trainControl(method="cv", number=5, verboseIter = TRUE),
                     metric = "Accuracy")
train.svm
best.svm <- train.svm$finalModel
pred.best.svm <- predict(best.svm, newdata = test.svm[-1])
summary(pred.best.svm)
pred=ifelse(pred.best.svm==1,1,0)

############## AUC ################
rocr.pred <- prediction(pred, test.svm$Hepatitis)
performance <- performance(rocr.pred, "tpr", "fpr")
auc.perf = performance(rocr.pred, measure = "auc")
auc.perf@y.values
plot(performance, colorize = TRUE)
abline(0, 1)

################## error rate ########################
b.x=table(test.svm$Hepatitis, pred.best.svm)
b.x
rf_error_rate = (b.x[1,2]+b.x[2,1])/dim(test.svm)[1]
rf_error_rate

