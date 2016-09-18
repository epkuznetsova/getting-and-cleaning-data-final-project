rm(list=ls())
##1.
## loading labels,features test & train sets:

labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
subject_train = read.table('train/subject_train.txt',header=FALSE); #imports subject_train.txt
subject_test = read.table('test/subject_test.txt',header=FALSE); #imports subject_test.txt
X_train  = read.table('train/X_train.txt',header=FALSE); #imports x_train.txt
y_train  = read.table('train/y_train.txt',header=FALSE); #imports y_train.txt
X_test  = read.table('test/X_test.txt',header=FALSE); #imports x_test.txt
y_test  = read.table('test/y_test.txt',header=FALSE); #imports y_test.txt

##2.
## creating 'x', 'y' and 'subject' df-s:

X_df <- rbind(X_train, X_test)
y_df <- rbind(y_train, y_test)
subject_df <- rbind(subject_train, subject_test)


# Extract only the mean and standard deviation values for each measurement


# substract only columns with mean() or std():
Features_Mean_STD <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the required columns
X_df <- X_df[, Features_Mean_STD]

# correcting the column names
names(X_df) <- features[Features_Mean_STD, 2]


##3.
# Use descriptive activity names to name the activities in the data set


# update values with correct activity names
y_df[, 1] <- labels[y_df[, 1], 2]

# correct column name
names(y_df) <- "exercise"


# Appropriately label the data set with descriptive variable names


# correct column name
names(subject_df) <- "subject"

# bind all the data in a single data set
xySub <- cbind(X_df, y_df, subject_df)

# creating final tidy data set and writing it:



library(plyr)
library(reshape2)
averages_dset <- ddply(xySub, .(subject, exercise), function(x) colMeans(x[, 1:66]))

write.table(averages_dset, "averages_dset.txt", row.name=FALSE)


