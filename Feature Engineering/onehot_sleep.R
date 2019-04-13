setwd("/Users/Christy/Desktop/Capstone/Rcodes")
sleep <- read.csv("sleep.csv")

head(sleep)

sleep$SLQ050 <- as.factor(sleep$SLQ050)

str(sleep)

library(caret)
dmy <- dummyVars(" ~ .", data = sleep)
trsf <- data.frame(predict(dmy, newdata = sleep))
trsf

write.csv(trsf, file = "sleep.csv")
