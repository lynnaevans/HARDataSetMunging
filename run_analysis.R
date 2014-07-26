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
# [1] 2947  561
#
# Read in test activity vector (Values = 1 through 6)
#
y_test <- read.table("y_test.txt", quote="\"")
#
# Make sure of the dimensions
#
dim(y_test)
# [1] 2947    1
#
# Now bind the 2947 X 1 vector of activity numbers to the 2947 X 561 data matrix
#
combined.test <- cbind(y_test, X_test)
dim(combined.test)
# [1] 2947  562
#
# Read in test subject vector (Values = 1 through 30)
#
subject_test <- read.table("subject_test.txt", quote="\"")
dim(subject_test)
#[1] 2947    1
#
# Now bind the 2947 X 1 vector of subjext numbers to the 2947 X 562 data matrix
#
final.test <- cbind(subject_test,combined.test)
dim(final.test)
#[1] 2947  563
#
# Repeat the above steps for the training data
#
X_train <- read.table("X_train.txt", quote="\"")
dim(X_train)
#[1] 7352  561
y_train <- read.table("y_train.txt", quote="\"")
dim(y_train)
#[1] 7352  561
combined.train <- cbind(y_train, X_train)
dim(combined.train)
#[1] 7352  562
subject_train <- read.table("subject_train.txt", quote="\"")
dim(subject_train)
#[1] 7352    1
final.train <- cbind(subject_train,combined.train)
dim(final.train)
#[1] 7352  563
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
# Construct a character vector of column names to keep
Keepers <- c("Subject", "Activity")
# Now look over theColumnNames for those containg either "std" or "mean" to add
# to Keepers   Keepers <- c(Keepers, "Keepit")
for (i in 1:561){
        doit <- regexpr("mean", theColumnNames[i,1])
        doit2 <- regexpr("meanFreq", theColumnNames[i,1])
        if (doit > 0 & doit2 < 0) {
                Keepers <- c(Keepers, as.character(theColumnNames[i,1]))
        }        
        doit <- regexpr("std", theColumnNames[i,1])
        if (doit > 0) Keepers <- c(Keepers, as.character(theColumnNames[i,1]))
}
# Using the column names (Keepers) generate a data frame with just the subject,
# activity, standard deviations and means columns 

combined.data.meansandstddevs <- combined.data[Keepers]
#*******************************************************************************
# End of Step 2 . Extracts only the measurements on the mean and standard 
#                 deviation for each measurement.
#*******************************************************************************
# Beginning of Step 3. Uses descriptive activity names to name the activities in
#                      the data set        
#*******************************************************************************
# Convert the activity column into a factor using the labels provided in
# activity_labels.txt
combined.data.meansandstddevs[,2]<-
        as.character(combined.data.meansandstddevs[,2])
combined.data.meansandstddevs[,2]<- 
        factor(combined.data.meansandstddevs[,2], 
               labels = c( "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", 
                           "SITTING", "STANDING", "LAYING"))
#*******************************************************************************
# End of Step 3. Uses descriptive activity names to name the activities in
#                      the data set        
#*******************************************************************************
# Beginning of Step 4. Appropriately labels the data set with descriptive 
#                      variable names. 
#*******************************************************************************
# Remove the parentheses
newnames<-names(combined.data.meansandstddevs)
newnames<-gsub("\\(","", newnames)
newnames<-gsub("\\)","", newnames)
#Replace the dash with an underscore
newnames<-gsub("\\-","_", newnames)
#Replace commas with an underscore
newnames<-gsub("\\,","_", newnames)
#Replace names
names(combined.data.meansandstddevs)<-newnames
#*******************************************************************************
# End of Step 4. Appropriately labels the data set with descriptive variable 
#                names.            
#*******************************************************************************
# Beginning of Step 5. Creates a second, independent tidy data set with the 
#                      average of each variable for each activity and each 
#                      subject.
#*******************************************************************************
# Use the aggregate function to create a dataframe with the means and std dev 
# for each of the subject's activities.  Export it with a write.table.
tidydata<- aggregate(x=combined.data.meansandstddevs[,3:68], 
                     by=list(combined.data.meansandstddevs$Subject, 
                             combined.data.meansandstddevs$Activity),FUN=mean)
write.csv(tidydata, file = "tidydata.txt")
#*******************************************************************************
# End of Step 5. Creates a second, independent tidy data set with the average of 
#                each variable for each activity and each subject.
#*******************************************************************************