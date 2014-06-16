contains the submission for the getting and cleaning data course assignment.

Contents are 

run_analysis.R script for reproducing the output

and

tidy.txt which is the tidy dataset to address question # 5 on the assignment.  It will created by the script


To run the script you must have downloaded the following dataset into your working directory for R: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Steps to download and unzip are contained in the script but are commented out.

Packages live in the creation environment were:  datasets, reshape, stats and utils.

The steps of the assignment were run out of order and are noted with comments in the script.


Steps to reproduce

Gets dataset but assume code not necessary based on instructions
#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl, destfile="dataset.zip")
#unzip("dataset.zip")

Reads the necessary files for the analysis:

The variables and contents are listed below for reference

training = /UCI HAR Dataset/train/X_train.txt
test = /UCI HAR Dataset/test/X_test.txt
ytraining = /UCI HAR Dataset/train/Y_train.txt
ytest = /UCI HAR Dataset/test/Y_test.txt
subjecttest = /UCI HAR Dataset/test/subject_test.txt
activitylabels = /UCI HAR Dataset/activity_labels.txt
subjecttrain = /UCI HAR Dataset/train/subject_train.txt
features = /UCI HAR Dataset/features.txt

subject is created in training and test datasets to ID the subject number
activcode is added to both datasets above to add the number of the activity for mapping to the label

activity = the label of the activity as defined by activcode above

mergeddata = the combined dataset of training and test
mergeddata_mean_and_std = the dataset for #2 that only includes columns with mean or std labels

columnnames = name of columns present in the features dataset for use on #5

molten2 = data for melt activity in #5 using mergeddata dataset
tidy = cast of molten2 data means to address #5 using subject+activity and column variables
