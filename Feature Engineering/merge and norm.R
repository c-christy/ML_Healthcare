# 1. merge all the independent variables together
setwd("/Users/apple/desktop/capstone/x13-16")

age=read.csv("age.csv", sep =";")
gender=read.csv("gender.csv", sep =";")
sex=read.csv("sex behavior.csv", sep =";")
diet=read.csv("diet.csv", sep =",")
smoke=read.csv("smoke.csv", sep =";")
drug=read.csv("drug.csv", sep =";")
physical=read.csv("physical activity.csv", sep =",")
sleep=read.csv("sleep.csv", sep =";")

# Merge all the variables
a <- merge(age, gender, by = "SEQN", all = TRUE)
b <- merge(a, sex, by = "SEQN", all = TRUE)
c <- merge(b, diet, by = "SEQN", all = TRUE)
d <- merge(c, smoke, by = "SEQN", all = TRUE)
e <- merge(d, drug, by = "SEQN", all = TRUE)
f <- merge(e, physical, by = "SEQN", all = TRUE)
g <- merge(f, sleep, by = "SEQN", all = TRUE)
write.csv(g, file="/Users/apple/desktop/capstone/x13-16/x-1316.csv")

# Drop rows if any nas exist
library(tidyr)
x1316=read.csv("x-1316.csv", sep =";")
x <- drop_na(x1316)
write.csv(x, file="/Users/apple/desktop/capstone/x13-16/x1316.csv")

# Normalize all the continuous variables
normFunc <- function(x){(x-mean(x, na.rm = T))/sd(x, na.rm = T)}
df <- apply(x[c(2,24,26:31,108:111,139,144:148,160,165,169,177,182,186,193,206,219,
                225,226,232,233,238,239,244,245,250,251,252,295,337,338)], 2, normFunc)
dd <- as.data.frame(df)
write.csv(dd, file="/Users/apple/desktop/capstone/x13-16/new.csv")

# Find all categorical variable, stored in dataframe called category
category=x[,-c(2,24,26:31,108:111,139,144:148,160,165,169,177,182,186,193,206,219,
      225,226,232,233,238,239,244,245,250,251,252,295,337,338)]

# Add sequence to dd, and read it in R (called new)
new=read.csv("new.csv", sep =";")
perfect <- merge(category, new, by = "SEQN", all = TRUE)
write.csv(perfect, file="/Users/apple/desktop/capstone/x13-16/perfect_x.csv")


# 3. all dependent variables back to the perfect_x dataset, respectively
# Merge all the x with sex disease
perfect_x=read.csv("perfect_x.csv", sep =";")
sex_disease=read.csv("sex disease.csv", sep =";")
h <- merge(sex_disease, perfect_x, by = "SEQN", all = TRUE)

# Merge all the x with heart disease
heart_disease=read.csv("heart disease.csv", sep =";")
i <- merge(heart_disease, perfect_x, by = "SEQN", all = TRUE)

# Drop rows if any nas exist
library(tidyr)
xx <- drop_na(h)  # sexual disease
yy <- drop_na(i)  # heart disease
write.csv(yy, file="/Users/apple/desktop/capstone/x13-16/heart_withoutsmote.csv")

# use smote to deal with imbalanced data on sexual disease
table(xx$sex_y)  # the result shows: 0.52:0.48, so no need to smote
write.csv(xx, file="/Users/apple/desktop/capstone/x13-16/sex_noneedsmote.csv")

# use smote to deal with imbalanced data on heart disease
# we choose to use smotenc function in python, so no need to use the code below
table(yy$heart_y)  #the result shows: 7773:432, so must smote
library(DMwR)
yy$heart_y <- as.factor(yy$heart_y)
yy <- SMOTE(heart_y ~ ., yy, perc.over = 900, perc.under=100) 
yy$heart_y <- as.numeric(yy$heart_y)
prop.table(table(yy$heart_y)) # now it becomea: 0.473:0.526 (3889:4320)
                              # here 1 is 0 and 2 is 1
write.csv(yy, file="/Users/apple/desktop/capstone/x13-16/heart_withsmote.csv")


