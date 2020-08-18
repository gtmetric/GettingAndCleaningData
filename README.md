# Getting And Cleaning Data
The script, "run_analysis.R", contains four main parts. 
1. It reads all the raw data including the activity labels, features, X train, y train, subject train, X test, y test, and subject test into R.
2. It prepares the data by changing the variable names of X train and X test, matching the activity labels with y test and y train, and appending the activity labels of y test and y train and the subjects of the test and train to X test and X train respectively.
3. It forms a complete tidy data set by appending the test data to the train data, filtering the variables to get only the means and the standard deviations, and grouping them by the activity and the subject.
4. It creates the second, independent tidy data set with the average of each variable for each activity and each subject by calling summarize_all() to calculate the means, then it writes the data set into a text file by calling write.table().
