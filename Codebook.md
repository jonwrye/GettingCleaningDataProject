---
TITLE: "Getting & Cleaning Data project - Codebook"
AUTHOR: "Jon Wrye"
DATE: "10/25/2015"
ANALYSIS SCRIPT: 
  .r file:
    run_analysis.r
SCRIPT OUTPUT:
  .txt file:
    FinalDataSet.txt
---

## Project Description
This project is a requirement as part of the Getting & Cleaning Data course on Coursera's Data Science track.
The purpose of the project according to the assignment is "to demonstrate the ability to collect, work with, and clean a data set."


##Collection of the raw data
The raw data is should be downloaded from the following URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 
Once downloaded, unzip the files and place the root folder called 'UCI HAR Dataset' in a directory of your preference.

There are multiple files and sub folders in the data set. Not all data files are used, but it is important not to move or delete any files in the downloaded folder.
The files that are used in the analysis script are:
 - /test/y_test.txt
 - /test/X_test.txt
 - /test/subject_test.txt
 - /train/X_train.txt
 - /train/y_train.txt
 - /train/subject_train.txt
 - /features.txt

##Creating the analyzed data file

###Steps to follow
 1. Download the original data set from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 2. Unzip files in the downloaded folder
 3. Set your working directory in the R Console to the path to the 'UCI HAR Dataset' folder in the downloaded data set. 
	**NOTE**: The 'UCI HAR Dataset' folder should be the root directory in your working directory!!
 4. Execute the run_analysis.r file (in the R console, type: source('[path_to_file]')).
 5. The analyzed data file will be written to the 'UCI HAR Dataset' directory and will be called FinalDataSet.txt

*Additional Notes:*
 1. When the script is executed, 2 R packages will be downloaded that are required to run the script. If the packages cannot be downloaded, the script will fail.
 2. The script was written and tested using R version 3.2.2

###Cleaning of the data
Multiple data files in the set are appropriately combined before analysis is performed on the combined data file. 
Once combined, only standard deviation and mean measurements are extracted for use from the entire data set. 
Numeric factor values are replaced with their descriptive identifiers. 
A mean analysis is performed on each measurement, grouped by each Subject and Activity in the data set.

##Description of variables in data file output
General description of the file:
 - Dimensions: 180 rows of 68 variables
 - Summary of the data: 30 people performed 6 different activities wearing a smartphone. Measurements were taken from the smartphone. This data represents the AVERAGE value of each measurement in the original data set for each person, by activity. 30 people multiplied by 6 activities each equals, 180 observations in the analysis data set.

###Variables
 1. 'Subject' - Identifies the person who was wearing the smartphone when the measurement values were collected
 2. 'Activity' - Identifies the activity the person was performing when the measurement values were collected
 3. Variables 3-68 are various signal values taken from a smartphone accelerometer and gyroscope. Here is a description of the measurements from the 'features_info.txt' file in the downloaded data set:

 > The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

 > Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

 > Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

 > These signals were used to estimate variables of the feature vector for each pattern:  
 > '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
 
Variable Names, Class and possible Values:
```
 - VARIABLE NAME			  : CLASS   : VALUES
 - Subject                    : int  	: 1-30
 - Activity                   : chr  	: "Laying" "Sitting" "Standing" "Walking" "Walking Upstairs" "Walking Downstairs"
 - tBodyAcc-mean()-X          : num  	: [continuous]
 - tBodyAcc-mean()-Y          : num  	: [continuous]
 - tBodyAcc-mean()-Z          : num  	: [continuous]
 - tBodyAcc-std()-X           : num  	: [continuous]
 - tBodyAcc-std()-Y           : num  	: [continuous]
 - tBodyAcc-std()-Z           : num  	: [continuous]
 - tGravityAcc-mean()-X       : num  	: [continuous]
 - tGravityAcc-mean()-Y       : num  	: [continuous]
 - tGravityAcc-mean()-Z       : num  	: [continuous]
 - tGravityAcc-std()-X        : num  	: [continuous]
 - tGravityAcc-std()-Y        : num  	: [continuous]
 - tGravityAcc-std()-Z        : num  	: [continuous]
 - tBodyAccJerk-mean()-X      : num  	: [continuous]
 - tBodyAccJerk-mean()-Y      : num  	: [continuous]
 - tBodyAccJerk-mean()-Z      : num  	: [continuous]
 - tBodyAccJerk-std()-X       : num  	: [continuous]
 - tBodyAccJerk-std()-Y       : num  	: [continuous]
 - tBodyAccJerk-std()-Z       : num  	: [continuous]
 - tBodyGyro-mean()-X         : num  	: [continuous]
 - tBodyGyro-mean()-Y         : num  	: [continuous]
 - tBodyGyro-mean()-Z         : num  	: [continuous]
 - tBodyGyro-std()-X          : num  	: [continuous]
 - tBodyGyro-std()-Y          : num  	: [continuous]
 - tBodyGyro-std()-Z          : num  	: [continuous]
 - tBodyGyroJerk-mean()-X     : num  	: [continuous]
 - tBodyGyroJerk-mean()-Y     : num  	: [continuous]
 - tBodyGyroJerk-mean()-Z     : num  	: [continuous]
 - tBodyGyroJerk-std()-X      : num  	: [continuous]
 - tBodyGyroJerk-std()-Y      : num  	: [continuous]
 - tBodyGyroJerk-std()-Z      : num 	: [continuous]
 - tBodyAccMag-mean()         : num  	: [continuous]
 - tBodyAccMag-std()          : num  	: [continuous]
 - tGravityAccMag-mean()      : num  	: [continuous]
 - tGravityAccMag-std()       : num  	: [continuous]
 - tBodyAccJerkMag-mean()     : num  	: [continuous]
 - tBodyAccJerkMag-std()      : num  	: [continuous]
 - tBodyGyroMag-mean()        : num  	: [continuous]
 - tBodyGyroMag-std()         : num  	: [continuous]
 - tBodyGyroJerkMag-mean()    : num  	: [continuous]
 - tBodyGyroJerkMag-std()     : num  	: [continuous]
 - fBodyAcc-mean()-X          : num  	: [continuous]
 - fBodyAcc-mean()-Y          : num  	: [continuous]
 - fBodyAcc-mean()-Z          : num  	: [continuous]
 - fBodyAcc-std()-X           : num  	: [continuous]
 - fBodyAcc-std()-Y           : num  	: [continuous]
 - fBodyAcc-std()-Z           : num  	: [continuous]
 - fBodyAccJerk-mean()-X      : num  	: [continuous]
 - fBodyAccJerk-mean()-Y      : num  	: [continuous]
 - fBodyAccJerk-mean()-Z      : num  	: [continuous]
 - fBodyAccJerk-std()-X       : num  	: [continuous]
 - fBodyAccJerk-std()-Y       : num  	: [continuous]
 - fBodyAccJerk-std()-Z       : num  	: [continuous]
 - fBodyGyro-mean()-X         : num  	: [continuous]
 - fBodyGyro-mean()-Y         : num  	: [continuous]
 - fBodyGyro-mean()-Z         : num  	: [continuous]
 - fBodyGyro-std()-X          : num  	: [continuous]
 - fBodyGyro-std()-Y          : num  	: [continuous]
 - fBodyGyro-std()-Z          : num  	: [continuous]
 - fBodyAccMag-mean()         : num  	: [continuous]
 - fBodyAccMag-std()          : num  	: [continuous]
 - fBodyBodyAccJerkMag-mean() : num  	: [continuous]
 - fBodyBodyAccJerkMag-std()  : num  	: [continuous]
 - fBodyBodyGyroMag-mean()    : num  	: [continuous]
 - fBodyBodyGyroMag-std()     : num  	: [continuous]
 - fBodyBodyGyroJerkMag-mean(): num  	: [continuous]
 - fBodyBodyGyroJerkMag-std() : num  	: [continuous]
```

##Sources
Markdown layout based on: https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41
