## Codebook for the Final Project in the Getting and Cleaning Data Course. 

The original data from the project included some information on the data elements. 

That text is included below for further reference. Our instructions were to select only a subset of the data, so we have the following columns included in the data set supplied:

### Subject - this data was merged with the matching observations from the seperately supplied data 

### Activity - the original data contained an activity id, and a seperate file that explained in human readable form the actual activity that went with each id. This data was made more cosmetically attractive by lowering the case and capitalizing the first character. 

### Measurements - the original measurements included 561 variables, of which we selected out 66 that contained std() and median() calculations for that measurement. These measurements have then been grouped by subject and activity and the mean calculated. 


The full list of fields is shown here, the numbers in front of the original measurements identify its original position in the data. 

  [1] "Subject"                         "Activity"                        "1 tBodyAcc-mean()-X"            
  [4] "2 tBodyAcc-mean()-Y"             "3 tBodyAcc-mean()-Z"             "4 tBodyAcc-std()-X"             
  [7] "5 tBodyAcc-std()-Y"              "6 tBodyAcc-std()-Z"              "41 tGravityAcc-mean()-X"        
  [10] "42 tGravityAcc-mean()-Y"         "43 tGravityAcc-mean()-Z"         "44 tGravityAcc-std()-X"         
  [13] "45 tGravityAcc-std()-Y"          "46 tGravityAcc-std()-Z"          "81 tBodyAccJerk-mean()-X"       
  [16] "82 tBodyAccJerk-mean()-Y"        "83 tBodyAccJerk-mean()-Z"        "84 tBodyAccJerk-std()-X"        
  [19] "85 tBodyAccJerk-std()-Y"         "86 tBodyAccJerk-std()-Z"         "121 tBodyGyro-mean()-X"         
  [22] "122 tBodyGyro-mean()-Y"          "123 tBodyGyro-mean()-Z"          "124 tBodyGyro-std()-X"          
  [25] "125 tBodyGyro-std()-Y"           "126 tBodyGyro-std()-Z"           "161 tBodyGyroJerk-mean()-X"     
  [28] "162 tBodyGyroJerk-mean()-Y"      "163 tBodyGyroJerk-mean()-Z"      "164 tBodyGyroJerk-std()-X"      
  [31] "165 tBodyGyroJerk-std()-Y"       "166 tBodyGyroJerk-std()-Z"       "201 tBodyAccMag-mean()"         
  [34] "202 tBodyAccMag-std()"           "214 tGravityAccMag-mean()"       "215 tGravityAccMag-std()"       
  [37] "227 tBodyAccJerkMag-mean()"      "228 tBodyAccJerkMag-std()"       "240 tBodyGyroMag-mean()"        
  [40] "241 tBodyGyroMag-std()"          "253 tBodyGyroJerkMag-mean()"     "254 tBodyGyroJerkMag-std()"     
  [43] "266 fBodyAcc-mean()-X"           "267 fBodyAcc-mean()-Y"           "268 fBodyAcc-mean()-Z"          
  [46] "269 fBodyAcc-std()-X"            "270 fBodyAcc-std()-Y"            "271 fBodyAcc-std()-Z"           
  [49] "345 fBodyAccJerk-mean()-X"       "346 fBodyAccJerk-mean()-Y"       "347 fBodyAccJerk-mean()-Z"      
  [52] "348 fBodyAccJerk-std()-X"        "349 fBodyAccJerk-std()-Y"        "350 fBodyAccJerk-std()-Z"       
  [55] "424 fBodyGyro-mean()-X"          "425 fBodyGyro-mean()-Y"          "426 fBodyGyro-mean()-Z"         
  [58] "427 fBodyGyro-std()-X"           "428 fBodyGyro-std()-Y"           "429 fBodyGyro-std()-Z"          
  [61] "503 fBodyAccMag-mean()"          "504 fBodyAccMag-std()"           "516 fBodyBodyAccJerkMag-mean()" 
  [64] "517 fBodyBodyAccJerkMag-std()"   "529 fBodyBodyGyroMag-mean()"     "530 fBodyBodyGyroMag-std()"     
  [67] "542 fBodyBodyGyroJerkMag-mean()" "543 fBodyBodyGyroJerkMag-std()" 



# Original Feature Text

Feature Selection 

=================



The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 



Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 



Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 



These signals were used to estimate variables of the feature vector for each pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.



tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag



The set of variables that were estimated from these signals are: 



mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.



Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:



gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean



The complete list of variables of each feature vector is available in 'features.txt'
