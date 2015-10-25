## Getting & Cleaning Data - Course Project
## SamSung Smartphone dataset downloaded & unzipped to the current working directory

## Supporting functions defined in external R scripts to improve modularity & readability
## of the current program

source("assigncolnames.R")
source("assignActivityNames.R")

## ============================================================================
## 1. Merges the training and the test sets to create one data set
## ============================================================================
## Loading Test Data Set

subjectID <- read.table("subject_test.txt")
activity <- read.table("y_test.txt")
tests <- read.table("X_test.txt")
testDataSet <- cbind(subjectID, activity, tests )

## Loading Training Data Set

subjectID <- read.table("subject_train.txt")
activity <- read.table("y_train.txt")
tests <- read.table("X_train.txt")
trainDataSet <- cbind(subjectID, activity, tests )

## Merge Training & Test data sets

mergeddataSet <- rbind(testDataSet, trainDataSet )

## ============================================================================
## 2. Extracts only the measurements on the mean and standard deviation for 
## each measurement.
## ============================================================================


## In order to extract the columns that contains the mean and standard deviation 
## measurements we name the columns for the merged data set with the descriptive
## columns names defined in the features.txt 
## In essence we are fulfilling Step 4 of this exercise
##    4. Appropriately labels the data set with descriptive variable names. 

mergeddataSet <- assigncolnames( mergeddataSet )

## Extract subject, activity, mean() and std() columns names using grepl

subject <- mergeddataSet[1]
activity <- mergeddataSet[2]
stdcols <- mergeddataSet[ grepl("std()", colnames(mergeddataSet), fixed=TRUE) ]
meancols <- mergeddataSet[ grepl("mean()", colnames(mergeddataSet), fixed=TRUE) ]

extdataSet <- cbind(subject, activity, stdcols, meancols)

## ============================================================================
## 3. Uses descriptive activity names to name the activities in the data set
## ============================================================================
## Invoking assignActivityNames function ( Refer assignActivityNames.R )
extdataSet[2] <- assignActivityNames( extdataSet[2] )

## ============================================================================
## 4. Appropriately labels the data set with descriptive variable names.
## ============================================================================
##
## The column names were assigned original column names as defined in features.txt 
## Refer to step 2 above.  The dataset now has descriptive column names
##

colnames(extdataSet)[1] <- c("subjectID")
colnames(extdataSet)[2] <- c("activity")

## ============================================================================
## 5. From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
## ============================================================================

avgActivitySubject <- extdataSet %>% group_by(subjectID, activity) %>% summarise_each(funs(mean))

##
## Write the above data set to an external file 
## Using write.table() using row.names=FALSE 
##

write.table( avgActivitySubject, row.names = FALSE, file = "courseprojectoutput.txt")
