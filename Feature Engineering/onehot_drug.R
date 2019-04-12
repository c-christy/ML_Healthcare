setwd("/Users/Christy/Desktop/Capstone/Rcodes")
drug <- read.csv("drug.csv")

drug$DUQ200 <- as.factor(drug$DUQ200)
drug$DUQ211 <- as.factor(drug$DUQ211)
drug$DUQ217 <- as.factor(drug$DUQ217)
drug$DUQ240 <- as.factor(drug$DUQ240)
drug$DUQ250 <- as.factor(drug$DUQ250)
drug$DUQ290 <- as.factor(drug$DUQ290)
drug$DUQ330 <- as.factor(drug$DUQ330)
drug$DUQ420 <- as.factor(drug$DUQ420)
drug$DUQ430 <- as.factor(drug$DUQ430)


str(drug)

library(caret)
dmy <- dummyVars(" ~ .", data = drug)
trsf2 <- data.frame(predict(dmy, newdata = drug))
trsf2
write.csv(trsf2, file = "drug.csv")
