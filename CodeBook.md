CodeBook.md describes the variable, data, and transformations used in for this project.

A full description of the data used in this project can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

The data can be found at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Attribute Information (For each record in the dataset, the following are provided):
-Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
-Triaxial Angular velocity from the gyroscope.
-A 561-feature vector with time and frequency domain variables.
-Its activity label.
-An identifier of the subject who carried out the experiment.

METHOD:

1) Read data and assign names. Date files include: activity_labels.txt, features.txt, subject_test.txt, X_test.txt, y_test.txt, subject_train.txt, X_train.txt, and y_train.txt. Names are assigned to make data more readable.

2) Merge test and train data sets. Train and test data sets consist of three respective files that are bound together.  X_, y_, and subject_ are the respective prefixes that compose the datasets.

3) Pull mean and standard deviation measurements.  This is done by with the grepl function.  A subset of the data is taken of only the necessary columns.

4) Assign activity names.  This is done by merging the data from activity_labels and then cleaning out unnecessary information.  The gsub function is used for pattern replacement to clean up data labels.

5) Consolidate relevent data into a new, readable dataset.  This data is output in a new file.
