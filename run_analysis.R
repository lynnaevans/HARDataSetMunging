#
# Citation here
#
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
#
# Add the column titles
#
