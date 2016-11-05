# GACproject
Coursera Getting and Cleaning data Project

Important:

1. Because of a project submission requirement the raw data files are required to be in the working directory with the script "run_analysis.R". Please extract and then maintain the structure and naming from the zip archive.  For example: <your_working_directory>/UCI_HAR_Dataset/train/y_train.txt

2. If you wish to run the script download the raw data files in .zip archive from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

3. As a result of running the script "run_analysis.R" a file called "summary.txt" containing the resulting data table will be created in the working directory.  This file could be read directly into R using the following, for example:  
data <- read.table("summary.txt", header = TRUE)

4. If you wish to run the script you could run it as follows: 
d <- run_analysis()

5. Please refer to CodeBook.md within this repository for specific information regarding the data transformation and manipulation.

6. Refer also to README.txt and features_info.txt within the raw data archive for information regarding the raw data.

Assumptions and notes for markers:
I have reduced the data to the subject, the activity, and 66 X variables.
Following the project requirement of only including mean and standard deviation variables I first reduced to any variable containing "mean" or "std" in the name and then further eliminated the "meanFreq" columns and the means calculated from the angle, such as tBodyAccMean.  The X variable names have not been modified, apart from tidying up (removing brackets, etc) as I felt unqualified to give better simplified names.  The names are abbreviated which perhaps goes against the principles of Tidy data but given the quantity of variables and the provision of the "features_info.txt" file within the raw data archive I decided against expanding these abbreviations.  For example, 'tbodyacc.mean.X' could be expanded to something like 'mean of time domain body acceleration in X direction". Without further information regarding what the data would be used for I feel this is a fair assumption and will allow a demonstration of cleaning and tidying data.

The resulting data table therefore contains the average of each of the remaining 66 X variables with respect to each activity undertaken by each subject.  There are 30 participants undertaking 6 different activities and therefore 30 x 6 = 180 rows and 68 columns.

References:

The requirements of the project were made much clearer thanks to David Hood's very helpful blog which can be accessed here:
https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

Hadley Wickham's Tidy Data paper was invaluable
http://vita.had.co.nz/papers/tidy-data.pdf
