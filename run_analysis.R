library(dplyr)

act <- read.table('UCI HAR Dataset/activity_labels.txt')
feat <- read.table('UCI HAR Dataset/features.txt')

x_train <- read.table('UCI HAR Dataset/train/X_train.txt')
colnames(x_train) <- tolower(feat$V2)
y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
y_train <- merge(y_train, act, by.x = 'V1', by.y = 'V1', sort = FALSE)
sub_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
train <- cbind(x_train, activity = tolower(y_train$V2), subject = sub_train$V1)

x_test <- read.table('UCI HAR Dataset/test/X_test.txt')
colnames(x_test) <- tolower(feat$V2)
y_test <- read.table('UCI HAR Dataset/test/y_test.txt')
y_test <- merge(y_test, act, by.x = 'V1', by.y = 'V1', sort = FALSE)
sub_test <- read.table('UCI HAR Dataset/test/subject_test.txt')
test <- cbind(x_test, activity = tolower(y_test$V2), subject = sub_test$V1)

data <- rbind(train, test)
tidy <- data[, c(grep('mean\\(|std\\(', colnames(data)), 562, 563)]
byactsub <- group_by(tidy, activity, subject)
final <- summarize_all(byactsub, 'mean')
write.table(final, file = 'output.txt', row.name = FALSE)