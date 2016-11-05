# run_analysis.R
# Nicholas Jackson 2016
# Coursera Getting and Cleaning Data project
# https://www.coursera.org/learn/data-cleaning
#       /peer/FIZtT/getting-and-cleaning-data-course-project
# Data obtained from: 
# https://d396qusza40orc.cloudfront.net
#       /getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# This script and other relevant files available on github:
#       https://github.com/njacko/GACproject

# using dplyr package
library(dplyr)


# must be run from the same working directory as the input data files
run_analysis <- function() {

        # load the data - according to the project specification the dataset
        # files should all be in the working directory in their subfolders.
        subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
        y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
        X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
        subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
        y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
        X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
        
        # wrap these tables in dplyr tbl_df
        subject_train <- tbl_df(subject_train)
        y_train <- tbl_df(y_train)
        X_train <- tbl_df(X_train)
        subject_test <- tbl_df(subject_test)
        y_test <- tbl_df(y_test)
        X_test <- tbl_df(X_test)
        
        # rename the columns in the y and subject frames so they won't clash 
        # when merging
        y_train <- rename(y_train, activity=V1)
        y_test <- rename(y_test, activity=V1)
        subject_train <- rename(subject_train, subject=V1)
        subject_test <- rename(subject_test, subject=V1)
        
        # combine all the test data together and all the train data together
        # first column will be subject, then activity, then all the X variables
        # also turn these back into tbl_df again
        train <- tbl_df(cbind(subject_train, y_train, X_train))
        test <- tbl_df(cbind(subject_test, y_test, X_test))
        
        # combine train and test data together, train data on top
        data <- rbind(train, test)
        
        # load in the features names from file and rename the columns so that 
        # the X variables have their names from features.txt
        features <- tbl_df(read.table("UCI HAR Dataset/features.txt", 
                                      stringsAsFactors = FALSE))
        names(data) <- c("subject", "activity", features$V2)
        
        # some of the column names cause problems with dpylr so convert to valid
        validnames <- make.names(names=names(data), unique=TRUE, allow_ = TRUE)
        
        # replace multiples of "." with a single "."
        validnames <- gsub("\\.\\.\\.", "\\.", validnames)
        validnames <- gsub("\\.\\.", "\\.", validnames)
        
        # convert to lowercase
        validnames <- tolower(validnames)
        
        # now update the names in data itself
        names(data) <- validnames
        
        # select only the columns that contain "mean" or "std"
        data <- select(data, subject, activity, 
                       contains("mean"), contains("std"))
        # remove columns that contain "meanFreq" and the angle means
        data <- select(data, -contains("meanFreq"))
        data <- select(data, -contains("angle"))
        
        # load the activity names file and convert the activity column values
        # from integers to names
        activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
        
        # make a temporary column containing the activity labels matched with 
        # the activity number from the data frame.
        # This could be done using merge instead i think
        tempcol <- character(length(data$activity))
        for (i in 1:length(data$activity)) {
                tempcol[i] <- as.character(activity_labels[data$activity[i],2])
        }
        
        # replace the data frame column of integers with the 
        # corresponding column of activity labels that we stored in tempcol
        data <- mutate(data, activity=tempcol)
        
        # group by subject and activity
        data <- group_by(data, subject, activity)
        
        # summarise for each activity for each subject the mean of each of the
        # variables
        data <- summarize_each(data, funs(mean))
        
        # write out this modified data as a table to a file within datadir
        # called "summary.txt"
        write.table(data, file = "summary.txt", row.name=FALSE)
        
        # This data can be read back into R using the following command
        # data <- read.table(file, header = TRUE)
        # where 'file' includes the full or relative path
        
        # return the final data set
        data
        
}
