# GACproject
Coursera Getting and Cleaning data Project

Important:
1. Because of a project submission requirement the raw data files are required to be in the working directory with the script "run_analysis.R". Please extract and then maintain the structure and naming from the zip archive.  For example: <your_working_directory>/UCI_HAR_Dataset/train/y_train.txt

2. If you wish to run the script download the raw data files in .zip archive from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

3. As a result of running the script "run_analysis.R" a file called "summary.txt" containing the resulting data table will be created in the working directory.  This file could be read directly into R using the following, for example:  
data <- read.table("summary.txt", header = TRUE)

4. If you wish to run the script you could run it as follows: 
d <- run_analysis()

Notes:


References:
The requirements of the project were made much clearer thanks to David Hood's wonderful blog here:
https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

