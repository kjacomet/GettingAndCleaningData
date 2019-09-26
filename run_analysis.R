library(dplyr)

#Set working directory
setwd("C://Users/kris/Documents/GitHub/GettingAndCleaningData")

filename <- "data.zip"

# Checking if archieve already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Step 1 - Reading data and assigning names

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Step 2 - Merge data

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
MergedData <- cbind(Subject, Y, X)

# Step 3 - Pull desired data (mean, std dev)

ParsedData <- MergedData %>% select(subject, code, contains("mean"), contains("std"))

# Step 4 - Naming & tidying up

ParsedData$code <- activities[ParsedData$code, 2]

#Rename variables
names(ParsedData)[2] = "activity"
names(ParsedData)<-gsub("Acc", "Accelerometer", names(ParsedData))
names(ParsedData)<-gsub("Gyro", "Gyroscope", names(ParsedData))
names(ParsedData)<-gsub("BodyBody", "Body", names(ParsedData))
names(ParsedData)<-gsub("Mag", "Magnitude", names(ParsedData))
names(ParsedData)<-gsub("^t", "Time", names(ParsedData))
names(ParsedData)<-gsub("^f", "Frequency", names(ParsedData))
names(ParsedData)<-gsub("tBody", "TimeBody", names(ParsedData))
names(ParsedData)<-gsub("-mean()", "Mean", names(ParsedData), ignore.case = TRUE)
names(ParsedData)<-gsub("-std()", "STD", names(ParsedData), ignore.case = TRUE)
names(ParsedData)<-gsub("-freq()", "Frequency", names(ParsedData), ignore.case = TRUE)
names(ParsedData)<-gsub("angle", "Angle", names(ParsedData))
names(ParsedData)<-gsub("gravity", "Gravity", names(ParsedData))

#Step 5 - Output readable dataset

CleanData <- ParsedData %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean))
write.table(CleanData, "CleanData.txt", row.name=FALSE)

str(CleanData)

