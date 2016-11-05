Coursera Getting and Cleaning Data Project
Code Book

This code book briefly explains the raw data provided and the tranformations and manipulations performed by the script 'run_analysis.R' found within this repository.

The experiment:

Participants wore Samsung Galaxy S II smartphones whilst undertaking various activities. The data was recorded and the activity the participant was undertaking at a given time was noted by a monitor.
Further information is available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data was obtained from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Raw data:

Raw sensor acceleration and angular velocity signals were processed and sampled and then variables were calculated from the time and frequency domain. These variables are in the form of a 561-feature vector. In addition, there are data indicating the particular activity the particular subject was undertaking.  The data was broken up into a training set and a testing set.

For more detailed information about the specific files and processing please see the README.txt file within the raw data archive.


Modifcations peformed by 'run_analysis.R':
- Tables were merged so that the subject and the activity and the feature vector were all combined.
- Training and Testing datasets were combined, training before testing.
- Columns were labeled: 'subject' and 'activity' indicating the subject and activity respectively and the feature columns labeled based on the 'features.txt' file provided in the raw data archive.
- These names were then tidied up, firstly by replacing characters that were invalid for dplyr with period characters ('.') and then by removing duplicates of these.  Then, all characters were converted to lower case.
- As per the project requirements, features that were not mean or standard deviation were removed. In addition, meanFreq features and the means calculated from the angle, such as tBodyAccMean were removed. These perhaps could arguably have been kept but for the purposes of demonstrating data tidying perhaps it's not important either way.
- The numerical activity indicator was replaced by the relevant descriptive indicator as per the file "activity_labels.txt". This was done using a for loop but perhaps could have been done more efficiently using merge().
- Step 4 of the Project Requirements states that the data should be labelled with descriptive variable names. It was decided not to expand on the abbreviated naming provided in the 'features.txt' file contained in the raw data archive. Expansion could be very unwieldy. For example, 'tbodyaccjerk.mean.x' is the 'mean body acceleration jerk in the x direction in the time domain'.
- the data was then grouped by subject and activity and summarized by mean.  So for each activity undertaken by each subject we have the mean for each feature variable during the entire time that particular activity was undertaken by that particular subject.
- the units are unchanged from the raw data, which had been normalized.
- the data was then written to a file

