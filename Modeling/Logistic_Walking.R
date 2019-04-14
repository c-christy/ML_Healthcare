#install.packages("data.table")
library(data.table)
library(caret)
library(caTools)

setwd("/Users/aimeechen/Desktop/Berkeley/capstone/capstone/")
training<-read.csv("walkingSmote.csv")

##########
#install.packages("glmnet")
library(glmnet)
set.seed(1)
train.ids = sample(nrow(training), 0.7*nrow(training))
train = training[train.ids,]
test = training[-train.ids,]
train.kfoldx=model.matrix(WalkingDisability~., data=train)
train.kfoldy=train$WalkingDisability
test.kfoldx=model.matrix(WalkingDisability~.,data=test)
test.kfoldy=test$WalkingDisability
grid <- 10 ^ seq(4, -2, length = 100)
lasso.mod <- glmnet(train.kfoldx,train.kfoldy,family="binomial",alpha=1,lambda=grid)
cv.lasso <- cv.glmnet(train.kfoldx,train.kfoldy,family="binomial",nfolds = 10,alpha=1,lambda=grid,type.measure = "class")
bestlam.lasso <- cv.lasso$lambda.min
cv.lasso$lambda
lasso.coef=predict(lasso.mod,type="coefficients", s=bestlam.lasso)
lasso.coef
lasso.pred=predict(lasso.mod,s=bestlam.lasso, newx=test.kfoldx, type = "response")

rocr.pred <- prediction(lasso.pred, test$WalkingDisability)
performance <- performance(rocr.pred, "tpr", "fpr")
auc.perf = performance(rocr.pred, measure = "auc")
auc.perf@y.values
plot(performance, colorize = TRUE)
abline(0, 1)

#find optimal threshold
cost.perf = performance(rocr.pred, "cost")
rocr.pred@cutoffs[[1]][which.min(cost.perf@y.values[[1]])]
# different thresholds and corresponding accuracy
acc.perf = performance(rocr.pred, measure = "acc")
plot(acc.perf)
# plug in the optimal threshold into our table
x = table(test$WalkingDisability, lasso.pred > 0.5369512)
x
error.rate=(x[1,2]+x[2,1])/dim(test)[1]
error.rate
