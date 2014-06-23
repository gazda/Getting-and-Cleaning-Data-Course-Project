Getting and Cleaning Data Course Project
========================================

## Course Project Task

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
Good luck!

## File Description

There are two R script files present.
Script `fetch.R` is used to download and unpack the original data for the project.
Script `run_analysis.R` conducts data analysis as requested in Course Project Task section and as described in Conducted Analysis section.

Textual file `tidy_data_set.txt` contains the cleaned version of the original data set. This file is the output of the `run_analysis.R` script and can be recreated by running it.

This data file can be read into R with following command:

```R
tidy <- read.table('tidy_data_set.txt', header = TRUE, sep = ' ')
```

File `CodeBook.md` contains the description of the variables present in the tidy data set.

# , and any transformations or work that you performed to clean up the data

## Prerequisites

In order for `run_analysis.R` script to run successfuly it is needed to place the original data set in current working directory in subdirectory `UCI HAR Dataset`. This can be done by manually downloading and unpacking zip file or by running the `fetch.R` script.

## Conducted Analysis

The purpose of the `run_analysis.R` script was to analyse and create a tidy data set and then generate a tidy data text file that meets the principles from [Hadley Wickham Tidy data paper](http://vita.had.co.nz/papers/tidy-data.pdf) which are also discussed in the thread [Long Data, Wide Data, and Tidy Data for the Assignment](https://class.coursera.org/getdata-004/forum/thread?thread_id=262) on official course discussion forum.

Following step are conducted by `run_analysis.R` script to produce tidy data set.

1. Training data is read in `X_train`, `y_train` and `subject_train` variables. 
1. Test data is read in `X_test`, `y_test` and `subject_test` variables. 
1. Feature names are read in `features` variable from `features.txt` file.
1. Activity labels are read in `activity_labels` variable from `activity_labels.txt` file.
1. Training and test sets are combined
  * variable `X` contains all train and test observations
  * variable `y` contains all train and test labels
  * variable `subject` contains all train and test subjects
1. Naming of columns is done:
  * columns of `activity_labels` are named `Activity.No` and `Activity.Name`
  * column of `y` is named `Activity.No`
  * column of `subject` is named `Subject.No`
1. Features that have mean() and std() in there names are selected in `features_selected` variable. Features with meanFreq() are not selected as they have a different meaning.
1. Feature are renamed to be suitable column names according to the following rules:
  * `mean()` is replaced with `Mean`
  * `std()` is replaced with `Std`
  * initial `t` is replaced with `Time.`
  * initial `f` is replaced with `Freq.`
  * and finally they are converted into valid names with `make.names` method. This has mostly changed `-` to `.`.
1. New data.frame `data` is created from selected features of the `X`.
1. Columns of `data` data.frame are named with cleaned feature names. 
1. Combined label numbers, subjects and feature data.
1. Merged `activity_labels` and `data` via `Activity.No` column thus adding `Activity.Name` to data.frame.
1. Dropping `Activity.No` column as it is no longer needed.
1. `data` data.frame is melted into long form with `Activity.Name` and `Subject.No` as `id.vars`
1. New tidy data set is constructed with average of each variable for each activity and each subject.
1. New tidy data set is written to tidy data file.
