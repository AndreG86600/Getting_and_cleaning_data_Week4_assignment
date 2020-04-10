#download and unzip the data in the same directory where you usually work with

library(dplyr)

#read train data

X_train <-read.table("./UCI HAR Dataset/train/X_train.txt") 
Y_train <-read.table("./UCI HAR Dataset/train/Y_train.txt")
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#read test data

X_test <-read.table("./UCI HAR Dataset/test/X_test.txt") 
Y_test <-read.table("./UCI HAR Dataset/test/Y_test.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#read activity labels and features

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

# 1.Merges the training and the test sets to create one data set

X <- rbind(X_train, X_test)
Y <- rbind(Y_train, Y_test)
sub_all <- rbind(sub_train, sub_test)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement

select_meas <- features[grep("mean|std", features[,2]),]
X <- X[,select_meas[,1]]

#3.Uses descriptive activity names to name the activities in the data set

colnames(Y) <- "activity"
Y$activitylabel <- factor(Y$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y[,-1]

# 4. Appropriately labels the data set with descriptive variable names

colnames(X) <- features[select_meas[,1],2]

# 5.From the data set in step 4, creates a second, independent tidy data set
##  with the average of each variable for each activity and each subject

colnames(sub_all) <- "subject"
total <- cbind(X, activitylabel, sub_all)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarise_each(funs(m1=mean))
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
