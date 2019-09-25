BACKGROUND:

The purpose of this project is to demonstrate collecting, working with, and cleaning a data set.

The criteria to satisfy are as follows:
1) The submitted data set is tidy.
2) The Github repo contains the required scripts.
3) GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4) The README that explains the analysis files is clear and understandable.
5) The work submitted for this project is the work of the student who submitted it.

DATASET BACKGROUND & INFORMATION:

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

ANALYSIS:

The R script called run_analysis.R does the following:
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Additional information about the variables, data, and transformations is available in CodeBook.MD.
