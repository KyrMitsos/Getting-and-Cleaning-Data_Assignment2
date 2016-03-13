# Install and load required packages
list.of.packages <- c("reshape2")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
require(reshape2)

# Load train data
trainX_raw<-read.table("./DATA/train/X_train.txt")
trainY_raw<-read.table("./DATA/train/y_train.txt")
# Load test data
testX_raw<-read.table("./DATA/test/X_test.txt")
testY_raw<-read.table("./DATA/test/y_test.txt")

# Retrieve name of features (column headers)
features<-read.table("./DATA/features.txt")[2]

# Retrieve name of features (column headers)
activity_labels<-read.table("./DATA/activity_labels.txt")[2]

# Retrieve Subject IDs 
subj_train<-read.table("./DATA/train/subject_train.txt")
subj_test<-read.table("./DATA/test/subject_test.txt")

# 1.Merges the training and the test sets to create one data set.
train_dataset<-cbind(subj_train,trainX_raw,trainY_raw)
test_dataset<-cbind(subj_test,testX_raw,testY_raw)
all_data<-rbind(train_dataset,test_dataset)

# 4.Appropriately labels the data set with descriptive variable names.
dtset_labels <- c("Subject_ID", as.character(features$V2), "Activity")
names(all_data) <- dtset_labels

# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_data<-all_data[,grep("-mean()",names(all_data),fixed=TRUE)]
std_data<-all_data[,grep("-std()",names(all_data),fixed=TRUE)]
extr_data<-cbind(all_data$Subject_ID,mean_data,std_data, all_data$Activity)
names(extr_data)[1] <-"Subject_ID"
names(extr_data)[ncol(extr_data)] <-"Activity"

# 3.Uses descriptive activity names to name the activities in the data set
extr_data$Activity<-sapply(extr_data$Activity, function(x) activity_labels$V2[x])

# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
extr_melt<-melt(extr_data,
                id=c(names(extr_data)[1],names(extr_data)[ncol(extr_data)]),
                measure.vars=c(names(extr_data)[2:(ncol(extr_data)-1)]))

tidy_data<-dcast(extr_melt,Subject_ID + Activity~variable,mean)

