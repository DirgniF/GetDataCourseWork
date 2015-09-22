==================================================================
Coursera Cleaning and Getting Data - Course Project
Version 1.3
==================================================================

This file explains methodology used in the script run_analysis.R.
Rather than repeating here the excellent information available in below link, this codebook only contains the incremental information needed to follow logic used to clean and summarize the data as per course work instructions.

For detailed information on the source data and description of data sets, see information available from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Prerequisites
The script assumes that the following 8 files, available from the link above, are in the same directory as this script.
* 'X_test.txt'
* 'Y_test.txt'
* 'subject_test.txt'
* 'X_train.txt'
* 'Y_train.txt'
* 'subject_train.txt'
* 'activity_labels.txt'
* 'features.txt'

## Summary
The script produces two data frames:
selectedData contains all information about mean and standard deviation of all measurements.(result of Sections 1A->1C)
summaryData contains the average for each activity and subject in the above table.(result of Section 2)
Note that both tables have a WIDE format, since it is assumed that there is correlation between the different measure, and as such, each record can be seen as different information of one observation.

## Section 1A: Reading all the input files
training set and test set are imported, as well as activity and features

## Section 1B: Combine data
Both for the test and the training data, we use cbind to create a set with Subject, activity and then all the measurement information as columns
In a second step, we combine test and training set using rbind.

## Section 1C: Extract and Label Data
Only features containing information about Mean and Std are extracted.
The naming convention of the original dataset is largely preserved (see link above, file features_info.txt). However, the following two changes are made to ensure the variable names meet R requirements:
- brackets ("()") are removed
- hyphens ("-") are replaced by underscore ("_")
Finally, a descriptive name is applied to the activities

## Section 2: Summarize Data
This step assumed that the "plyr" package is installed.
for each subject and activity, we aggregate using ddply. The suffix "_mean" is added to the column names.