library(data.table)
library(rpart)
library(rpart.plot)
library(caret)
library(randomForest)
library(dplyr)
library(ggplot2)
library(caTools)
library(ROCR)

setwd("/Users/aimeechen/Desktop/Berkeley/capstone/capstone/")
training<-read.csv("walkingSmote.csv")

############## RF   #################
training$WalkingDisability<-factor(training$WalkingDisability)
set.seed(1)

train.ids = sample(nrow(training), 0.7*nrow(training))
rf_train = training[train.ids,]
rf_test = training[-train.ids,]

set.seed(1)
rfmodel <- train(WalkingDisability ~ .,
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
rocr.pred <- prediction(rf.predf, rf_test$WalkingDisability)
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
rf_x=table(rf.predf,rf_test$WalkingDisability)
rf_x
rf_error_rate = (rf_x[1,2]+rf_x[2,1])/dim(rf_test)[1]
rf_error_rate

