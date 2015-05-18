library(plyr)

file_activity_labels <- "./UCI HAR Dataset/activity_labels.txt"
file_features <- "./UCI HAR Dataset/features.txt"
file_subject_test <- "./UCI HAR Dataset/test/subject_test.txt"
file_x_test <- "./UCI HAR Dataset/test/X_test.txt"
file_y_test <- "./UCI HAR Dataset/test/y_test.txt"
file_subject_train <- "./UCI HAR Dataset/train/subject_train.txt"
file_x_train <- "./UCI HAR Dataset/train/X_train.txt"
file_y_train <- "./UCI HAR Dataset/train/y_train.txt"

# read in data
labels <- read.table(file_activity_labels, col.names=c("Activity_ID","Activity_Name"))
features <- read.table(file_features, col.names=c("Feature_ID","Feature_Name"))

subject <- rbind(read.table(file_subject_test, col.names="Subject_ID"), 
                 read.table(file_subject_train, col.names="Subject_ID"))
y <-rbind(read.table(file_y_test, col.names="Activity_ID"),
          read.table(file_y_train, col.names="Activity_ID"))
x <- rbind(read.table(file_x_test),
           read.table(file_x_train))

# Label column names and select mean() and std() features
names(x) = features$Feature_Name
col <- union(grep(pattern="-mean()", x=features$Feature_Name, fixed = TRUE),
             grep(pattern="-std()", x=features$Feature_Name, fixed = TRUE))
x <- x[col]

# merge and combine datasets
master <- cbind(subject, y, x)
master <- merge(labels,master, by="Activity_ID")

# average of each column and save result to output
result <- ddply(master, .(Subject_ID, Activity_Name), colwise(mean))
write.table(result, file="Tidy_Dataset.txt", row.name=FALSE)
