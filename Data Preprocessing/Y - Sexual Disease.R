# data preprocessing for dependent variables in sexual disease in year 2013-2016

# first, clean year 2013-2014
setwd("/Users/apple/desktop/capstone/sex disease")
sex1314=read.csv("merge1314.csv", sep =";")
head(sex1314)
#==============================================================
# Tasks:
# 1. if 8 columns are all nas, then Y is na
# find the index of all 8 NAs
index_eig_nas <- which((is.na(sex1314$LBXHE1)) & (is.na(sex1314$LBXHE2)) & (is.na(sex1314$LBDHI)) & (is.na(sex1314$SXQ753)) & (is.na(sex1314$SXQ260)) & (is.na(sex1314$SXQ265)) & (is.na(sex1314$SXQ270)) & (is.na(sex1314$SXQ272)))

# form a new column, na for all 4 nas
new_column_Y <- sex1314$LBDHI
new_column_Y[index_eig_nas] <- "NA"

# add this new colum to original dataframe.
sex_y2 <- as.data.frame(cbind(sex1314, new_column_Y))

# check your new dataset
head(sex_y2)
summary(sex_y2)

#==============================================================
# 2. if 8 columns are all 2, then Y is 2
# find the index of all 8 2s
index_eig_2s <- which((sex1314$LBXHE1 == 2.0) & (sex1314$LBXHE2 == 2.0) & (sex1314$LBDHI == 2.0) & (sex1314$SXQ753 == 2.0) & (sex1314$SXQ260 == 2.0) & (sex1314$SXQ265 == 2.0) & (sex1314$SXQ270 == 2.0) & (sex1314$SXQ272 == 2.0))

# use the existing column
new_column_Y[index_eig_2s] <- 2
sex_y2 <- as.data.frame(cbind(sex1314, new_column_Y))

# check your new dataset
head(sex_y2)
summary(sex_y2)

#==============================================================
# 5. if LBXHE1 is 2 and other 7 columns are all nas, then Y is 2
index_LBXHE1_2 <-  which((is.na(sex1314$LBXHE2)) & (is.na(sex1314$LBDHI)) & (is.na(sex1314$SXQ753)) & (is.na(sex1314$SXQ260)) & (is.na(sex1314$SXQ265)) & (is.na(sex1314$SXQ270)) & (is.na(sex1314$SXQ272)) & (sex1314$LBXHE1 == 2.0))
new_column_Y[index_LBXHE1_2] <- 2
sex_y2 <- as.data.frame(cbind(sex1314, new_column_Y))
summary(sex_y2)

#==============================================================
# 6. if LBXHE2 is 2 and other 7 columns are all nas, then Y is 2
index_LBXHE2_2 <- which((is.na(sex1314$LBXHE1)) & (is.na(sex1314$LBXHE2)) & (is.na(sex1314$SXQ753)) & (is.na(sex1314$SXQ260)) & (is.na(sex1314$SXQ265)) & (is.na(sex1314$SXQ270)) & (is.na(sex1314$SXQ272)) & (sex1314$LBDHI == 2.0))
new_column_Y[index_LBXHE2_2] <- 2
sex_y2 <- as.data.frame(cbind(sex1314, new_column_Y))
summary(sex_y2)

#==============================================================
# 7. if LBDHI is 2 and other 7 columns are all nas, then Y is 2
index_LBDHI_2 <- which((is.na(sex1314$LBXHE1)) & (is.na(sex1314$LBDHI)) & (is.na(sex1314$SXQ753)) & (is.na(sex1314$SXQ260)) & (is.na(sex1314$SXQ265)) & (is.na(sex1314$SXQ270)) & (is.na(sex1314$SXQ272)) & (sex1314$LBXHE2 == 2.0))
new_column_Y[index_LBDHI_2] <- 2
sex_y2 <- as.data.frame(cbind(sex1314, new_column_Y))
summary(sex_y2)

#==============================================================
# 7. if first two columns are 2s and other 6 columns are all nas, then Y is 2
index_two_2 <- which((is.na(sex1314$LBDHI)) & (is.na(sex1314$SXQ753)) & (is.na(sex1314$SXQ260)) & (is.na(sex1314$SXQ265)) & (is.na(sex1314$SXQ270)) & (is.na(sex1314$SXQ272)) & (sex1314$LBXHE2 == 2.0) & (sex1314$LBXHE1 == 2.0))
new_column_Y[index_two_2] <- 2
sex_y2 <- as.data.frame(cbind(sex1314, new_column_Y))
summary(sex_y2)

#==============================================================
# 7. if SXQ272 is 2 and other 7 columns are all nas, then Y is 2
index_SXQ272_2 <- which((is.na(sex1314$LBXHE1)) & (is.na(sex1314$LBDHI)) & (is.na(sex1314$SXQ753)) & (is.na(sex1314$SXQ260)) & (is.na(sex1314$SXQ265)) & (is.na(sex1314$SXQ270)) & (is.na(sex1314$LBXHE2)) & (sex1314$SXQ272 == 2.0))
new_column_Y[index_SXQ272_2] <- 2
sex_y2 <- as.data.frame(cbind(sex1314, new_column_Y))
summary(sex_y2)

#==============================================================
# 8. if first three columns are nas and other 5 columns are all 2s, then Y is 2
index_five_2 <- which((is.na(sex1314$LBXHE1)) & (is.na(sex1314$LBXHE2)) & (is.na(sex1314$LBDHI)) & (sex1314$SXQ753 == 2.0) & (sex1314$SXQ260 == 2.0) & (sex1314$SXQ265 == 2.0) & (sex1314$SXQ270 == 2.0) & (sex1314$SXQ272 == 2.0))
new_column_Y[index_five_2] <- 2
sex_y2 <- as.data.frame(cbind(sex1314, new_column_Y))
summary(sex_y2)

#==============================================================
# 9. if SXQ753 is na and other 7 columns are all 2s, then Y is 2
index_SXQ753_na <- which((sex1314$LBXHE1 == 2.0) & (sex1314$LBXHE2 == 2.0) & (sex1314$LBDHI == 2.0) & (is.na(sex1314$SXQ753)) & (sex1314$SXQ260 == 2.0) & (sex1314$SXQ265 == 2.0) & (sex1314$SXQ270 == 2.0) & (sex1314$SXQ272 == 2.0))
new_column_Y[index_SXQ753_na] <- 2
sex_y2 <- as.data.frame(cbind(sex1314, new_column_Y))
summary(sex_y2)

#==============================================================
# 10. if first four columns are nas and last 4 columns are all 2s, then Y is 2
index_four_2 <- which((is.na(sex1314$LBXHE1)) & (is.na(sex1314$LBXHE2)) & (is.na(sex1314$LBDHI)) & (is.na(sex1314$SXQ753)) & (sex1314$SXQ260 == 2.0) & (sex1314$SXQ265 == 2.0) & (sex1314$SXQ270 == 2.0) & (sex1314$SXQ272 == 2.0))
new_column_Y[index_four_2] <- 2
sex_y2 <- as.data.frame(cbind(sex1314, new_column_Y))
summary(sex_y2)

#==============================================================
# 10. if first three columns are nas and 4 columns are all 2s, then Y is 2
index_three_na <- which((is.na(sex1314$LBXHE1)) & (is.na(sex1314$LBXHE2)) & (is.na(sex1314$LBDHI)) & (sex1314$SXQ753 == 2.0) & (sex1314$SXQ260 == 2.0) & (sex1314$SXQ265 == 2.0) & (sex1314$SXQ270 == 2.0) & (is.na(sex1314$SXQ272)))
new_column_Y[index_three_na] <- 2
sex_y2 <- as.data.frame(cbind(sex1314, new_column_Y))
summary(sex_y2)

#==============================================================
# 10. if first four columns are nas and 3 columns are all 2s, then Y is 2
index_four_na <- which((is.na(sex1314$LBXHE1)) & (is.na(sex1314$LBXHE2)) & (is.na(sex1314$LBDHI)) & (is.na(sex1314$SXQ753)) & (sex1314$SXQ260 == 2.0) & (sex1314$SXQ265 == 2.0) & (sex1314$SXQ270 == 2.0) & (is.na(sex1314$SXQ272)))
new_column_Y[index_four_na] <- 2
sex_y2 <- as.data.frame(cbind(sex1314, new_column_Y))
summary(sex_y2)

#==============================================================
# 11. if first 2 columns are 2s, LBDHI is 3 and other columns are nas, then Y is 2
index_spe_1 <- which((is.na(sex1314$SXQ753)) & (is.na(sex1314$SXQ260)) & (is.na(sex1314$SXQ265)) & (is.na(sex1314$SXQ270)) & (is.na(sex1314$SXQ272)) & (sex1314$LBDHI == 3.0) & (sex1314$LBXHE1 == 2.0) & (sex1314$LBXHE2 == 2.0))
new_column_Y[index_spe_1] <- 2
sex_y2 <- as.data.frame(cbind(sex1314, new_column_Y))
summary(sex_y2)

#==============================================================
# 12. if first four columns are nas, SXQ272 is 7 and other 3 columns are 2, then Y is 2
index_spe_2 <- which((is.na(sex1314$LBXHE1)) & (is.na(sex1314$LBXHE2)) & (is.na(sex1314$LBDHI)) & (is.na(sex1314$SXQ753)) & (sex1314$SXQ260 == 2.0) & (sex1314$SXQ265 == 2.0) & (sex1314$SXQ270 == 2.0) & (sex1314$SXQ272 == 7.0))
new_column_Y[index_spe_2] <- 2
sex_y2 <- as.data.frame(cbind(sex1314, new_column_Y))
summary(sex_y2)

#==============================================================
# 3. have 1, Y is 1
index_one_1 <- which((sex1314$LBXHE1 == 1.0))
index_two_1 <- which((sex1314$LBXHE2 == 1.0))
index_three_1 <- which((sex1314$LBDHI == 1.0))
index_four_1 <- which((sex1314$SXQ753 == 1.0))
index_five_1 <- which((sex1314$SXQ260 == 1.0))
index_six_1 <- which((sex1314$SXQ265 == 1.0))
index_sev_1 <- which((sex1314$SXQ270 == 1.0))
index_eig_1 <- which((sex1314$SXQ272 == 1.0))
new_column_Y[index_one_1] <- 1
new_column_Y[index_two_1] <- 1
new_column_Y[index_three_1] <- 1
new_column_Y[index_four_1] <- 1
new_column_Y[index_five_1] <- 1
new_column_Y[index_six_1] <- 1
new_column_Y[index_sev_1] <- 1
new_column_Y[index_eig_1] <- 1
sex_y2 <- as.data.frame(cbind(sex1314, new_column_Y))
head(sex_y2)
summary(sex_y2)

# save this clean dataset which include result y and nas. 
write.csv(sex_y2, file="/Users/apple/desktop/capstone/sex disease/sex_yna_13-14.csv")






# second, clean year 2015-2016
setwd("/Users/apple/desktop/capstone/sex disease")
sex1516=read.csv("merge1516.csv", sep =";")
head(sex1516)
#==============================================================
# Tasks:
# 1. if 8 columns are all nas, then Y is na
# find the index of all 8 NAs
index_eig_nas <- which((is.na(sex1516$LBXHE1)) & (is.na(sex1516$LBXHE2)) & (is.na(sex1516$LBXHIVC)) & (is.na(sex1516$SXQ753)) & (is.na(sex1516$SXQ260)) & (is.na(sex1516$SXQ265)) & (is.na(sex1516$SXQ270)) & (is.na(sex1516$SXQ272)))

# form a new column, na for all 4 nas
new_column_Y <- sex1516$LBXHIVC
new_column_Y[index_eig_nas] <- "NA"

# add this new colum to original dataframe.
sex_y3 <- as.data.frame(cbind(sex1516, new_column_Y))

# check your new dataset
head(sex_y3)
summary(sex_y3)

#==============================================================
# 2. if 8 columns are all 2, then Y is 2
# find the index of all 8 2s
index_eig_2s <- which((sex1516$LBXHE1 == 2.0) & (sex1516$LBXHE2 == 2.0) & (sex1516$LBXHIVC == 2.0) & (sex1516$SXQ753 == 2.0) & (sex1516$SXQ260 == 2.0) & (sex1516$SXQ265 == 2.0) & (sex1516$SXQ270 == 2.0) & (sex1516$SXQ272 == 2.0))

# use the existing column
new_column_Y[index_eig_2s] <- 2
sex_y3 <- as.data.frame(cbind(sex1516, new_column_Y))

# check your new dataset
head(sex_y3)
summary(sex_y3)

#==============================================================
# 5. if LBXHE1 is 2 and other 7 columns are all nas, then Y is 2
index_LBXHE1_2 <-  which((is.na(sex1516$LBXHE2)) & (is.na(sex1516$LBXHIVC)) & (is.na(sex1516$SXQ753)) & (is.na(sex1516$SXQ260)) & (is.na(sex1516$SXQ265)) & (is.na(sex1516$SXQ270)) & (is.na(sex1516$SXQ272)) & (sex1516$LBXHE1 == 2.0))
new_column_Y[index_LBXHE1_2] <- 2
sex_y3 <- as.data.frame(cbind(sex1516, new_column_Y))
summary(sex_y3)

#==============================================================
# 6. if LBXHE2 is 2 and other 7 columns are all nas, then Y is 2
index_LBXHE2_2 <- which((is.na(sex1516$LBXHE1)) & (is.na(sex1516$LBXHE2)) & (is.na(sex1516$SXQ753)) & (is.na(sex1516$SXQ260)) & (is.na(sex1516$SXQ265)) & (is.na(sex1516$SXQ270)) & (is.na(sex1516$SXQ272)) & (sex1516$LBXHIVC == 2.0))
new_column_Y[index_LBXHE2_2] <- 2
sex_y3 <- as.data.frame(cbind(sex1516, new_column_Y))
summary(sex_y3)

#==============================================================
# 7. if LBXHIVC is 2 and other 7 columns are all nas, then Y is 2
index_LBDHI_2 <- which((is.na(sex1516$LBXHE1)) & (is.na(sex1516$LBXHIVC)) & (is.na(sex1516$SXQ753)) & (is.na(sex1516$SXQ260)) & (is.na(sex1516$SXQ265)) & (is.na(sex1516$SXQ270)) & (is.na(sex1516$SXQ272)) & (sex1516$LBXHE2 == 2.0))
new_column_Y[index_LBDHI_2] <- 2
sex_y3 <- as.data.frame(cbind(sex1516, new_column_Y))
summary(sex_y3)

#==============================================================
# 7. if first two columns are 2s and other 6 columns are all nas, then Y is 2
index_two_2 <- which((is.na(sex1516$LBXHIVC)) & (is.na(sex1516$SXQ753)) & (is.na(sex1516$SXQ260)) & (is.na(sex1516$SXQ265)) & (is.na(sex1516$SXQ270)) & (is.na(sex1516$SXQ272)) & (sex1516$LBXHE2 == 2.0) & (sex1516$LBXHE1 == 2.0))
new_column_Y[index_two_2] <- 2
sex_y3 <- as.data.frame(cbind(sex1516, new_column_Y))
summary(sex_y3)

#==============================================================
# 7. if SXQ272 is 2 and other 7 columns are all nas, then Y is 2
index_SXQ272_2 <- which((is.na(sex1516$LBXHE1)) & (is.na(sex1516$LBXHIVC)) & (is.na(sex1516$SXQ753)) & (is.na(sex1516$SXQ260)) & (is.na(sex1516$SXQ265)) & (is.na(sex1516$SXQ270)) & (is.na(sex1516$LBXHE2)) & (sex1516$SXQ272 == 2.0))
new_column_Y[index_SXQ272_2] <- 2
sex_y3 <- as.data.frame(cbind(sex1516, new_column_Y))
summary(sex_y3)

#==============================================================
# 8. if first three columns are nas and other 5 columns are all 2s, then Y is 2
index_five_2 <- which((is.na(sex1516$LBXHE1)) & (is.na(sex1516$LBXHE2)) & (is.na(sex1516$LBXHIVC)) & (sex1516$SXQ753 == 2.0) & (sex1516$SXQ260 == 2.0) & (sex1516$SXQ265 == 2.0) & (sex1516$SXQ270 == 2.0) & (sex1516$SXQ272 == 2.0))
new_column_Y[index_five_2] <- 2
sex_y3 <- as.data.frame(cbind(sex1516, new_column_Y))
summary(sex_y3)

#==============================================================
# 9. if SXQ753 is na and other 7 columns are all 2s, then Y is 2
index_SXQ753_na <- which((sex1516$LBXHE1 == 2.0) & (sex1516$LBXHE2 == 2.0) & (sex1516$LBXHIVC == 2.0) & (is.na(sex1516$SXQ753)) & (sex1516$SXQ260 == 2.0) & (sex1516$SXQ265 == 2.0) & (sex1516$SXQ270 == 2.0) & (sex1516$SXQ272 == 2.0))
new_column_Y[index_SXQ753_na] <- 2
sex_y3 <- as.data.frame(cbind(sex1516, new_column_Y))
summary(sex_y3)

#==============================================================
# 10. if first four columns are nas and last 4 columns are all 2s, then Y is 2
index_four_2 <- which((is.na(sex1516$LBXHE1)) & (is.na(sex1516$LBXHE2)) & (is.na(sex1516$LBXHIVC)) & (is.na(sex1516$SXQ753)) & (sex1516$SXQ260 == 2.0) & (sex1516$SXQ265 == 2.0) & (sex1516$SXQ270 == 2.0) & (sex1516$SXQ272 == 2.0))
new_column_Y[index_four_2] <- 2
sex_y3 <- as.data.frame(cbind(sex1516, new_column_Y))
summary(sex_y3)

#==============================================================
# 10. if first three columns are nas and 4 columns are all 2s, then Y is 2
index_three_na <- which((is.na(sex1516$LBXHE1)) & (is.na(sex1516$LBXHE2)) & (is.na(sex1516$LBXHIVC)) & (sex1516$SXQ753 == 2.0) & (sex1516$SXQ260 == 2.0) & (sex1516$SXQ265 == 2.0) & (sex1516$SXQ270 == 2.0) & (is.na(sex1516$SXQ272)))
new_column_Y[index_three_na] <- 2
sex_y3 <- as.data.frame(cbind(sex1516, new_column_Y))
summary(sex_y3)

#==============================================================
# 10. if first four columns are nas and 3 columns are all 2s, then Y is 2
index_four_na <- which((is.na(sex1516$LBXHE1)) & (is.na(sex1516$LBXHE2)) & (is.na(sex1516$LBXHIVC)) & (is.na(sex1516$SXQ753)) & (sex1516$SXQ260 == 2.0) & (sex1516$SXQ265 == 2.0) & (sex1516$SXQ270 == 2.0) & (is.na(sex1516$SXQ272)))
new_column_Y[index_four_na] <- 2
sex_y3 <- as.data.frame(cbind(sex1516, new_column_Y))
summary(sex_y3)

#==============================================================
# 5. if LBXHE1 is 3 and other 7 columns are all nas, then Y is 2
index_spe_1 <-  which((is.na(sex1516$LBXHE2)) & (is.na(sex1516$LBXHIVC)) & (is.na(sex1516$SXQ753)) & (is.na(sex1516$SXQ260)) & (is.na(sex1516$SXQ265)) & (is.na(sex1516$SXQ270)) & (is.na(sex1516$SXQ272)) & (sex1516$LBXHE1 == 3.0))
new_column_Y[index_spe_1] <- 2
sex_y3 <- as.data.frame(cbind(sex1516, new_column_Y))
summary(sex_y3)

#==============================================================
# 12. if first three columns are nas, SXQ272 is 7, SXQ270 SXQ260 are 9s, then Y is 2
index_spe_2 <- which((is.na(sex1516$LBXHE1)) & (is.na(sex1516$LBXHE2)) & (is.na(sex1516$LBXHIVC)) & (sex1516$SXQ753 == 2.0) & (sex1516$SXQ260 == 9.0) & (sex1516$SXQ265 == 2.0) & (sex1516$SXQ270 == 9.0) & (sex1516$SXQ272 == 7.0))
new_column_Y[index_spe_2] <- 2
sex_y3 <- as.data.frame(cbind(sex1516, new_column_Y))
summary(sex_y3)

#==============================================================
# 3. have 1, Y is 1
index_one_1 <- which((sex1516$LBXHE1 == 1.0))
index_two_1 <- which((sex1516$LBXHE2 == 1.0))
index_three_1 <- which((sex1516$LBXHIVC == 1.0))
index_four_1 <- which((sex1516$SXQ753 == 1.0))
index_five_1 <- which((sex1516$SXQ260 == 1.0))
index_six_1 <- which((sex1516$SXQ265 == 1.0))
index_sev_1 <- which((sex1516$SXQ270 == 1.0))
index_eig_1 <- which((sex1516$SXQ272 == 1.0))
new_column_Y[index_one_1] <- 1
new_column_Y[index_two_1] <- 1
new_column_Y[index_three_1] <- 1
new_column_Y[index_four_1] <- 1
new_column_Y[index_five_1] <- 1
new_column_Y[index_six_1] <- 1
new_column_Y[index_sev_1] <- 1
new_column_Y[index_eig_1] <- 1
sex_y3 <- as.data.frame(cbind(sex1516, new_column_Y))
head(sex_y3)
summary(sex_y3)

# save this clean dataset which include result y and nas. 
write.csv(sex_y3, file="/Users/apple/desktop/capstone/sex disease/sex_yna_15-16.csv")








