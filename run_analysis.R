#
#
# run_analysis.R 
#
# Final project for coursera course on clean and tidy data
#
# the purpose of this script is to perform the following tasks on data provided:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.
#
# The data comes from a study named "Human Activity Recognition Using Smartphones Dataset" Version 1.0
#
# The readme file with the data explains the individual files that were supplied. 
#
# Recipe to build the data
#
# Setup working environment 
library(readr)
library(dplyr)
library(lubridate)
library(tools)
#
# I like this handy concatenation operator
'%.%' <- function(x, y)paste0(x,y)
# 
# Step 0 - Get the data into R 
#
# The dataset was unzipped into the original data structure and loaded into R as follows:
UCI_DATA<-"~/datascience/UCI_HAR_Dataset"
#
#    x_test contains individual observation variables and y_test matches the activities to the observations
#    s_test matches the subjects to the observations
#
x_test<-read.table(UCI_DATA %.% "/test/X_test.txt",header = FALSE)
y_test<-read.table(UCI_DATA %.% "/test/y_test.txt",header = FALSE)
s_test<-read.table(UCI_DATA %.% "/test/subject_test.txt",header = FALSE)
#
#    x_train contains individual observation variables and y_train matches the activies to the observations
#    s_train matches the subjects to the observations
#
x_train<-read.table(UCI_DATA %.% "/train/X_train.txt",header = FALSE)
y_train<-read.table(UCI_DATA %.% "/train/y_train.txt",header = FALSE)
s_train<-read.table(UCI_DATA %.% "/train/subject_train.txt",header = FALSE)
#
# Step 1 - merge the training and test sets 
# 
# In order to keep the subjects and activieis  with their observations 
# we will add the s_ y_ data to the x_ data as the first and second column (subject,activity,data...)
syx_test<-cbind(s_test,y_test,x_test)
syx_train<-cbind(s_train,y_train,x_train)
# Now we can merge these sets of data together to complete step 1 
syx_data<-rbind(syx_test,syx_train)
#
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#
# Reading the features_info file, it would appear that the angle measurements at tne end are calculations used
# as part of the activity determination, and not really "mean and standard deviation" for a measurement, so only
# variables with "mean()" and "std()" at end of their names will be chosen. 
# 
# To accomplish this, we have to use the features data
#
feat<-readLines(UCI_DATA %.% "/features.txt")
# We put two additional columns at the front of the table, so we need to add those to our list and pull the 
# required ones for the assignment
#
syx_names<-c("Subject","Activity",grep("mean\\(\\)|std\\(\\)",feat,value=TRUE))
# 
# column numbers will help us extract them from the data frame
#
syx_cols<-c(1,2,grep("mean\\(\\)|std\\(\\)",feat)+2)
#
# So now we extract the columns defined and put them into syx_data_2
#
syx_data_2<-syx_data[,syx_cols]
# 
#  3. Uses descriptive activity names to name the activities in the data set
#
# So the activity values are coming from the text file, but they are kinda ugly (all uppercase, so a few tweaks)
act_labels<-read.table(UCI_DATA %.% "/activity_labels.txt",header = FALSE, stringsAsFactors = FALSE)
act_labels<-tbl_df(act_labels)
act_labels<-act_labels %>% mutate ( V2 = toTitleCase(tolower(V2)))
#
# Now we just use the lookup table to create a new column in the table at the end with the name of the activity in it
#
syx_data_3<-syx_data_2 %>% as_tibble() %>% mutate(V1.1=act_labels$V2[V1.1]) 
#
#### That solves step 3 stored in variable syx_data_3
#
# 4. Appropriately labels the data set with descriptive variable names.
#
# We kept the labels from back in step 2 - so now just apply them
#
names(syx_data_3)<-syx_names
#
# So the syx_data_3 now has labels
#
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.
#
#
syx_data_5<-syx_data_3 %>% group_by(Subject,Activity) %>% summarize_all(mean)
#
#
# So now the data is in the desired format in variable syx_data_5
# 

