## Getting and Cleaning Data Course Project
##
## 1. The goal is to prepare tidy data that can be used for later analysis. The output file will be located in the data folder and named output.txt
## 2. The code book (CodeBook.md) describes the data, the variables, and transformations performed to clean up the data.
## 3. The README.md explains how the scripts work and how they are connected.


## Step 0 
## Initial (optional) step: Download and unzip data to the data folder in the working directory. Create the data folder if it does not exist.
##
rm(list=ls())
if (!file.exists("data")){
    dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileDownloadDest <- "data/UCI HAR dataset.zip"
download.file(fileUrl, fileDownloadDest, method = "curl")
unzip(fileDownloadDest,exdir = "./data")


## Step 1 
## Read features, labels and data, and merge the training and the test sets to create one data set
##
library(dplyr)

## Read features and labels
##
activity_labels <- read.table("data/UCI HAR dataset/activity_labels.txt")        ## Links the class labels with their activity name.
colnames(activity_labels) <- c("activityID","activity")
features <- read.table("data/UCI HAR dataset/features.txt")                      ## List of all features.


## Read test and training data
##
x_test <- read.table("data/UCI HAR dataset/test/x_test.txt")                     ## Test set.
y_test <- read.table("data/UCI HAR dataset/test/y_test.txt")                     ## Test labels.
subject_test <- read.table("data/UCI HAR dataset/test/subject_test.txt")         ## The ID of the subject who performed the test activity.

x_train <- read.table("data/UCI HAR dataset/train/x_train.txt")                  ## Training set.
y_train <- read.table("data/UCI HAR dataset/train/y_train.txt")                  ## Training labels.
subject_train <- read.table("data/UCI HAR dataset/train/subject_train.txt")      ## The ID of the subject who performed the train activity.

## Assign the column names
##
colnames(x_test) <- features[,2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

colnames(x_train) <- features[,2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

## Merge data (using cbind and rbind). The result is called "output1"
##
test_data <- cbind(x_test, subject_test, y_test)
train_data <- cbind(x_train, subject_train, y_train)

output1 <- rbind(test_data, train_data)


## Step 2 
## Extract only the measurements on the mean and standard deviation for each measurement. The result is called "output2"
##
features1 <- colnames(output1)
feat_pick <- grep("(((mean|std)\\(\\)|activityID)|subjectID)", features1)
output2 <- output1[features1[feat_pick]]


## Step 3
## Use descriptive activity names to name the activities in the data set. The result is called "output3"
##
output3 <- merge(output2,activity_labels,by.x = "activityID", by.y = "activityID")


## Step 4
## Appropriately label the data set with descriptive variable names and output the data to output.txt
##
## Let us follow the recommendations for names of variables from the lectures and use gsub:
##
colNames <- colnames(output3)

for (i in 1:length(colNames)) 
{
    colNames[i] = gsub("(-mean\\())(-*)","Mean",colNames[i])
    colNames[i] = gsub("(-std\\())(-*)","StdDev",colNames[i])
    colNames[i] = gsub("^t","time",colNames[i])
    colNames[i] = gsub("^f","frequency",colNames[i])
    colNames[i] = gsub("BodyBody","Body",colNames[i])
    colNames[i] = gsub("Acc","Accelerometer",colNames[i])
    colNames[i] = gsub("Gyro","Gyroscope",colNames[i])
    colNames[i] = gsub("Mag","Magnitude",colNames[i])
    
};

## The output data (output4) with appropriate labels:
output4 <- output3
colnames(output4) <- colNames

## Let us write the output to the data folder (output.txt):
write.table(output4, "data/output.txt", row.name=FALSE)


## Step 5
## From the data set in step 4, create a second, independent tidy data set (output5) with the average of each variable for each activity and each subject.
##
data_extract <- output4 %>% select(-activity)
data_step5 <- aggregate(data_extract, by=list(activity=data_extract$activityID, subject=data_extract$subjectID), FUN=mean, na.rm=TRUE)

## The output data (output5):
output5 <- merge(data_step5, activity_labels, by.x = "activityID", by.y = "activityID")

## Let us also write the output to the data folder (output2.txt):
write.table(output5, "data/output2.txt", row.name=FALSE)
