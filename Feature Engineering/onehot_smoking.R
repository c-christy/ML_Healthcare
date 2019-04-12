setwd("/Users/Christy/Desktop/Capstone/Rcodes")
smoke <- read.csv("smoke.csv")

head(smoke)

smoke$SMQ020 <- as.factor(smoke$SMQ020)
smoke$SMQ040 <- as.factor(smoke$SMQ040)
smoke$SMQ621 <- as.factor(smoke$SMQ621)
smoke$SMQ670 <- as.factor(smoke$SMQ670)
smoke$SMAQUEX2 <- as.factor(smoke$SMAQUEX2)


str(smoke)

library(caret)
dmy <- dummyVars(" ~ .", data = smoke)
trsf <- data.frame(predict(dmy, newdata = smoke))
trsf

write.csv(trsf, file = "smoke.csv")
