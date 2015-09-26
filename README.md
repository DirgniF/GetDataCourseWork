# GetDataCourseWork
==================================================================
Coursera Cleaning and Getting Data - Course Project
==================================================================

Version 1.3 - John Doe

The script in this submission can be used to clean and aggregate the data collected from the accelerometers from the Samsung Galaxy S smartphone.
For information on the raw data that are used for this project, and information on how these data were collected, see https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##The repo includes the following files:


* 'README.md'
* 'run_analysis.R' : This script produces two output data frames. A detailed description of methodology and choices made can be found in the script.
* 'CodeBook.md': Contains a description of the different variables included in the two data frames.

##Prerequisites
1) The script should be placed in the working directory.

2) The following 8 files, available from the link above, should be in the same directory as this script.

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
* selectedData contains all information about mean and standard deviation of all measurements.(result of Sections 1A->1C in the script file)
* summaryData contains the average for each activity and subject in the above table.(result of Section 2 in the script file)
Note that both output data frames have a WIDE format, since it is assumed that there is correlation between the different measures, and as such, each record can be seen as different information about one observation.

### Section 1A: Reading all the input files
training set and test set are imported, as well as activity and features

### Section 1B: Combine data
Both for the test and the training data, we use cbind to create a set with a column for Subject and Activity and then all the measurement information variables are added as columns
Next, we combine test and training set using rbind.

### Section 1C: Extract and Label Data
Next to Subject and Activity, only those features containing information about Mean and Std are extracted. We deliberately choose to only extract columns with a name that contains "mean(" or "std(", even though the datasource contains some variables where mean appears elsewhere in the variable's name (without round brackets ())"..
The naming convention of the original dataset is largely preserved, because we feel it is a good compromise between readability and having variable names of manageable length. However, the following two changes are made to ensure the variable names meet R requirements:
- brackets ("()") are removed
- hyphens ("-") are replaced by underscore ("_")
Finally, a descriptive name is applied to the activities

The results are stored in "selectedData"

### Section 2: Summarize Data
This step starts with installing (if needed) and loading the plyr package.
For each subject and activity, we aggregate using ddply to calculate the mean of each measurement. 
The suffix "_mean" is added to the column names of the original data frame "selectedData".
The results are written to the file "MeanData.txt"

##License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

John Doe