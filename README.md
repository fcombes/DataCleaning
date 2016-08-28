---
title: "Getting and Cleaning Data Course Project"
author: "Florent Combes"
date: "28 août 2016"
output: html_document
---

## Getting and Cleaning Data Course Project

The code of the Course Project is in the file "run_analysis.R" 


##0.Load data

###i) Features and activity
This step reads the "features.txt" and "activity_labels.txt" files and assigns column names to each. 
Then it gets the three

###ii) training set
the "X_train.txt", "y_train.txt" and "subject_train.txt" are loaded.
the features list is assigned to the column names of the training set (ie X_train.txt)

###iii) testint set 
the "X_test.txt", "y_test.txt" and "subject_test.txt" are loaded.
the features list is assigned to the column names of the testing set (ie X_test.txt)

##1.Merge the training and the testing sets

In order to create one data set, 
- We column bind the training subject, activity and set  
- we do the same with the testing subject, activity and set  
- we then row bind the two sub-data set into a single one.  


##2. Mean and standard deviation for each measurement.

###i) select colnames with mean or std
We select the colnames that contains "mean"" or "std".
However somme of them contain "meanFreq" which we discard as it is a different subject

###ii) New dataset
The new dataset keeps the activity and subject columns plus all the columns that contains mean or std (whitout meanFreq) 

##3.descriptive activity names
We merge the activity labels with the new dataset to get activity class labels.


##4.Appropriately labels the data set with descriptive variable names
As the colnames have already been labelled during the data import phase, we haven't need to do anything more there.


##5.tidy data set with the average of each variable for each activity and each subject.
The data have been grouped by activity and subject and for each of them the mean has been calculated.
Then the data are written into a table
