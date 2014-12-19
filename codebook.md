##In this file you will find the following information:

>
##### * The raw data
##### * The analysis and tranformations
##### * Explaining the selection of the variables
##### * the cleanup of the dataset
##### * The  "tidy" dataset

## The "raw" original data 

(The information in this section is taken directly from the originators of the raw data)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list with all combinations  contains 561 variables/columns
Also provided:
 * A file with the 6 possible activities each of the six rows containing an activity Id (1-6) and an activity_label ((WALKING,SITTING...)
 * 2 files containing the subject id for each row in the dataset (one to one relationship) one file for test data and one file for training data
 * 2 files files containing the activity id for each row in the dataset (one to one relationship) one file for test data and one file for training data

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## the analysis and tranformations 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

This results in two datasets a test and a training dataset file "X_train.txt" (7352 rows 561 columns) and a "X_test.txt" (2947 rows 561 columns ) file each having 561 feature/measurments columns/variables but without headers or person info or activity info.
The corresponding 561 headers are inside a text file "features.txt" and correspond one to one with the 561 feature columns and will be used as headers. These headers are then used to select the variables/colums/features with "mean" or "std" in their names.

For each dataset (test/training ) there are two correponding files  with a one to one (=same number and order of the rows) relationship with the rows of the corresponding datasets.
>* One file contains the numbers (from 1 to 30) identifying a person (subject_test.txt -- 7352 rows/ subject_train.txt -- 2947 rows)

>* One file contains the number (1-6) identifying an activity (WALKING,SITTING...) (Y_test.txt -- 7352 rows / Y_train.txt -- 2947 rows)

>These datasets will then (thanks to the one to one relationship) be matched/merged/joined column bounded  with the datasets so that each combination of subject and activity matches with a row of features of the dataset

>Later on in the process the test and training datasets ,now each merged with the activity and subject id's will be merged (row bounded) together 

>the activity ids in the extended dataset will be replaced with the activity labels. This information  comes from a text file "activity_labels.txt" which has two colums one colum with the activity id and one with the activity label. There are six rows one for each label. This activity_id will be used to replace the activity_id's in the dataset with the more meaningfull activity labels.

Still later in the process a subset of fatues/variables/columns was taken to be used in the calculation of the means followed by rearranging the column order.

The following image might give a better id of the whole setup and process and end result.

Further down this document you find a datashema that might help t explain
the relations between this data

### Explaining the selection of variables

From the original dataset  we kept only the variables/columns indicating a mean value or a standard deviation ("std" or "mean") a defined in the "features_info.txt" file  saying:
>* The set of variables that were estimated from these signals are: mean() std()
>* "Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:gravityMean /tBodyAccMean /tBodyAccJerkMean /tBodyGyroMean /tBodyGyroJerkMean
>* this means that variable names with "mean" somewhere in the middle (f.ex ...meanFreq...) are eliminated.


### the cleanup of the dataset


* correction in features.txt file changing the errorneous "angle(tBodyAccMean,gravity)"
feature name by and replace by  "angle(tBodyAccMean,gravityMean)"  (adding "Mean" at the end)
* eliminating illegal characters ("()","(",")","-",",") 
* making the variable names unique by adding a sequence number ("1","2") by using make.unique()
* replacing "BodyBody" in some names by "Body"  f.ex "fBodyBodyGyroMag-mad()"
* replacing the begin characters "t" and "f" by a more meaning full "time" and "freq"
* eliminatng the end points (".") which do not make sense


## The  "tidy" dataset


The following image might give a better id of the whole setup and process.

![Image of the structure of the tidy dataset]  (https://github.com/boudenoodt/Coursera_Getting_Cleaning_data_project/blob/master/Human_activity_dataset_shema.png)


From the original dataset  we kept only the variables/columns indicating a mean value or a standard deviation ("std" or "mean") a defined in the "features_info.txt" file  saying:
>* The set of variables that were estimated from these signals are: mean() std()
>* "Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:gravityMean /tBodyAccMean /tBodyAccJerkMean /tBodyGyroMean /tBodyGyroJerkMean
>* this means that variable names with "mean" somewhere in the middle (f.ex ...meanFreq...) are eliminated.
 
The dimension of this tidy dataset is 180 rows and 75 variables/columns
Each row gives the "mean.of."  features (73) for each combination of subject and activity resulting in 30 (subjects) * 6 (activities) = 180 rows.

subject_id                                 
activity                                   
mean.of.timeBodyAcc.mean.X                 
mean.of.timeBodyAcc.mean.Y                 
mean.of.timeBodyAcc.mean.Z                 
mean.of.timeBodyAcc.std.X                  
mean.of.timeBodyAcc.std.Y                  
mean.of.timeBodyAcc.std.Z                  
mean.of.timeGravityAcc.mean.X              
mean.of.timeGravityAcc.mean.Y              
mean.of.timeGravityAcc.mean.Z              
mean.of.timeGravityAcc.std.X               
mean.of.timeGravityAcc.std.Y               
mean.of.timeGravityAcc.std.Z               
mean.of.timeBodyAccJerk.mean.X             
mean.of.timeBodyAccJerk.mean.Y             
mean.of.timeBodyAccJerk.mean.Z             
mean.of.timeBodyAccJerk.std.X              
mean.of.timeBodyAccJerk.std.Y              
mean.of.timeBodyAccJerk.std.Z              
mean.of.timeBodyGyro.mean.X                
mean.of.timeBodyGyro.mean.Y                
mean.of.timeBodyGyro.mean.Z                
mean.of.timeBodyGyro.std.X                 
mean.of.timeBodyGyro.std.Y                 
mean.of.timeBodyGyro.std.Z                 
mean.of.timeBodyGyroJerk.mean.X            
mean.of.timeBodyGyroJerk.mean.Y            
mean.of.timeBodyGyroJerk.mean.Z            
mean.of.timeBodyGyroJerk.std.X             
mean.of.timeBodyGyroJerk.std.Y             
mean.of.timeBodyGyroJerk.std.Z             
mean.of.timeBodyAccMag.mean                
mean.of.timeBodyAccMag.std                 
mean.of.timeGravityAccMag.mean             
mean.of.timeGravityAccMag.std              
mean.of.timeBodyAccJerkMag.mean            
mean.of.timeBodyAccJerkMag.std             
mean.of.timeBodyGyroMag.mean               
mean.of.timeBodyGyroMag.std                
mean.of.timeBodyGyroJerkMag.mean           
mean.of.timeBodyGyroJerkMag.std            
mean.of.freqBodyAcc.mean.X                 
mean.of.freqBodyAcc.mean.Y                 
mean.of.freqBodyAcc.mean.Z                 
mean.of.freqBodyAcc.std.X                  
mean.of.freqBodyAcc.std.Y                  
mean.of.freqBodyAcc.std.Z                  
mean.of.freqBodyAccJerk.mean.X             
mean.of.freqBodyAccJerk.mean.Y             
mean.of.freqBodyAccJerk.mean.Z             
mean.of.freqBodyAccJerk.std.X              
mean.of.freqBodyAccJerk.std.Y              
mean.of.freqBodyAccJerk.std.Z              
mean.of.freqBodyGyro.mean.X                
mean.of.freqBodyGyro.mean.Y                
mean.of.freqBodyGyro.mean.Z                
mean.of.freqBodyGyro.std.X                 
mean.of.freqBodyGyro.std.Y                 
mean.of.freqBodyGyro.std.Z                 
mean.of.freqBodyAccMag.mean                
mean.of.freqBodyAccMag.std                 
mean.of.freqBodyAccJerkMag.mean            
mean.of.freqBodyAccJerkMag.std             
mean.of.freqBodyGyroMag.mean               
mean.of.freqBodyGyroMag.std                
mean.of.freqBodyGyroJerkMag.mean           
mean.of.freqBodyGyroJerkMag.std            
mean.of.angle.tBodyAccMean.gravityMean     
mean.of.angle.tBodyAccJerkMean.gravityMean 
mean.of.angle.tBodyGyroMean.gravityMean    
mean.of.angle.tBodyGyroJerkMean.gravityMean
mean.of.angle.X.gravityMean                
mean.of.angle.Y.gravityMean                
mean.of.angle.Z.gravityMean 
                         

The subject_id variable/column:
* identifies a participant  
* has a value between 1 and 30 (30 participants).

The activity variable/column:
* identifies one of the 6 possible activities
* can have one of the six values: ("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

All other variables/columns:
* contain numeric data
* are normalized and bounded within [-1,1]. so units are gone
* are the means of other means or standard deviations so  "mean.of." was added to name
