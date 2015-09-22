==================================================================
Coursera Cleaning and Getting Data - Course Project
Version 1.3
==================================================================

This file explains methodology used in the script run_analysis.R.

For detailed information on the source data and description of data sets, see information available from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Prerequisites
1)The R-package "plyr" should be loaded. It is available from cran.
2) The script should be placed in the working directory.
3) The following 8 files, available from the link above, should be in the same directory as this script.
* 'X_test.txt'
* 'Y_test.txt'
* 'subject_test.txt'
* 'X_train.txt'
* 'Y_train.txt'
* 'subject_train.txt'
* 'activity_labels.txt'
* 'features.txt'

## Summary
The script produces two output data frames:
selectedData contains all information about mean and standard deviation of all measurements.(result of Sections 1A->1C in the script file)
summaryData contains the average for each activity and subject in the above table.(result of Section 2 in the script file)
Note that both output data frames have a WIDE format, since it is assumed that there is correlation between the different measures, and as such, each record can be seen as different information about one observation.

## Section 1A: Reading all the input files
training set and test set are imported, as well as activity and features

## Section 1B: Combine data
Both for the test and the training data, we use cbind to create a set with a column for Subject and Activity and then all the measurement information variables are added as columns
Next, we combine test and training set using rbind.

## Section 1C: Extract and Label Data
Next to Subject and Activity, only those features containing information about Mean and Std are extracted.
The naming convention of the original dataset is largely preserved, because we feel it is a good compromise between readability and having variable names of manageable length. However, the following two changes are made to ensure the variable names meet R requirements:
- brackets ("()") are removed
- hyphens ("-") are replaced by underscore ("_")
Finally, a descriptive name is applied to the activities

The results are starred in "selectedData"

## Section 2: Summarize Data
This step assumed that the "plyr" package is installed.
For each subject and activity, we aggregate using ddply to calculate the mean of each measurement. 
The suffix "_mean" is added to the column names of the original data frame "selectedData".
The results are written to the file "MeanData.txt"

## Variables Description in data frame "selectedData"

For each Subject (Described with a number) and each Activity, the variables described below are reported.

Units: Note that all variables are normalized and bounded within [-1,1].

The variables selected for this database come from the accelerometer and gyroscope 3_axial raw signals tAcc_XYZ and tGyro_XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc_XYZ and tGravityAcc_XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration (BodyAcc) and angular velocity (BodyGyro) were derived in time to obtain Jerk signals (tBodyAccJerk_XYZ and tBodyGyroJerk_XYZ). Also the magnitude of these three_dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc_XYZ, fBodyAccJerk_XYZ, fBodyGyro_XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'_XYZ' is used to denote 3_axial signals in the X, Y and Z directions.

* tBodyAcc_XYZ
* tGravityAcc_XYZ
* tBodyAccJerk_XYZ
* tBodyGyro_XYZ
* tBodyGyroJerk_XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc_XYZ
* fBodyAccJerk_XYZ
* fBodyGyro_XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals included in the dataset are: 

mean: Mean value
std: Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

## Variables Description in set "MeanData"
The variables in this dataset are the same as the variables described above, with the suffix "_mean" appended, since they are average values for each subject and activity.