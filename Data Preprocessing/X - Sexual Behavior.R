# data preprocessing for independent variables in sexual disease in year 2013-2016

# first, clean year 2013-2014
setwd("/Users/apple/desktop/capstone/sexual behavior")
sex1314=read.csv("sex13-14.csv", sep =";")

#==============================================================
# Tasks:
# 1. find all the NAs in column for each column in this dataset. (store the indexes)
colnames(sex1314)
summary(sex1314)

real_my_data2 <- sex1314[1:4521,]
summary(real_my_data2)

#======================
# 2. create a new column for each column that contain NAs.
# 3. new column: 0 for non-missing value from original column,
#                1 for missing value from original column. 
#               0 for value of 777777/99999. 
# 4. original column: 0 for NAs. 
#                     0 for extreme values also. 

#==========================================
# columns with NAs AND 7777/9999:
# SXD171, SXQ624, SXQ636, SXQ824

# ========   SXD171  ================
# get the index from original column.
index_99999_SXD171 <- which(real_my_data2$SXD171 == 99999.0)
index_77777_SXD171 <- which(real_my_data2$SXD171 == 77777.0)
index_NAs_SXD171 <- which(is.na(real_my_data2$SXD171))
index_Non_NAs_SXD171 <- which(!is.na(real_my_data2$SXD171))

# form a new column, 1 for NA, 0 for rest.
new_column_SXD171 <- real_my_data2$SXD171
new_column_SXD171[index_NAs_SXD171] <- 1
new_column_SXD171[index_Non_NAs_SXD171] <- 0

# check the number of NA in new column
length(which(new_column_SXD171 == 1))
# 2
length(index_NAs_SXD171)
# 2

# add this new colum to original dataframe.
my_clean_data2 <- as.data.frame(cbind(real_my_data2, new_column_SXD171))
# change the column name for this new column 
colnames(my_clean_data2)[24] <- "IfSXD171ismiss"
# check your new dataset, this new column is the last column, with new colname.
head(my_clean_data2)

# change the NAs and 77777/9999 in the original column. 
my_clean_data2$SXD171[index_NAs_SXD171] <- 0
my_clean_data2$SXD171[index_77777_SXD171] <- 0
my_clean_data2$SXD171[index_99999_SXD171] <- 0

summary(my_clean_data2)

# ========   SXQ624  ================
# get the index from original column.
index_99999_SXQ624 <- which(real_my_data2$SXQ624 == 99999.0)
index_77777_SXQ624 <- which(real_my_data2$SXQ624 == 77777.0)
index_NAs_SXQ624 <- which(is.na(real_my_data2$SXQ624))
index_Non_NAs_SXQ624 <- which(!is.na(real_my_data2$SXQ624))

# form a new column, 1 for NA, 0 for rest.
new_column_SXQ624 <- real_my_data2$SXQ624
new_column_SXQ624[index_NAs_SXQ624] <- 1
new_column_SXQ624[index_Non_NAs_SXQ624] <- 0

# check the number of NA in new column
length(which(new_column_SXQ624 == 1))
# 2939
length(index_NAs_SXQ624)
# 2939

# add this new colum to original dataframe.
my_clean_data2 <- as.data.frame(cbind(my_clean_data2, new_column_SXQ624))
# change the column name for this new column 
colnames(my_clean_data2)[25] <- "IfSXQ624ismiss"
# check your new dataset, this new column is the last column, with new colname.
head(my_clean_data2)

# change the NAs and 77777/9999 in the original column. 
my_clean_data2$SXQ624[index_NAs_SXQ624] <- 0
my_clean_data2$SXQ624[index_77777_SXQ624] <- 0
my_clean_data2$SXQ624[index_99999_SXQ624] <- 0

summary(my_clean_data2)

#===========   SXQ636    ============================
# get the index from original column.

index_99999_SXQ636 <- which(real_my_data2$SXQ636 == 99999.0)
index_77777_SXQ636 <- which(real_my_data2$SXQ636 == 77777.0)
index_NAs_SXQ636 <- which(is.na(real_my_data2$SXQ636))
index_Non_NAs_SXQ636 <- which(!is.na(real_my_data2$SXQ636))

# form a new column, 1 for NA, 0 for rest.
new_column_SXQ636 <- real_my_data2$SXQ636
new_column_SXQ636[index_NAs_SXQ636] <- 1
new_column_SXQ636[index_Non_NAs_SXQ636] <- 0

# check the number of NA in new column
length(which(new_column_SXQ636 == 1))
# [1] 2933
length(index_NAs_SXQ636)
# [1] 2933

# add this new colum to original dataframe.
my_clean_data2 <- as.data.frame(cbind(my_clean_data2, new_column_SXQ636))
# change the column name for this new column 
colnames(my_clean_data2)[26] <- "IfSXQ636ismiss"
# check your new dataset, this new column is the last column, with new colname.
head(my_clean_data2)

# change the NAs and 77777/9999 in the original column. 
my_clean_data2$SXQ636[index_NAs_SXQ636] <- 0
my_clean_data2$SXQ636[index_77777_SXQ636] <- 0
my_clean_data2$SXQ636[index_99999_SXQ636] <- 0

summary(my_clean_data2)

#============ SXQ824 ================================
# get the index from original column.
index_99999_SXQ824 <- which(real_my_data2$SXQ824 == 99999.0)
index_77777_SXQ824 <- which(real_my_data2$SXQ824 == 77777.0)
index_NAs_SXQ824 <- which(is.na(real_my_data2$SXQ824))
index_Non_NAs_SXQ824 <- which(!is.na(real_my_data2$SXQ824))

# form a new column, 1 for NA, 0 for rest.
new_column_SXQ824 <- real_my_data2$SXQ824
new_column_SXQ824[index_NAs_SXQ824] <- 1
new_column_SXQ824[index_Non_NAs_SXQ824] <- 0

# check the number of NA in new column
length(which(new_column_SXQ824 == 1))
length(index_NAs_SXQ824)


# add this new colum to original dataframe.
my_clean_data2 <- as.data.frame(cbind(my_clean_data2, new_column_SXQ824))
# change the column name for this new column 
colnames(my_clean_data2)[27] <- "IfSXQ824ismiss"
# check your new dataset, this new column is the last column, with new colname.
head(my_clean_data2)

# change the NAs and 77777/9999 in the original column. 
my_clean_data2$SXQ824[index_NAs_SXQ824] <- 0
my_clean_data2$SXQ824[index_77777_SXQ824] <- 0
my_clean_data2$SXQ824[index_99999_SXQ824] <- 0

summary(my_clean_data2)

#==========================================
# columns with NAs AND 77/99:
# SXQ610, 
# get the index from original column.

index_99999_SXQ610 <- which(real_my_data2$SXQ610 == 99.0)
index_77777_SXQ610 <- which(real_my_data2$SXQ610 == 77.0)
index_NAs_SXQ610 <- which(is.na(real_my_data2$SXQ610))
index_Non_NAs_SXQ610 <- which(!is.na(real_my_data2$SXQ610))

# form a new column, 1 for NA, 0 for rest.
new_column_SXQ610 <- real_my_data2$SXQ610
new_column_SXQ610[index_NAs_SXQ610] <- 1
new_column_SXQ610[index_Non_NAs_SXQ610] <- 0

# check the number of NA in new column
length(which(new_column_SXQ610 == 1))
# [1] 1500
length(index_NAs_SXQ610)
# [1] 1500

# add this new colum to original dataframe.
my_clean_data2 <- as.data.frame(cbind(my_clean_data2, new_column_SXQ610))
# change the column name for this new column 
colnames(my_clean_data2)[28] <- "IfSXQ610ismiss"
# check your new dataset, this new column is the last column, with new colname.
head(my_clean_data2)

# change the NAs and 77777/9999 in the original column. 
my_clean_data2$SXQ610[index_NAs_SXQ610] <- 0
my_clean_data2$SXQ610[index_77777_SXQ610] <- 0
my_clean_data2$SXQ610[index_99999_SXQ610] <- 0

summary(my_clean_data2)
#============
# SXD621, 
index_99999_SXD621 <- which(real_my_data2$SXD621 == 99.0)
index_77777_SXD621 <- which(real_my_data2$SXD621 == 77.0)
index_NAs_SXD621 <- which(is.na(real_my_data2$SXD621))
index_Non_NAs_SXD621 <- which(!is.na(real_my_data2$SXD621))

# form a new column, 1 for NA, 0 for rest.
new_column_SXD621 <- real_my_data2$SXD621
new_column_SXD621[index_NAs_SXD621] <- 1
new_column_SXD621[index_Non_NAs_SXD621] <- 0

# check the number of NA in new column
length(which(new_column_SXD621 == 1))
# [1] 2757
length(index_NAs_SXD621)
# [1] 2757

# add this new colum to original dataframe.
my_clean_data2 <- as.data.frame(cbind(my_clean_data2, new_column_SXD621))
# change the column name for this new column 
colnames(my_clean_data2)[29] <- "IfSXD621ismiss"
# check your new dataset, this new column is the last column, with new colname.
head(my_clean_data2)

# change the NAs and 77777/9999 in the original column. 
my_clean_data2$SXD621[index_NAs_SXD621] <- 0
my_clean_data2$SXD621[index_77777_SXD621] <- 0
my_clean_data2$SXD621[index_99999_SXD621] <- 0

summary(my_clean_data2)

#============
# SXD633

index_99999_SXD633 <- which(real_my_data2$SXD633 == 99.0)
index_77777_SXD633 <- which(real_my_data2$SXD633 == 77.0)
index_NAs_SXD633 <- which(is.na(real_my_data2$SXD633))
index_Non_NAs_SXD633 <- which(!is.na(real_my_data2$SXD633))

# form a new column, 1 for NA, 0 for rest.
new_column_SXD633 <- real_my_data2$SXD633
new_column_SXD633[index_NAs_SXD633] <- 1
new_column_SXD633[index_Non_NAs_SXD633] <- 0

# check the number of NA in new column
length(which(new_column_SXD633 == 1))
# [1] 2644
length(index_NAs_SXD633)
# [1] 2644

# add this new colum to original dataframe.
my_clean_data2 <- as.data.frame(cbind(my_clean_data2, new_column_SXD633))
# change the column name for this new column 
colnames(my_clean_data2)[30] <- "IfSXD633ismiss"
# check your new dataset, this new column is the last column, with new colname.
head(my_clean_data2)

# change the NAs and 77777/9999 in the original column. 
my_clean_data2$SXD633[index_NAs_SXD633] <- 0
my_clean_data2$SXD633[index_77777_SXD633] <- 0
my_clean_data2$SXD633[index_99999_SXD633] <- 0

summary(my_clean_data2)

#==========================================
# delete this column: SXQ280
part1_clean_data <- my_clean_data2[1:(which(colnames(my_clean_data2)== "SXQ280")-1)]
part2_clean_data <- my_clean_data2[(which(colnames(my_clean_data2)== "SXQ280")+1):length(colnames(my_clean_data2))]
my_clean_data2 <- as.data.frame(cbind(part1_clean_data, part2_clean_data))
summary(my_clean_data2)

#==========================================
# columns with NAs AND 7/9:
# SXQ251
# 7／9 keeps in their original value. 
# NAs change to 10. 

index_NAs_SXQ251 <- which(is.na(real_my_data2$SXQ251))
my_clean_data2$SXQ251[index_NAs_SXQ251] <- 10

summary(my_clean_data2)

#==========================================
# SXQ645
# change 7 and 9 to 5

index_NAs_SXQ645 <- which(is.na(real_my_data2$SXQ645))
my_clean_data2$SXQ645[index_NAs_SXQ645] <- 10

index_7_SXQ645 <- which(real_my_data2$SXQ645 == 7.0)
my_clean_data2$SXQ645[index_7_SXQ645] <- 5
index_9_SXQ645 <- which(real_my_data2$SXQ645 == 9.0)
my_clean_data2$SXQ645[index_9_SXQ645] <- 5

summary(my_clean_data2)

#=======================

# save this clean dataset which include x AND y. 
write.csv(my_clean_data2, file="/Users/apple/desktop/capstone/sexual behavior/clean_xy_13-14.csv")

# number of missing value for all 5 diseases:
length(which(is.na(my_clean_data2$SXQ753))) # 2728
length(which(is.na(my_clean_data2$SXQ260))) #1049
length(which(is.na(my_clean_data2$SXQ265))) #1049
length(which(is.na(my_clean_data2$SXQ270)))#1049
length(which(is.na(my_clean_data2$SXQ272))) #1392

test <- intersect(which(is.na(my_clean_data2$SXQ272)),intersect(which(is.na(my_clean_data2$SXQ270)),intersect(which(is.na(my_clean_data2$SXQ265)),intersect(which(is.na(my_clean_data2$SXQ753)), which(is.na(my_clean_data2$SXQ260))))))






# second, clean year 2015-2016
setwd("/Users/apple/desktop/capstone/sexual behavior")
sex1516=read.csv("sex15-16.csv", sep =";")

#==============================================================
# Tasks:
# 1. find all the NAs in column for each column in this dataset. (store the indexes)
colnames(sex1516)
summary(sex1516)

real_my_data3 <- sex1516[1:4247,]
summary(real_my_data3)

#======================
# 2. create a new column for each column that contain NAs.
# 3. new column: 0 for non-missing value from original column,
#                1 for missing value from original column. 
#               0 for value of 777777/99999. 
# 4. original column: 0 for NAs. 
#                     0 for extreme values also. 

#==========================================
# columns with NAs AND 7777/9999:
# SXD171, SXQ624, SXQ636, SXQ824

# ========   SXD171  ================
# get the index from original column.
index_99999_SXD171 <- which(real_my_data3$SXD171 == 99999.0)
index_77777_SXD171 <- which(real_my_data3$SXD171 == 77777.0)
index_NAs_SXD171 <- which(is.na(real_my_data3$SXD171))
index_Non_NAs_SXD171 <- which(!is.na(real_my_data3$SXD171))

# form a new column, 1 for NA, 0 for rest.
new_column_SXD171 <- real_my_data3$SXD171
new_column_SXD171[index_NAs_SXD171] <- 1
new_column_SXD171[index_Non_NAs_SXD171] <- 0

# check the number of NA in new column
length(which(new_column_SXD171 == 1))
# 4
length(index_NAs_SXD171)
# 4

# add this new colum to original dataframe.
my_clean_data3 <- as.data.frame(cbind(real_my_data3, new_column_SXD171))
# change the column name for this new column 
colnames(my_clean_data3)[24] <- "IfSXD171ismiss"
# check your new dataset, this new column is the last column, with new colname.
head(my_clean_data3)

# change the NAs and 77777/9999 in the original column. 
my_clean_data3$SXD171[index_NAs_SXD171] <- 0
my_clean_data3$SXD171[index_77777_SXD171] <- 0
my_clean_data3$SXD171[index_99999_SXD171] <- 0

summary(my_clean_data3)

# ========   SXQ624  ================
# get the index from original column.
index_99999_SXQ624 <- which(real_my_data3$SXQ624 == 99999.0)
index_77777_SXQ624 <- which(real_my_data3$SXQ624 == 77777.0)
index_NAs_SXQ624 <- which(is.na(real_my_data3$SXQ624))
index_Non_NAs_SXQ624 <- which(!is.na(real_my_data3$SXQ624))

# form a new column, 1 for NA, 0 for rest.
new_column_SXQ624 <- real_my_data3$SXQ624
new_column_SXQ624[index_NAs_SXQ624] <- 1
new_column_SXQ624[index_Non_NAs_SXQ624] <- 0

# check the number of NA in new column
length(which(new_column_SXQ624 == 1))
# 2939
length(index_NAs_SXQ624)
# 2939

# add this new colum to original dataframe.
my_clean_data3 <- as.data.frame(cbind(my_clean_data3, new_column_SXQ624))
# change the column name for this new column 
colnames(my_clean_data3)[25] <- "IfSXQ624ismiss"
# check your new dataset, this new column is the last column, with new colname.
head(my_clean_data3)

# change the NAs and 77777/9999 in the original column. 
my_clean_data3$SXQ624[index_NAs_SXQ624] <- 0
my_clean_data3$SXQ624[index_77777_SXQ624] <- 0
my_clean_data3$SXQ624[index_99999_SXQ624] <- 0

summary(my_clean_data3)

#===========   SXQ636    ============================
# get the index from original column.

index_99999_SXQ636 <- which(real_my_data3$SXQ636 == 99999.0)
index_77777_SXQ636 <- which(real_my_data3$SXQ636 == 77777.0)
index_NAs_SXQ636 <- which(is.na(real_my_data3$SXQ636))
index_Non_NAs_SXQ636 <- which(!is.na(real_my_data3$SXQ636))

# form a new column, 1 for NA, 0 for rest.
new_column_SXQ636 <- real_my_data3$SXQ636
new_column_SXQ636[index_NAs_SXQ636] <- 1
new_column_SXQ636[index_Non_NAs_SXQ636] <- 0

# check the number of NA in new column
length(which(new_column_SXQ636 == 1))
# [1] 2933
length(index_NAs_SXQ636)
# [1] 2933

# add this new colum to original dataframe.
my_clean_data3 <- as.data.frame(cbind(my_clean_data3, new_column_SXQ636))
# change the column name for this new column 
colnames(my_clean_data3)[26] <- "IfSXQ636ismiss"
# check your new dataset, this new column is the last column, with new colname.
head(my_clean_data3)

# change the NAs and 77777/9999 in the original column. 
my_clean_data3$SXQ636[index_NAs_SXQ636] <- 0
my_clean_data3$SXQ636[index_77777_SXQ636] <- 0
my_clean_data3$SXQ636[index_99999_SXQ636] <- 0

summary(my_clean_data3)

#============ SXQ824 ================================
# get the index from original column.
index_99999_SXQ824 <- which(real_my_data3$SXQ824 == 99999.0)
index_77777_SXQ824 <- which(real_my_data3$SXQ824 == 77777.0)
index_NAs_SXQ824 <- which(is.na(real_my_data3$SXQ824))
index_Non_NAs_SXQ824 <- which(!is.na(real_my_data3$SXQ824))

# form a new column, 1 for NA, 0 for rest.
new_column_SXQ824 <- real_my_data3$SXQ824
new_column_SXQ824[index_NAs_SXQ824] <- 1
new_column_SXQ824[index_Non_NAs_SXQ824] <- 0

# check the number of NA in new column
length(which(new_column_SXQ824 == 1))
length(index_NAs_SXQ824)


# add this new colum to original dataframe.
my_clean_data3 <- as.data.frame(cbind(my_clean_data3, new_column_SXQ824))
# change the column name for this new column 
colnames(my_clean_data3)[27] <- "IfSXQ824ismiss"
# check your new dataset, this new column is the last column, with new colname.
head(my_clean_data3)

# change the NAs and 77777/9999 in the original column. 
my_clean_data3$SXQ824[index_NAs_SXQ824] <- 0
my_clean_data3$SXQ824[index_77777_SXQ824] <- 0
my_clean_data3$SXQ824[index_99999_SXQ824] <- 0

summary(my_clean_data3)

#==========================================
# columns with NAs AND 77/99:
# SXQ610, 
# get the index from original column.

index_99999_SXQ610 <- which(real_my_data3$SXQ610 == 99.0)
index_77777_SXQ610 <- which(real_my_data3$SXQ610 == 77.0)
index_NAs_SXQ610 <- which(is.na(real_my_data3$SXQ610))
index_Non_NAs_SXQ610 <- which(!is.na(real_my_data3$SXQ610))

# form a new column, 1 for NA, 0 for rest.
new_column_SXQ610 <- real_my_data3$SXQ610
new_column_SXQ610[index_NAs_SXQ610] <- 1
new_column_SXQ610[index_Non_NAs_SXQ610] <- 0

# check the number of NA in new column
length(which(new_column_SXQ610 == 1))
# [1] 1500
length(index_NAs_SXQ610)
# [1] 1500

# add this new colum to original dataframe.
my_clean_data3 <- as.data.frame(cbind(my_clean_data3, new_column_SXQ610))
# change the column name for this new column 
colnames(my_clean_data3)[28] <- "IfSXQ610ismiss"
# check your new dataset, this new column is the last column, with new colname.
head(my_clean_data3)

# change the NAs and 77777/9999 in the original column. 
my_clean_data3$SXQ610[index_NAs_SXQ610] <- 0
my_clean_data3$SXQ610[index_77777_SXQ610] <- 0
my_clean_data3$SXQ610[index_99999_SXQ610] <- 0

summary(my_clean_data3)
#============
# SXD621, 
index_99999_SXD621 <- which(real_my_data3$SXD621 == 99.0)
index_77777_SXD621 <- which(real_my_data3$SXD621 == 77.0)
index_NAs_SXD621 <- which(is.na(real_my_data3$SXD621))
index_Non_NAs_SXD621 <- which(!is.na(real_my_data3$SXD621))

# form a new column, 1 for NA, 0 for rest.
new_column_SXD621 <- real_my_data3$SXD621
new_column_SXD621[index_NAs_SXD621] <- 1
new_column_SXD621[index_Non_NAs_SXD621] <- 0

# check the number of NA in new column
length(which(new_column_SXD621 == 1))
# [1] 2757
length(index_NAs_SXD621)
# [1] 2757

# add this new colum to original dataframe.
my_clean_data3 <- as.data.frame(cbind(my_clean_data3, new_column_SXD621))
# change the column name for this new column 
colnames(my_clean_data3)[29] <- "IfSXD621ismiss"
# check your new dataset, this new column is the last column, with new colname.
head(my_clean_data3)

# change the NAs and 77777/9999 in the original column. 
my_clean_data3$SXD621[index_NAs_SXD621] <- 0
my_clean_data3$SXD621[index_77777_SXD621] <- 0
my_clean_data3$SXD621[index_99999_SXD621] <- 0

summary(my_clean_data3)

#============
# SXD633

index_99999_SXD633 <- which(real_my_data3$SXD633 == 99.0)
index_77777_SXD633 <- which(real_my_data3$SXD633 == 77.0)
index_NAs_SXD633 <- which(is.na(real_my_data3$SXD633))
index_Non_NAs_SXD633 <- which(!is.na(real_my_data3$SXD633))

# form a new column, 1 for NA, 0 for rest.
new_column_SXD633 <- real_my_data3$SXD633
new_column_SXD633[index_NAs_SXD633] <- 1
new_column_SXD633[index_Non_NAs_SXD633] <- 0

# check the number of NA in new column
length(which(new_column_SXD633 == 1))
# [1] 2644
length(index_NAs_SXD633)
# [1] 2644

# add this new colum to original dataframe.
my_clean_data3 <- as.data.frame(cbind(my_clean_data3, new_column_SXD633))
# change the column name for this new column 
colnames(my_clean_data3)[30] <- "IfSXD633ismiss"
# check your new dataset, this new column is the last column, with new colname.
head(my_clean_data3)

# change the NAs and 77777/9999 in the original column. 
my_clean_data3$SXD633[index_NAs_SXD633] <- 0
my_clean_data3$SXD633[index_77777_SXD633] <- 0
my_clean_data3$SXD633[index_99999_SXD633] <- 0

summary(my_clean_data3)

#==========================================
# delete this column: SXQ280
part1_clean_data <- my_clean_data3[1:(which(colnames(my_clean_data3)== "SXQ280")-1)]
part2_clean_data <- my_clean_data3[(which(colnames(my_clean_data3)== "SXQ280")+1):length(colnames(my_clean_data3))]
my_clean_data3 <- as.data.frame(cbind(part1_clean_data, part2_clean_data))
summary(my_clean_data3)

#==========================================
# columns with NAs AND 7/9:
# SXQ251
# 7／9 keeps in their original value. 
# NAs change to 10. 

index_NAs_SXQ251 <- which(is.na(real_my_data3$SXQ251))
my_clean_data3$SXQ251[index_NAs_SXQ251] <- 10

summary(my_clean_data3)

#==========================================
# SXQ645
# also change 7 and 9 to 5

index_NAs_SXQ645 <- which(is.na(real_my_data3$SXQ645))
my_clean_data3$SXQ645[index_NAs_SXQ645] <- 10

index_7_SXQ645 <- which(real_my_data3$SXQ645 == 7.0)
my_clean_data3$SXQ645[index_7_SXQ645] <- 5
index_9_SXQ645 <- which(real_my_data2$SXQ645 == 9.0)
my_clean_data3$SXQ645[index_9_SXQ645] <- 5

summary(my_clean_data3)

#=======================

# save this clean dataset which include x AND y. 
write.csv(my_clean_data3, file="/Users/apple/desktop/capstone/sexual behavior/clean_xy_15-16.csv")

# number of missing value for all 5 diseases:
length(which(is.na(my_clean_data3$SXQ753))) # 2579
length(which(is.na(my_clean_data3$SXQ260))) #1054
length(which(is.na(my_clean_data3$SXQ265))) #1054
length(which(is.na(my_clean_data3$SXQ270)))#1054
length(which(is.na(my_clean_data3$SXQ272))) #1054


test <- intersect(which(is.na(my_clean_data3$SXQ272)),intersect(which(is.na(my_clean_data3$SXQ270)),intersect(which(is.na(my_clean_data3$SXQ265)),intersect(which(is.na(my_clean_data3$SXQ753)), which(is.na(my_clean_data3$SXQ260))))))
length(test)

#=========
# END







