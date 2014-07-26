HARDataSetMunging
=================
#Source:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - UniversitÃ degli Studi di Genova, Genoa I-16145, Italy.
activityrecognition '@'smartlab.ws
www.smartlab.ws 
*******************************************************************************
# Beginning Step 1. Merges the training and the test sets to create one data set
*******************************************************************************
 Read in test data from the Working Directory
 Make sure of the dimensions
 [1] 2947  561
 
 Read in test activity vector (Values = 1 through 6)
 Make sure of the dimensions
 [1] 2947    1
 
 Now bind the 2947 X 1 vector of activity numbers to the 2947 X 561 data matrix
 [1] 2947  562

 Read in test subject vector (Values = 1 through 30)
 [1] 2947    1

 Now bind the 2947 X 1 vector of subjext numbers to the 2947 X 562 data matrix
 [1] 2947  563

Repeat the above steps for the training data

 Dimensions for each step are:
[1] 7352  561
[1] 7352  561
[1] 7352  562
[1] 7352    1
[1] 7352  563

 Combine the two dataframes

 Correct dimension shouldbe  10299 X 563

 Add the column titles

 Get the column names from the second column of features

 Create the first two column names

 Synchronize the column names of theColumnNames and firstTwoColumnNames
 
 Rbind them together 

Add the column names to the dataframe

*******************************************************************************
# End of Step 1. Merges the training and the test sets to create one data set.
*******************************************************************************
# Beginning of Step 2 . Extracts only the measurements on the mean and standard 
#                       deviation for each measurement.
#*******************************************************************************