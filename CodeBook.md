==================================================================
Coursera Cleaning and Getting Data - Course Project
==================================================================
Version 1.3 - John Doe

For detailed information on the source data and description of data sets, see information available from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

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