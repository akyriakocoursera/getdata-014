x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")

activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c("activity_id", "activity") 

features <- read.table("features.txt")
columns <- features[grepl("mean|std", features[,2]) , ]

x_data <- rbind(x_train, x_test)

y_data <- rbind(y_train, y_test)
y_data[, 1] <- activity_labels[y_data[, 1], 2]
names(y_data) <- c("activity")

subject_data <- rbind(subject_train, subject_test)
names(subject_data) <- c("subject")

measurements <- x_data[,columns$V1]
names(measurements) <- columns[, 2]

measurements <- cbind(measurements, subject_data)
measurements <- cbind(measurements, y_data)
averages_data <- aggregate(measurements, by=list(activity = measurements$activity, subject=measurements$subject), mean)
write.table(averages_data, "averages_data.txt", row.name=FALSE)

