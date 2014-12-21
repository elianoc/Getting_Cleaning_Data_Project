#Getting and Cleaning Data 
#Course Project
#Dec 21, 2014

#Creating a tidy set from .txt files

#1.Merge the training and the test sets to create one data set.
#2.Extract only the measurements on the mean and standard deviation for each measurement. 
#3.Use descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 
#5.From the data set in step 4, creates a second, independent tidy data set 
#  with the average of each variable for each activity and each subject.

### setwd("~/R_class")

library(downloader)
library(reshape2)

#file download and unzip commented out so it will not be repeated
# get data: 
###fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#unzip file within working directory using:
###download(fileUrl, dest= "Project.zip", mode = "wb")
###unzip("Project.zip", exdir = "./Project_zipfiles")

#read data from UCI HAR Dataset and label unlabelled columns 
setwd("~/R_class/Project_zipfiles/UCI HAR Dataset")
Activity <- read.table("activity_labels.txt", col.names = c("Activity_ID", "Activity_label")) #dim() = [1] 6   2
Features <- read.table("features.txt", col.names = c("Feature_ID", "Feature_Vector_variable")) #dim() = [1] 561   2

setwd("~/R_class/Project_zipfiles/UCI HAR Dataset/test")
SubjectTest <-read.table("subject_test.txt", col.names = c("SubjectID")) #dim() = [1] 2947    1
Xtest<- read.table("x_test.txt", col.names = Features[,2]) #dim() = [1] 2947  561
Ytest<- read.table("y_test.txt", col.names = "Activity_ID") #dim() =  [1] 2947    1

setwd("~/R_class/Project_zipfiles/UCI HAR Dataset/train")
SubjectTrain <-read.table("subject_train.txt", col.names = c("SubjectID")) #dim() = [1] 7352    1
Xtrain<- read.table("x_train.txt", col.names = Features[,2]) #dim() = [1] 7352  561
Ytrain<- read.table("y_train.txt", col.names = "Activity_ID") #dim() = [1] 7352    1

#Clip train and test data
TrainBind <- cbind(SubjectTrain, Ytrain, Xtrain) #dim() = [1] 7352  563
TestBind <- cbind(SubjectTest, Ytest, Xtest) # dim() = [1] 2947  563

#Part 1.
#binding Train and test data (dim() = [1] 10299   563)
Train_Test <- rbind(TrainBind, TestBind)

#Part 2.
#Extract mean and standard deviation measurements
#get only columns that end in ".mean" or ".std"
Stats <- grep( "(mean\\.)|std", names(Train_Test), ignore.case=FALSE, value = TRUE)
StatsSub <- cbind(Train_Test[, 1:2], Train_Test[, Stats]) #dim() = [1] 10299    68

#Part 3. 
#Adding discriptive label to activity
StatsSubActivity<- within(StatsSub, Activity_ID <- factor(Activity_ID, levels = c(1, 2, 3, 4, 5, 6), labels=Activity[,2]))

#Part 4.
#Added Features as labels in Part 1. 
#Appropriately label the data set with descriptive variable names. 
names(StatsSubActivity) <- gsub("^t","Time.",names(StatsSubActivity))
names(StatsSubActivity) <- gsub("^f","Freq.",names(StatsSubActivity))
names(StatsSubActivity) <- gsub("Acc",".Accelerometer.",names(StatsSubActivity), ignore.case = FALSE)
names(StatsSubActivity) <- gsub("Gyro",".Gyroscope.",names(StatsSubActivity), ignore.case = FALSE)
 
#Part 5.
#create a second tidy data set with the 
#average of each variable for each subject for each activity
#6 activities multiply by 30 subjects = 180 rows by 68 variables.

DataMelt <- melt(StatsSubActivity, id=1:2, measure.vars=3:68)
DataCast <- dcast(DataMelt, SubjectID + Activity_ID ~ variable, mean) #dim()= [1] 180  68

#make a text file with write.table()
setwd("~/R_class/Project_zipfiles")
write.table(DataCast, file = "TidyDataProject.txt", row.name=FALSE)
