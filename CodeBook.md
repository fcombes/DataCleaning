---
title: "Code Book"
author: "Florent Combes"
date: "28 août 2016"
output: html_document
---

The code book  describes the variables, the data, and any transformations or work that you performed to clean up the data 

##Variables and data
- features: measures class and features labels
- activity.labels: activity class and labels
- train.set:training set of measures described in features
- train.activity: training activity that have been performed
- train.subject: training people whose activity have been measured
- test.set: testing set of measures
- test.activity: testing activity that have been performed
- test.subject: testing people whose activity have been measured
- data: merging of the train and test data
- use: boolean to get the columns with mean or std, plus activity and subject
- data.stdmean: data filtered on mean and std measure only
- data.stdmean.with.activity: data.stdmean completed with activity labels
- tidy.data: mean of each measure of data.stdmean.with.activity

#transformations
data are merged or filtered through the process.
At the end the tidy.data set resume by their mean all the measures that includes mean or std in their name, group by subject and activity