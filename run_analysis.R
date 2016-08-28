setwd("C:/Users/Florent/Documents/dataScience/dataCleaning/UCI HAR Dataset")

library(dplyr)

#0- Load data
#features and activity labels
features<-read.table("features.txt",header=FALSE,col.names=c("class","features"))
activity.labels<-read.table("activity_labels.txt",header=FALSE, col.names= c("class","activity"))

# train
train.set<-read.table("train/X_train.txt",header=FALSE, col.names = features$features)
train.activity<-read.table("train/y_train.txt",header=FALSE,col.names="class")
train.subject<-read.table("train/subject_train.txt",header=FALSE,col.names="num")

# test 
test.set<-read.table("test/X_test.txt",header=FALSE, col.names = features$features)
test.activity<-read.table("test/y_test.txt",header=FALSE,col.names="class")
test.subject<-read.table("test/subject_test.txt",header=FALSE,col.names="num")

#1- Merges the training (subject+activity+set) and the test  (subject+activity+set) sets to create one data set.
data<-rbind(cbind(train.subject,train.activity,train.set),cbind(test.subject,test.activity,test.set))

#2- Extracts only the measurements on the mean and standard deviation for each measurement.
use=(grepl("mean",colnames(data))| grepl("std",colnames(data))) & !grepl("meanFreq",colnames(data))
#keep the two first columns (activity class and subject num)
use[1:2]=TRUE
#get data
data.stdmean=data[,colnames(data)[use]]

#3- Uses descriptive activity names to name the activities in the data set
data.stdmean.with.activity=merge(activity.labels,data.stdmean, by='class',all.x=TRUE);

#4- Appropriately labels the data set with descriptive variable names
#-> colnames already labelled during data import (col.names = features$features)
colnames(data.stdmean.with.activity)

#5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy.data <- data.stdmean.with.activity %>% group_by(activity,num) %>% summarise_each(funs(mean))
write.table(tidy.data,"tidy_data_set",row.name = FALSE)
