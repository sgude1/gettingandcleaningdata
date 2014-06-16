


#Gets dataset but assume code not necessary based on instructions
#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl, destfile="dataset.zip")
#unzip("dataset.zip")

#From the working directory that contains the donwnloaded dataset:
#Read the necessary files for the analysis:

training<-read.table("./UCI HAR Dataset/train/X_train.txt", sep="")
test<-read.table("./UCI HAR Dataset/test/X_test.txt", sep="")


ytraining<-read.table("./UCI HAR Dataset/train/Y_train.txt", sep="")
ytest<-read.table("./UCI HAR Dataset/test/Y_test.txt", sep="")

subjecttest<-read.table("./UCI HAR Dataset/test/subject_test.txt", sep="")
activitylabels<-read.table("./UCI HAR Dataset/activity_labels.txt", sep="")
subjecttrain<-read.table("./UCI HAR Dataset/train/subject_train.txt", sep="")
features<-read.table("./UCI HAR Dataset/features.txt", sep="")


#The items from the assignment will be noted below with the number and description as described
#They will not be performed in order

#4.  Appropriately labels the data set with descriptive variable names. 
#add column headers from features to test and training datasets
colnames(test)<-features[,2]
colnames(training)<-features[,2]

#add person tested to test and training to prepare data for question 5
test["subject"]<-subjecttest[,1]
training["subject"]<-subjecttrain[,1]

#3. Uses descriptive activity names to name the activities in the data set
#add the activity code from y test to both datasets
test["activcode"]<-ytest[,1]
training["activcode"]<-ytraining[,1]

#map the activity name based on the activity code
test["activity"]<-activitylabels$V2[match(test$activcode, activitylabels$V1)]
training["activity"]<-activitylabels$V2[match(training$activcode, activitylabels$V1)]

#results can be viewed in mergeddata after defined in #1 below

#Not used for analysis to identify records as either test or training records
#test["dataset"]<-"test"
#training["dataset"]<-"training"

#1. Merges the training and the test sets to create one data set.
#creates mergeddata to combine training and test datasets
#intersect(names(training), names(test))
mergeddata=merge(training,test, all=TRUE)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#Assume this means that we only care about columns that contain the labels of mean or std
#mergeddata_mean_and_std removed columns that do not contain mean or std 
mergeddata_mean_and_std <- mergeddata[, grep("mean|std", colnames(mergeddata))]



#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#returns to mergeddata dataset since it still has all variables
library(reshape)
columnnames<-features$V2
molten2<-melt(mergeddata, id=c("subject", "activity"), measure.vars=columnnames)
tidy<-cast(subject + activity ~variable, data=molten2, fun=mean)
write.csv(tidy, file="tidy.txt", row.names=FALSE)
