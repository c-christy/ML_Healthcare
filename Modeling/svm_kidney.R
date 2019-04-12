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

setwd("/Users/Christy/Desktop/Capstone/Rcodes")
training<-read.csv("kidney_y_new.csv")

############## Gradient Boosting with cross validation #################
training$KIQ022<-factor(training$KIQ022)

set.seed(1)
train.ids = sample(nrow(training), 0.7*nrow(training))
train.svm = training[train.ids,]
test.svm = training[-train.ids,]

set.seed(1)
train.svm <- train(KIQ022 ~ .,
                   data = train.svm,
                   method = "svmPoly",
                   tuneGrid = expand.grid(.degree=(2:5), .scale=.1, .C=c(0.01,0.1,1,3,5,10,20)), 
                   trControl = trainControl(method="cv", number=5, verboseIter = TRUE),
                   metric = "Accuracy")
train.svm
pred.best.svm <- predict(train.svm, newdata = test.svm)
summary(pred.best.svm)
pred=ifelse(pred.best.svm==1,1,0)

############## AUC ################
rocr.pred <- prediction(pred, test.svm$KIQ022)
performance <- performance(rocr.pred, "tpr", "fpr")
auc.perf = performance(rocr.pred, measure = "auc")
auc.perf@y.values
plot(performance, colorize = TRUE)
abline(0, 1)

################## error rate ########################
b.x=table(test.svm$KIQ022, pred.best.svm)
b.x
rf_error_rate = (b.x[1,2]+b.x[2,1])/dim(test.svm)[1]
rf_error_rate
