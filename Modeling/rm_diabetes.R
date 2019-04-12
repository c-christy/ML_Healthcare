library(randomForest)
library(data.table)
library(ROCR)
library(rpart)
library(rpart.plot)
library(caret)
library(caTools)
library(dplyr)
library(ggplot2)

setwd("/Users/Christy/Desktop/Capstone/Rcodes")
training<-read.csv("diabetes_y_new.csv")

############## RF with cross validation  #################
training$LBXGLU<-factor(training$LBXGLU)

set.seed(1)
train.ids = sample(nrow(training), 0.7*nrow(training))
rf_train = training[train.ids,]
rf_test = training[-train.ids,]

set.seed(1)
rfmodel <- train(LBXGLU ~ .,
                 data = rf_train,
                 method = "rf",
                 tuneGrid = data.frame(mtry=1:16),
                 trControl = trainControl(method="cv", number=5, verboseIter = TRUE),
                 metric = "Accuracy")
rfmodel$results
rfmodel
best.rfmodel <- rfmodel$finalModel
rf.pred <- predict(best.rfmodel,newdata = rf_test, type = "class")
summary(rf.pred)
rf.predf=ifelse(rf.pred==1,1,0)

############## AUC ################
rocr.pred <- prediction(rf.predf, rf_test$LBXGLU)
performance <- performance(rocr.pred, "tpr", "fpr")
auc.perf = performance(rocr.pred, measure = "auc")
auc.perf@y.values
plot(performance, colorize = TRUE)
abline(0, 1)

############### features #################################
importance(best.rfmodel)
print(best.rfmodel)
varImpPlot (best.rfmodel)

################## error rate ########################
rfx=table(rf.pred,rf_test$LBXGLU)
rfx
rf_error_rate = (rfx[1,2]+rfx[2,1])/dim(rf_test)[1]
rf_error_rate

