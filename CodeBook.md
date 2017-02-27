# Code Book

This code book summarizes the variables and fields in the RunAnalysis.R file, which creates the tidy.csv file

## Data

### Raw data importated names
- actLab 
- features
- subTest 
- subTrain 
- xTest 
- xTrain
- yTest
- yTrain

### Merged data frames
- testDatax
- testDatay
- subData
- testDatax1 (activity names added)
- editdata (adding features)

### Final data sets
- MSData (first tidy data set)
- MeanData (data that has been averaged)

## Processes

### Step 1
- Merged/binded data

### Step 2
- (Labeled as step 3)
- Added an identifer column and binded two data sets

### Step 3
- (labeled as step 4)
- renamed columns of two data sets
- turned factors into characters
- binded the data sets

### Step 4
- (labeled as step 2)
- Selected only the mean and standard deviation columns from the data table
- turned factors into characters then into numbers

### Step 5
- Took averages of activities/features
