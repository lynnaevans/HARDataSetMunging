#*******************************************************************************
# Beginning Step 1. Merges the training and the test sets to create one data set
#*******************************************************************************
# Read in test data from the Working Directory
#
X_test <- read.table("X_test.txt", quote="\"")
#
# Make sure of the dimensions
#
dim(X_test)
#
# Read in test activity vector (Values = 1 through 6)
#
y_test <- read.table("y_test.txt", quote="\"")
#
# Make sure of the dimensions
#
dim(y_test)
#
# Now bind the 2947 X 1 vector of activity numbers to the 2947 X 561 data matrix
#
combined.test <- cbind(y_test, X_test)
dim(combined.test)
#
# Read in test subject vector (Values = 1 through 30)
#
subject_test <- read.table("subject_test.txt", quote="\"")
dim(subject_test)
#
# Now bind the 2947 X 1 vector of subjext numbers to the 2947 X 562 data matrix
#
final.test <- cbind(subject_test,combined.test)
#
# Repeat the above steps for the training data
#
X_train <- read.table("X_train.txt", quote="\"")
dim(X_train)
y_train <- read.table("y_train.txt", quote="\"")
dim(y_train)
combined.train <- cbind(y_train, X_train)
dim(combined.train)
subject_train <- read.table("subject_train.txt", quote="\"")
dim(subject_train)
final.train <- cbind(subject_train,combined.train)
#
# Combine the two dataframes
#
combined.data <- rbind(final.train, final.test)
dim(combined.data)
# 10299 X 563
#
# Add the column titles
#
features <- read.table("features.txt", quote="\"", stringsAsFactors=FALSE)
#
#Get the column names from the second column of features
theColumnNames <- as.data.frame(features[,2])
# Create the first two column names
firstTwoColumnNames<- as.data.frame(c("Subject", "Activity"))
#Synchronize the column names of theColumnNames and firstTwoColumnNames
names(theColumnNames)<- c("V1")
names(firstTwoColumnNames)<-c("V1")
# Add them together 
new.column.names <- rbind(firstTwoColumnNames, theColumnNames)
# Add the column names to the dataframe
names(combined.data)<-new.column.names[,1]
#*******************************************************************************
# End of Step 1. Merges the training and the test sets to create one data set.
#*******************************************************************************
# Beginning of Step 2 . Extracts only the measurements on the mean and standard 
#                       deviation for each measurement.
#*******************************************************************************

#*******************************************************************************
# End of Step 2 . Extracts only the measurements on the mean and standard 
#                 deviation for each measurement.
#*******************************************************************************
# Beginning of Step 3. Uses descriptive activity names to name the activities in
#                      the data set        
#*******************************************************************************

#*******************************************************************************
# End of Step 3. Uses descriptive activity names to name the activities in
#                      the data set        
#*******************************************************************************
# Beginning of Step 4. Appropriately labels the data set with descriptive 
#                      variable names. 
#*******************************************************************************

#*******************************************************************************
# End of Step 4. Appropriately labels the data set with descriptive variable 
#                names.            
#*******************************************************************************
# Beginning of Step 5. Creates a second, independent tidy data set with the 
#                      average of each variable for each activity and each 
#                      subject.
#*******************************************************************************

#*******************************************************************************
# End of Step 5. Creates a second, independent tidy data set with the average of 
#                each variable for each activity and each subject.
#*******************************************************************************