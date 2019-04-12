setwd("/Users/apple/desktop/capstone/gender")
gender <- read.csv("gender_withoutonehot.csv", sep = ';')

head(gender)

gender$RIAGENDR <- as.factor(gender$RIAGENDR)
str(gender)

library(caret)
dmy <- dummyVars(" ~ .", data = gender)
trsf <- data.frame(predict(dmy, newdata = gender))
str(trsf)

write.csv(trsf, file="/Users/apple/desktop/capstone/gender/gender.csv")
