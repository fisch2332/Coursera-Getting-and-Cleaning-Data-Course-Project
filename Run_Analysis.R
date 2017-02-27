#### Course 3 Project ####

# One of the most exciting areas in all of data science right now is wearable computing - 
# see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing 
# to develop the most advanced algorithms to attract new users. The data linked to from 
# the course website represent data collected from the accelerometers from the Samsung 
# Galaxy S smartphone. A full description is available at the site where the data was obtained:

# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Here are the data for the project:
        
#        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# You should create one R script called run_analysis.R that does the following.


setwd("C:\\Users\\Owner\\Desktop\\Coursera R Course 3 Data\\Course 3 R Project Data")
# work setwd("D:\\Coursera\\Coursera R Course 3 Data\\Course 3 R Project Data")
# Grabbing all the relevant data
actLab = read.table("activity_labels.txt", header = FALSE)
features = read.table("features.txt", header = FALSE)
subTest = read.table("subject_test.txt", header = F)
subTrain = read.table("subject_train.txt", header = F)
xTest = read.table("x_test.txt", header = F)
xTrain = read.table("x_train.txt", header = F)
yTest = read.table("y_test.txt", header = F)
yTrain = read.table("y_train.txt", header = F)

## 1. Merging the test and training data
testDatax = rbind(xTrain, xTest)
testDatay = rbind(yTrain, yTest)
subData = rbind(subTrain, subTest)

## 3. (out of order, 2 is below) Uses descriptive activity names to name the activities in the
##    data set. adding the activity to each row
testDatay$ID = seq.int(nrow(testDatay))
testDatax1 = merge(testDatay, actLab, by.x = "V1", by.y = "V1")
testDatax1 = testDatax1[order(testDatax1$ID), ]
testDatax1 = as.data.frame(testDatax1[, -1])
colnames(testDatax1) = "V0"
testDatax2 = cbind(testDatax1,testDatax)

## 4. (out of order, 2 is below) Appropriately labels the data set with descriptive variable names.
##    labeling the data
library(plyr)
editdata = rbind(data.frame(V1 = 0, V2 = "activity"), features)
editdata = as.data.frame(editdata[, -1])
editdata1 = t(editdata)
colnames(editdata1) = c(1:562) 
colnames(testDatax2) = c(1:562)
testDatax2[] = lapply(testDatax2, as.character)
finalData = rbind(editdata1, testDatax2)
colnames(finalData) = as.character(unlist(finalData[1, ]))
finalData = finalData[-1, ]

## 2.(out of order) Extracts only the measurements on the mean and standard deviation for each measurement.

MeanData = finalData[,grepl("mean",colnames(finalData))]
StdData = finalData[,grepl("std",colnames(finalData))]
MSData = cbind(subData, finalData$activity, MeanData, StdData)
colnames(MSData)[2] = "activity"
MSData[3:81] = lapply(MSData, as.character)[3:81]
MSData[3:81] = lapply(MSData, as.numeric)[3:81]

## 5. From the data set in step 4, create a second, independent tidy data set with the
##    average of each variable for each activity and each subject

MeanData = aggregate(. ~ activity + V1, MSData, mean)
MeanData = MeanData[order(MeanData$V1, MeanData$activity), ]
write.table(MeanData, "C:\\Users\\Owner\\Desktop\\Coursera R Course 3 Data\\tidy.csv")
