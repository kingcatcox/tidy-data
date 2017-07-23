# tidy-data
Coursera Getting and Cleaning Data Course Project

This is the read-me file for the course project. 

The zip file was downloaded and extracted intact to a directory. The run_analysis.R script has a path variable at the top that should point to wherever the data was restored to. This data is broken up into test and training data, both of which are formatted the same way, and several related files that fit together to form the full data set. 

Step 1

Under test and training, there were three files each. One contained all the data gathered (X), another the activity by id (Y) and the other one (subject) just had the subject data that was associated with each row. The strategy was to load the three files and find the columns together in test and training  and then concatenate the two resulting data frames to create the requested single data frame. 

Step 2

There were hundreds of measurement variables, but the assignment was to process only the mean() and std() variables. The angle related variables did not appear to fit this criteria, even though the word "mean" appeared in their names, they were apparently calculation products used by the algorithm and not actually mean and standard deviation of measurements. Using grep, the measurements were selected from the original set and the same process was used to build labels that would be applied in a later step. 

Step 3 

The activity names were stored in a file in the root of the data, which was loaded and then mapped into the formerly encoded column to make the data more readable. The original names were all uppercase, so just to make the data a little more attractive, the case was adjusted to title case. 

Step 4

The labels saved from step 2 were applied at this point. They consist of the original labels placed by the data creators and simple titles for the subject and activity columns. 

Step 5

The resulting data frame is processed into a tibble and grouped and the means of the variables taken by subject and activity. This table is then saved to disk using 

write.table(syx_data_5,"uci_tidy.dat",col.names=TRUE)

The resulting data can be read in using

read.table("usi_tidy.dat, col.names=TRUE);


The code book contains more details on the fields in the table. 


## Reference to Original Assignment

The assignment that was made is: 

## Instructions

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
Review criteria 
<ol>
  <li>The submitted data set is tidy.</li>
<li>The Github repo contains the required scripts.
<li>GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.</li>
<li>The README that explains the analysis files is clear and understandable.</li>
<li>The work submitted for this project is the work of the student who submitted it.</li>
  </ol>
## Getting and Cleaning Data Course Project 

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

<ol>
  <li>Merges the training and the test sets to create one data set.</li>
<li>Extracts only the measurements on the mean and standard deviation for each measurement.</li>
<li>Uses descriptive activity names to name the activities in the data set</li>
<li>Appropriately labels the data set with descriptive variable names.</li>
<li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
  </ol>
Good luck!


