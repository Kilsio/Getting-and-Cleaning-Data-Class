Getting and Cleaning Data Class Project
By John Panzer

### Steps to successfully execute the R script run_anaysis.R 

1. Download the source data from the respository and place within the working directory along with the run_analysis.R file.
The original source data can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip with full description of the data at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

2. The following text files must be in R's working directory to execute the script.

-x_train.txt

-x_test.txt

-y_train.txt

-y_test.txt

-subject_train.txt

-subject_test.txt

-features.txt

-activity_labels.txt

*Additionally the dplyr package must be installed in your R library.

The run_analysis.R script utilizes the following methodology to take the initial dataesets and transform the datasets into a summarized output csv file providing the mean for all predictor variables containing the mean or standard deviation of the original predictor variables. 
These variables are averaged for each Subject and for each Activity providing a datatable within the csv containing 180 observations (30 subjects x 6 Activites) with 48 columns (Subject ID, Activity, and 46 predictor variable)

Script Algorithim:
1) Read text files in as datatables 
2) Consolidate test and train sets into individual datatables for predictor, response, and subject variables
3) Assign Descriptive Variable names to Activities and Subjects 
  a) Activies include Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, and Laying
  b) 30 Subjects participated in the original study
4) Reduce number of predictor variables to only include measurements on the mean and standard deviation for each measurement * Identified by mean() or sd() within original dataset
5) Combine predictor, response, and subject variables into a single dataframe
6) Establish each subject and activity as a factor variable
7) Rename predictor variables with more descriptive variable names
8) Create a second tidy dataset containing the mean for each predictor variable across all observations for each Subject and Activities
9) Write tidy dataframe as a text file

### Output Text 

The output file will contain the following variable names.

Subject ID

Activity

(In time) Body acceleration signal from accelerometer- Mean of X dim

(In time) Body acceleration signal from accelerometer- Mean of Y dim

(In time) Body acceleration signal from accelerometer- Mean of Z dim

(In time) Gravity acceleration signal from accelerometer- Mean of X dim

(In time) Gravity acceleration signal from accelerometer- Mean of Y dim

(In time) Gravity acceleration signal from accelerometer- Mean of Z dim

(In time) Body acceleration signal from accelerometer [Jerk signal]- Mean of X dim

(In time) Body acceleration signal from accelerometer [Jerk signal]- Mean of Y dim

(In time) Body acceleration signal from accelerometer [Jerk signal]- Mean of Z dim

(In time) Body acceleration signal from gyroscope- Mean of X dim

(In time) Body acceleration signal from gyroscope- Mean of Y dim

(In time) Body acceleration signal from gyroscope- Mean of Z dim

(In time) Body acceleration signal from gyroscope [Jerk signal]- Mean of X dim

(In time) Body acceleration signal from gyroscope [Jerk signal]- Mean of Y dim

(In time) Body acceleration signal from gyroscope [Jerk signal]- Mean of Z dim

(In time) Body acceleration signal from accelerometer applied to Fast Fourier Transform  Mean

(In time) Gravity acceleration signal from accelerometer applied to Fast Fourier Transform  Mean

(In time) Body acceleration signal from accelerometer [Jerk signal] applied to Fast Fourier Transform  Mean

(In time) Body acceleration signal from gyroscope applied to Fast Fourier Transform  Mean

(In time) Body acceleration signal from gyroscope [Jerk signal] applied to Fast Fourier Transform  Mean
(In frequency) Body acceleration signal from accelerometer- Mean of X dim

(In frequency) Body acceleration signal from accelerometer- Mean of Y dim

(In frequency) Body acceleration signal from accelerometer- Mean of Z dim

(In frequency) Body acceleration signal from accelerometer- Mean Freq. of X dim

(In frequency) Body acceleration signal from accelerometer- Mean Freq. of Y dim

(In frequency) Body acceleration signal from accelerometer- Mean Freq. of Z dim

(In frequency) Body acceleration signal from accelerometer [Jerk signal]- Mean of X dim

(In frequency) Body acceleration signal from accelerometer [Jerk signal]- Mean of Y dim

(In frequency) Body acceleration signal from accelerometer [Jerk signal]- Mean of Z dim

(In frequency) Body acceleration signal from accelerometer [Jerk signal]- Mean Freq. of X dim

(In frequency) Body acceleration signal from accelerometer [Jerk signal]- Mean Freq. of Y dim

(In frequency) Body acceleration signal from accelerometer [Jerk signal]- Mean Freq. of Z dim

(In frequency) Body acceleration signal from gyroscope- Mean of X dim

(In frequency) Body acceleration signal from gyroscope- Mean of Y dim

(In frequency) Body acceleration signal from gyroscope- Mean of Z dim

(In frequency) Body acceleration signal from gyroscope- Mean Freq. of X dim

(In frequency) Body acceleration signal from gyroscope- Mean Freq. of Y dim

(In frequency) Body acceleration signal from gyroscope- Mean Freq. of Z dim

(In frequency) Body acceleration signal from accelerometer applied to Fast Fourier Transform  Mean

(In frequency) Body acceleration signal from accelerometer applied to Fast Fourier Transform  Mean Freq.

(In frequency) Body acceleration signal from accelerometer [Jerk signal] applied to Fast Fourier Transform  Mean

(In frequency) Body acceleration signal from accelerometer [Jerk signal] applied to Fast Fourier Transform  Mean Freq.

(In frequency) Body acceleration signal from gyroscope applied to Fast Fourier Transform  Mean

(In frequency) Body acceleration signal from gyroscope applied to Fast Fourier Transform  Mean Freq.

(In frequency) Body acceleration signal from gyroscope [Jerk signal] applied to Fast Fourier Transform  Mean

(In frequency) Body acceleration signal from gyroscope [Jerk signal] applied to Fast Fourier Transform  Mean Freq.
