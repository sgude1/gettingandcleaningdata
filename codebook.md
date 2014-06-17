All content from the original dataset was used as-is.  The following reproduces the original readme from 

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory

It can be found in the original downloaded readme file from:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


This section is not original content and is attributed to the above source:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


END OF REFERENCED MATERIAL



In addition to the notes from the original authors


No original column names were changed, nor were units of measurement impacted.


The following variables were developed in my analysis and include the definition

Imported names of datasets

training = /UCI HAR Dataset/train/X_train.txt
test = /UCI HAR Dataset/test/X_test.txt
ytraining = /UCI HAR Dataset/train/Y_train.txt
ytest = /UCI HAR Dataset/test/Y_test.txt
subjecttest = /UCI HAR Dataset/test/subject_test.txt
activitylabels = /UCI HAR Dataset/activity_labels.txt
subjecttrain = /UCI HAR Dataset/train/subject_train.txt
features = /UCI HAR Dataset/features.txt

Column variables introduced to complete assignment (and class where appropriate):



subject is created in training and test datasets to ID the subject number (Ordinal 1-30)
activcode is added to both datasets above to add the number of the activity for mapping to the label  (Ordinal 1-6)
activity = the label of the activity as defined by activcode above (Categorical)
mergeddata = the combined dataset of training and test
mergeddata_mean_and_std = subset of mergeddata that only includes columns with names that include std or mean
columnnames = name of columns present in the features dataset
molten2 = data for melt activity in #5 using mergeddata dataset
tidy = cast of molten2 data means to address #5 using subject+activity and column variables


