setwd("/Users/apple/desktop/capstone/x13-16")
training <- read.csv("heart_withsmote.csv", sep = ';') 
prop.table(table(training$heart_y))

############## Logistic Regression #################
library(data.table)
library(glmnet)
set.seed(1)
test = sample(1:dim(training)[1],dim(training)[1]/3.33)
train=(-test)
train=training[train,]
test=training[test,]

train.kfoldx=model.matrix(heart_y~., data=train)
train.kfoldy=train$heart_y
test.kfoldx=model.matrix(heart_y~.,data=test)
test.kfoldy=test$heart_y
grid <- 10 ^ seq(4, -2, length = 100)
lasso.mod <- glmnet(train.kfoldx,train.kfoldy,family="binomial",alpha=1,lambda=grid)
cv.lasso <- cv.glmnet(train.kfoldx,train.kfoldy,family="binomial",nfolds = 10,alpha=1,lambda=grid,type.measure = "class")
bestlam.lasso <- cv.lasso$lambda.min
cv.lasso$lambda
lasso.coef=predict(lasso.mod,type="coefficients", s=bestlam.lasso)
lasso.coef

lasso.pred=predict(lasso.mod,s=bestlam.lasso, newx=test.kfoldx, type = "response")

############## AUC ################
library(ROCR)
rocr.log.pred <- prediction(lasso.pred, test$heart_y)
logPerformance <- performance(rocr.log.pred, "tpr", "fpr")
plot(logPerformance, colorize = TRUE)
abline(0, 1)

# find optimal threshold
cost.perf = performance(rocr.log.pred, "cost")
rocr.log.pred@cutoffs[[1]][which.min(cost.perf@y.values[[1]])]
# different thresholds and corresponding accuracy
acc.perf = performance(rocr.log.pred, measure = "acc")
plot(acc.perf)
# plug in the optimal threshold into our table
x = table(test$heart_y, lasso.pred > 0.5535963)
x
error.rate=(x[1,2]+x[2,1])/dim(test)[1]
error.rate
