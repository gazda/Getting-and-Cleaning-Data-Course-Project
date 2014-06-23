library(reshape2)

# read in the training data
X_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')

# read in the training data
X_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')

# reading feature names
features <- read.table('./UCI HAR Dataset/features.txt')

# reading activity labels
activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt')

# combining train and test sets
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# naming columns
names(activity_labels) = c('Activity.No', 'Activity.Name')
names(y) = c('Activity.No')
names(subject) = c('Subject.No')

# selecting features that have mean() and std() in there names
features_selected <- features[grep('(mean|std)\\(\\)', features[,2]),]

# renaming features to be suitable column names
features_selected[,2] <- gsub('mean\\(\\)', 'Mean', features_selected[,2])
features_selected[,2] <- gsub('std\\(\\)', 'Std', features_selected[,2])
features_selected[,2] <- gsub('^t', 'Time.', features_selected[,2])
features_selected[,2] <- gsub('^f', 'Freq.', features_selected[,2])
features_selected[,2] <- make.names(features_selected[,2])

# extracting columns of selected features
data <- X[,features_selected[,1]]
# setting names of the selected columns
names(data) = features_selected[,2]

# combining label numbers, subjects and feature data
data <- cbind(y, subject, data)
# merging in the label names of the activity
data <- merge(activity_labels, data)
# dropping Activity.No column
data <- data[, -c(1)]

# melting data in long form
data.long <- melt(data, id.vars = c('Activity.Name', 'Subject.No'))
# creating average of each variable for each activity and each subject
tidy <- dcast(data.long, Activity.Name + Subject.No ~ variable, mean)

# writting tidy data to file
write.table(tidy, file = 'tidy_data_set.txt', row.names = FALSE)
