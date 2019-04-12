# data preprocessing for dependent variables in heart disease in year 2013-2016

# first, clean year 2013-2014
setwd("/Users/apple/desktop/capstone/heart")
heart1314=read.csv("heart13-14.csv", sep =";")

#==============================================================
# Tasks:
# 1. if 4 columns are all nas, then Y is na
# find the index of all 4 NAs
index_four_nas <- which((is.na(heart1314$MCQ160B)) & (is.na(heart1314$MCQ160C)) & (is.na(heart1314$MCQ160D)) & (is.na(heart1314$MCQ160E)))

# form a new column, na for all 4 nas
new_column_Y <- heart1314$MCQ160B
new_column_Y[index_four_nas] <- "NA"

# add this new colum to original dataframe.
heart_y2 <- as.data.frame(cbind(heart1314, new_column_Y))

# check your new dataset
head(heart_y2)
summary(heart_y2)

#==============================================================
# 2. if 4 columns are all 2, then Y is 2
# find the index of all 4 2s
index_four_2s <- which((heart1314$MCQ160B == 2.0) & (heart1314$MCQ160C == 2.0) & (heart1314$MCQ160D == 2.0) & (heart1314$MCQ160E == 2.0))

# use the existing column
new_column_Y[index_four_2s] <- 2
heart_y2 <- as.data.frame(cbind(heart1314, new_column_Y))

# check your new dataset
head(heart_y2)
summary(heart_y2)

#==============================================================
# 3. if 4 columns are all 7s, then Y is 7
index_four_7s <- which((heart1314$MCQ160B == 7.0) & (heart1314$MCQ160C == 7.0) & (heart1314$MCQ160D == 7.0) & (heart1314$MCQ160E == 7.0))
new_column_Y[index_four_7s] <- 7
heart_y2 <- as.data.frame(cbind(heart1314, new_column_Y))
summary(heart_y2)

#==============================================================
# 4. if 4 columns are all 9s, then Y is 9
index_four_9s <- which((heart1314$MCQ160B == 9.0) & (heart1314$MCQ160C == 9.0) & (heart1314$MCQ160D == 9.0) & (heart1314$MCQ160E == 9.0))
new_column_Y[index_four_9s] <- 9
heart_y2 <- as.data.frame(cbind(heart1314, new_column_Y))
summary(heart_y2)

#==============================================================
# 5. if MCQ160B is na and other 3 columns are all 2s, then Y is 2
index_three2_b <- which((heart1314$MCQ160C == 2.0) & (heart1314$MCQ160D == 2.0) & (heart1314$MCQ160E == 2.0) & (is.na(heart1314$MCQ160B)))
new_column_Y[index_three2_b] <- 2
heart_y2 <- as.data.frame(cbind(heart1314, new_column_Y))
summary(heart_y2)

#==============================================================
# 6. if MCQ160C is na and other 3 columns are all 2s, then Y is 2
index_three2_c <- which((heart1314$MCQ160B == 2.0) & (heart1314$MCQ160D == 2.0) & (heart1314$MCQ160E == 2.0) & (is.na(heart1314$MCQ160C)))
new_column_Y[index_three2_c] <- 2
heart_y2 <- as.data.frame(cbind(heart1314, new_column_Y))
summary(heart_y2)

#==============================================================
# 7. if MCQ160D is na and other 3 columns are all 2s, then Y is 2
index_three2_d <- which((heart1314$MCQ160B == 2.0) & (heart1314$MCQ160C == 2.0) & (heart1314$MCQ160E == 2.0) & (is.na(heart1314$MCQ160D)))
new_column_Y[index_three2_d] <- 2
heart_y2 <- as.data.frame(cbind(heart1314, new_column_Y))
summary(heart_y2)

#==============================================================
# 8. if MCQ160E is na and other 3 columns are all 2s, then Y is 2
index_three2_e <- which((heart1314$MCQ160B == 2.0) & (heart1314$MCQ160C == 2.0) & (heart1314$MCQ160D == 2.0) & (is.na(heart1314$MCQ160E)))
new_column_Y[index_three2_e] <- 2
heart_y2 <- as.data.frame(cbind(heart1314, new_column_Y))
summary(heart_y2)

#==============================================================
# 9. if MCQ160B is 7or9 and other 3 columns are all 2s, then Y is 2
index_7_b <- which((heart1314$MCQ160B == 7.0 || 9.0) & (heart1314$MCQ160C == 2.0) & (heart1314$MCQ160D == 2.0) & (heart1314$MCQ160E == 2.0))
new_column_Y[index_7_b] <- 2
heart_y2 <- as.data.frame(cbind(heart1314, new_column_Y))
summary(heart_y2)

#==============================================================
# 10. if MCQ160C is 7or9 and other 3 columns are all 2s, then Y is 2
index_7_c <- which((heart1314$MCQ160C == 7.0 || 9.0) & (heart1314$MCQ160B == 2.0) & (heart1314$MCQ160D == 2.0) & (heart1314$MCQ160E == 2.0))
new_column_Y[index_7_c] <- 2
heart_y2 <- as.data.frame(cbind(heart1314, new_column_Y))
summary(heart_y2)

#==============================================================
# 10. if MCQ160D is 7or9 and other 3 columns are all 2s, then Y is 2
index_7_d <- which((heart1314$MCQ160D == 7.0 || 9.0) & (heart1314$MCQ160B == 2.0) & (heart1314$MCQ160C == 2.0) & (heart1314$MCQ160E == 2.0))
new_column_Y[index_7_d] <- 2
heart_y2 <- as.data.frame(cbind(heart1314, new_column_Y))
summary(heart_y2)

#==============================================================
# 10. if MCQ160E is 7or9 and other 3 columns are all 2s, then Y is 2
index_7_e <- which((heart1314$MCQ160E == 7.0 || 9.0) & (heart1314$MCQ160B == 2.0) & (heart1314$MCQ160C == 2.0) & (heart1314$MCQ160D == 2.0))
new_column_Y[index_7_e] <- 2
heart_y2 <- as.data.frame(cbind(heart1314, new_column_Y))
summary(heart_y2)

#==============================================================
# 10. if MCQ160B, MCQ160C and MCQ160D is 9 and last column is 2, then Y is 2
index_special <- which((heart1314$MCQ160B == 9.0) & (heart1314$MCQ160D == 9.0) & (heart1314$MCQ160C == 9.0) & (heart1314$MCQ160E == 2.0))
new_column_Y[index_special] <- 2
heart_y2 <- as.data.frame(cbind(heart1314, new_column_Y))
summary(heart_y2)

#==============================================================
# 10. if MCQ160B and MCQ160C is 9 and other 2 columns are all 2s, then Y is 2
index_special <- which((heart1314$MCQ160B == 9.0) & (heart1314$MCQ160C == 9.0) & (heart1314$MCQ160D == 2.0) & (heart1314$MCQ160E == 2.0))
new_column_Y[index_special] <- 2
heart_y2 <- as.data.frame(cbind(heart1314, new_column_Y))
summary(heart_y2)

#==============================================================
# 3. have 1, Y is 1
index_one_1 <- which((heart1314$MCQ160B == 1.0))
index_two_1 <- which((heart1314$MCQ160C == 1.0))
index_three_1 <- which((heart1314$MCQ160D == 1.0))
index_four_1 <- which((heart1314$MCQ160E == 1.0))
new_column_Y[index_one_1] <- 1
new_column_Y[index_two_1] <- 1
new_column_Y[index_three_1] <- 1
new_column_Y[index_four_1] <- 1
heart_y2 <- as.data.frame(cbind(heart1314, new_column_Y))
head(heart_y2)
summary(heart_y2)

# save this clean dataset which include result y and nas. 
write.csv(heart_y2, file="/Users/apple/desktop/capstone/heart/heart_yna_13-14.csv")





# second, clean year 2015-2016
setwd("/Users/apple/desktop/capstone/heart")
heart1516=read.csv("heart15-16.csv", sep =";")

#==============================================================
# Tasks:
# 1. if 4 columns are all nas, then Y is na
# find the index of all 4 NAs
index_four_nas <- which((is.na(heart1516$MCQ160B)) & (is.na(heart1516$MCQ160C)) & (is.na(heart1516$MCQ160D)) & (is.na(heart1516$MCQ160E)))

# form a new column, na for all 4 nas
new_column_Y <- heart1516$MCQ160B
new_column_Y[index_four_nas] <- "NA"

# add this new colum to original dataframe.
heart_y3 <- as.data.frame(cbind(heart1516, new_column_Y))

# check your new dataset
head(heart_y3)
summary(heart_y3)

#==============================================================
# 2. if 4 columns are all 2, then Y is 2
# find the index of all 4 2s
index_four_2s <- which((heart1516$MCQ160B == 2.0) & (heart1516$MCQ160C == 2.0) & (heart1516$MCQ160D == 2.0) & (heart1516$MCQ160E == 2.0))

# use the existing column
new_column_Y[index_four_2s] <- 2
heart_y3 <- as.data.frame(cbind(heart1516, new_column_Y))

# check your new dataset
head(heart_y3)
summary(heart_y3)

#==============================================================
# 3. if 4 columns are all 7s, then Y is 7
index_four_7s <- which((heart1516$MCQ160B == 7.0) & (heart1516$MCQ160C == 7.0) & (heart1516$MCQ160D == 7.0) & (heart1516$MCQ160E == 7.0))
new_column_Y[index_four_7s] <- 7
heart_y3 <- as.data.frame(cbind(heart1516, new_column_Y))
summary(heart_y3)

#==============================================================
# 4. if 4 columns are all 9s, then Y is 9
index_four_9s <- which((heart1516$MCQ160B == 9.0) & (heart1516$MCQ160C == 9.0) & (heart1516$MCQ160D == 9.0) & (heart1516$MCQ160E == 9.0))
new_column_Y[index_four_9s] <- 9
heart_y3 <- as.data.frame(cbind(heart1516, new_column_Y))
summary(heart_y3)

#==============================================================
# 5. if MCQ160B is na and other 3 columns are all 2s, then Y is 2
index_three2_b <- which((heart1516$MCQ160C == 2.0) & (heart1516$MCQ160D == 2.0) & (heart1516$MCQ160E == 2.0) & (is.na(heart1516$MCQ160B)))
new_column_Y[index_three2_b] <- 2
heart_y3 <- as.data.frame(cbind(heart1516, new_column_Y))
summary(heart_y3)

#==============================================================
# 6. if MCQ160C is na and other 3 columns are all 2s, then Y is 2
index_three2_c <- which((heart1516$MCQ160B == 2.0) & (heart1516$MCQ160D == 2.0) & (heart1516$MCQ160E == 2.0) & (is.na(heart1516$MCQ160C)))
new_column_Y[index_three2_c] <- 2
heart_y3 <- as.data.frame(cbind(heart1516, new_column_Y))
summary(heart_y3)

#==============================================================
# 7. if MCQ160D is na and other 3 columns are all 2s, then Y is 2
index_three2_d <- which((heart1516$MCQ160B == 2.0) & (heart1516$MCQ160C == 2.0) & (heart1516$MCQ160E == 2.0) & (is.na(heart1516$MCQ160D)))
new_column_Y[index_three2_d] <- 2
heart_y3 <- as.data.frame(cbind(heart1516, new_column_Y))
summary(heart_y3)

#==============================================================
# 8. if MCQ160E is na and other 3 columns are all 2s, then Y is 2
index_three2_e <- which((heart1516$MCQ160B == 2.0) & (heart1516$MCQ160C == 2.0) & (heart1516$MCQ160D == 2.0) & (is.na(heart1516$MCQ160E)))
new_column_Y[index_three2_e] <- 2
heart_y3 <- as.data.frame(cbind(heart1516, new_column_Y))
summary(heart_y3)

#==============================================================
# 9. if MCQ160B is 7or9 and other 3 columns are all 2s, then Y is 2
index_7_b <- which((heart1516$MCQ160B == 7.0 || 9.0) & (heart1516$MCQ160C == 2.0) & (heart1516$MCQ160D == 2.0) & (heart1516$MCQ160E == 2.0))
new_column_Y[index_7_b] <- 2
heart_y3 <- as.data.frame(cbind(heart1516, new_column_Y))
summary(heart_y3)

#==============================================================
# 10. if MCQ160C is 7or9 and other 3 columns are all 2s, then Y is 2
index_7_c <- which((heart1516$MCQ160C == 7.0 || 9.0) & (heart1516$MCQ160B == 2.0) & (heart1516$MCQ160D == 2.0) & (heart1516$MCQ160E == 2.0))
new_column_Y[index_7_c] <- 2
heart_y3 <- as.data.frame(cbind(heart1516, new_column_Y))
summary(heart_y3)

#==============================================================
# 10. if MCQ160D is 7or9 and other 3 columns are all 2s, then Y is 2
index_7_d <- which((heart1516$MCQ160D == 7.0 || 9.0) & (heart1516$MCQ160B == 2.0) & (heart1516$MCQ160C == 2.0) & (heart1516$MCQ160E == 2.0))
new_column_Y[index_7_d] <- 2
heart_y3 <- as.data.frame(cbind(heart1516, new_column_Y))
summary(heart_y3)

#==============================================================
# 10. if MCQ160E is 7or9 and other 3 columns are all 2s, then Y is 2
index_7_e <- which((heart1516$MCQ160E == 7.0 || 9.0) & (heart1516$MCQ160B == 2.0) & (heart1516$MCQ160C == 2.0) & (heart1516$MCQ160D == 2.0))
new_column_Y[index_7_e] <- 2
heart_y3 <- as.data.frame(cbind(heart1516, new_column_Y))
summary(heart_y3)

#==============================================================
# 10. if MCQ160B, MCQ160C and MCQ160D is 9 and last column is 2, then Y is 2
index_special <- which((heart1516$MCQ160B == 9.0) & (heart1516$MCQ160D == 9.0) & (heart1516$MCQ160C == 9.0) & (heart1516$MCQ160E == 2.0))
new_column_Y[index_special] <- 2
heart_y3 <- as.data.frame(cbind(heart1516, new_column_Y))
summary(heart_y3)

#==============================================================
# 3. have 1, Y is 1
index_one_1 <- which((heart1516$MCQ160B == 1.0))
index_two_1 <- which((heart1516$MCQ160C == 1.0))
index_three_1 <- which((heart1516$MCQ160D == 1.0))
index_four_1 <- which((heart1516$MCQ160E == 1.0))
new_column_Y[index_one_1] <- 1
new_column_Y[index_two_1] <- 1
new_column_Y[index_three_1] <- 1
new_column_Y[index_four_1] <- 1
heart_y3 <- as.data.frame(cbind(heart1516, new_column_Y))
head(heart_y3)
summary(heart_y3)

# save this clean dataset which include result y and nas. 
write.csv(heart_y3, file="/Users/apple/desktop/capstone/heart/heart_yna_15-16.csv")

#=========
# END









