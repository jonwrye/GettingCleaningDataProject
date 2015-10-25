# GettingCleaningDataProject
Course project for the Coursera Data Science track "Getting and Cleaning Data" class.

Further information about this project can be found in the Codebook.md file: https://github.com/jonwrye/GettingCleaningDataProject/blob/master/Codebook.md

## Steps to run the 'run_analysis.r' script file
 1. Download the original data set from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 2. Unzip files in the downloaded folder
 3. Set your working directory in the R Console to the path to the 'UCI HAR Dataset' folder in the downloaded data set. 
	**NOTE**: The 'UCI HAR Dataset' folder should be the root directory in your working directory!!
 4. Execute the run_analysis.r file (in the R console, type: source('[path_to_file]')).
 5. The analyzed data file will be written to the 'UCI HAR Dataset' directory and will be called FinalDataSet.txt

*Additional Notes:*
 1. When the script is executed, 2 R packages will be downloaded that are required to run the script. If the packages cannot be downloaded, the script will fail.
 2. The script was written and tested using R version 3.2.2

## Analysis Processing
The following processing steps are performed on the source data set to produce the output file named FinalDataSet.txt.
 1. Merge the data files into a single data set. The measurement data in the source data set is separated into two different groups. Two additional files for each group that identify the 'Subject' and 'Activity' corresponding to the measurements taken were also merged in the single data set.
 2. Out of the 561 unique measurement types, 66 measurement types are extracted for use in the final data set. These are the measurements of mean and standard deviation identified by the respective string values 'mean()' and 'std()' being found in the measurement descriptions in the 'features.txt' file.
 3. The 'Activity' data values in the original data set are factor values. They are renamed using the descriptive character values names in the data. For example, the factor 1 is replaced by the string "Walking" across all rows of the data set.
 4. The data set is summarized down from 10299 individual observations (rows) to 180 observations, representing the mean value of each of the 66 measurements for each Subject and Activity. This data set accounts for 30 Subjects, each of whom performed 6 different activites. 
 5. The resulting data set is 180 summarized observations of 68 columns (the 66 measurment types, plus Subject and Activity)

 
