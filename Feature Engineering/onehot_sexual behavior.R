setwd("/Users/apple/desktop/capstone/sexual behavior")
sex <- read.csv("sex behavior_withoutonehot.csv", sep = ';')

head(sex)

sex$SXD021 <- as.factor(sex$SXD021)
sex$SXQ800 <- as.factor(sex$SXQ800)
sex$SXQ803 <- as.factor(sex$SXQ803)
sex$SXQ806 <- as.factor(sex$SXQ806)
sex$SXQ809 <- as.factor(sex$SXQ809)
sex$SXQ645 <- as.factor(sex$SXQ645)
sex$SXQ610 <- as.factor(sex$SXQ610)
sex$SXQ251 <- as.factor(sex$SXQ251)

str(sex)

library(caret)
dmy <- dummyVars(" ~ .", data = sex)
trsf <- data.frame(predict(dmy, newdata = sex))
trsf
write.csv(trsf, file="/Users/apple/desktop/capstone/sexual behavior/sex behavior.csv")
