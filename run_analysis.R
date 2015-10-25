# Install and load needed packages
install.packages("stringr")
install.packages("dplyr")
library(stringr)
library(dplyr)


# Read in all files
test.x <- read.table("./test/X_test.txt")
test.y <- read.table("./test/y_test.txt")
test.subject <- read.table("./test/subject_test.txt")
train.x <- read.table("./train/X_train.txt")
train.y <- read.table("./train/y_train.txt")
train.subject <- read.table("./train/subject_train.txt")
features <- read.table("features.txt")

# Rename the single columns 'subject' and 'y' files to avoid duplicate column names when they are merged
test.subject <- rename(test.subject, Subject = V1)
train.subject <- rename(train.subject, Subject = V1)
test.y <- rename(test.y, Activity = V1)
train.y <-rename(train.y, Activity = V1)

# Merge all 3 test files
test.xy <- cbind(test.x, test.y)
test.all <- cbind(test.xy, test.subject)

# Merge all 3 train files
train.xy <- cbind(train.x, train.y)
train.all <- cbind(train.xy, train.subject)

# Merge both test and train files
alldata <- rbind(train.all, test.all)

# Create a character vector with 2 strings that will identify the measurement we want to keep - mean and standard deviation measurements
# The '\\' will escape the character following them. The parentheses are special characters in for the 'str_detect' function (next line),
# so they must be escaped or they will be ignored.
measuresToKeep <- c("mean\\(\\)", c("std\\(\\)"))

# Create a logical vector using the features file. The 'TRUE' indexes will be values that have '-mean()' or '-std()' in the measurement label,
# and will correspond to the indexes that we will extract from the actual measurement file (alldata).
keepVector <- str_detect(features$V2, paste(measuresToKeep, collapse = '|')) 

# Extract only the mean and std measurement. (The Activity and Subject columns are at the END of the data frame, 
# but since the logical 'keepVector' doesn't have enough values to include those columns, they are included in the subset but default)
extractedData <- alldata[,keepVector]

# Cast the 'Activity' column values to a character type, then rename to the corresponding descriptive activity for each numeric value.
extractedData$Activity <- as.character(extractedData$Activity)
extractedData$Activity[extractedData$Activity == "1"] <- "Walking"
extractedData$Activity[extractedData$Activity == "2"] <- "Walking Upstairs"
extractedData$Activity[extractedData$Activity == "3"] <- "Walking Downstairs"
extractedData$Activity[extractedData$Activity == "4"] <- "Sitting"
extractedData$Activity[extractedData$Activity == "5"] <- "Standing"
extractedData$Activity[extractedData$Activity == "6"] <- "Laying"


# Properly label the measurement columns using the names from the 'features' file
# 1. Transpose the measurement names column to a vector
tmp <- t(features$V2)
tmp <- as.vector(tmp)
# 2. Subset the only the columns we extracted into our data set earier using 'keepVector'
measureLabels <- tmp[keepVector]
# 3. Assign the names the measureLabels vector - this renames them.
names(extractedData) <- measureLabels
# 4. Set the names for the Activity and Subject columns again - the previous command just wiped them out! :)
names(extractedData)[67] <- "Activity"
names(extractedData)[68] <- "Subject"

# Create new data set for the Mean of each measurement grouped by Subject and Activity
meanData <- extractedData %>% group_by(Subject, Activity) %>% summarize_each(funs(mean))
# Explicitly cast the data set to a data frame
meanData <- as.data.frame(meanData)

# Write final data set to file
write.table(meanData, "./FinalDataSet.txt", row.names = FALSE)

# read back in for sanity check
# data <- read.table("./FinalDataSet.txt", header = TRUE)

