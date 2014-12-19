##In this file you will find the following information:

>
##### * Generated documents
##### * Background information - experimental design
##### * General analysis
##### * The "raw" original data  &  experimental  design
##### * The "process  to obtain the  "tidy" dataset (R code explained)
##### * The  "tidy" dataset


## Generated documents
* R code file
* Codebook.md with the details of the Tidy dataset
* This Readme.md file containing an overview of:
> * Background information, origin and experimental design
> * description of the raw data
> * the tidy up analysis, process and a detailed code description
> * the tidy dataset 
* a text file with  the tidy dataset (180 rows * 75 colums)

## Background information - experimental design -licence use

(The information in this section is taken directly from the originators of the raw data)

The Human Activity Recognition database was built from the recordings of 30 subjects within an age bracket of 19-48 years performing  six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)  while carrying a waist-mounted smartphone  (Samsung Galaxy S II) with embedded inertial sensors (accelerometer and gyroscope).

Origin of the data and experiment:

>Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

License:

>Use of this dataset in publications must be acknowledged by referencing the following publication 
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


## The "raw" original data  &  experimental  design 

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

## General analysis

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

This resultat in two datasets a test and a training dataset file "X_train.txt" (7352 rows 561 columns) and a "X_test.txt" (2947 rows 561 columns ) file each having 561 feature/measurments columns/variables but without headers or person info or activity info.
The corresponding 561 headers are inside a text file "features.txt" and correspond one to one with the 561 feature columns and will be used as headers. These headers are then used to select the variables/colums/features with "mean" or "std" in their names.

For each dataset (test/training ) there are two correponding files  with a one to one (=same number and order of the rows) relationship with the rows of the corresponding datasets.
>* One file contains the numbers (from 1 to 30) identifying a person (subject_test.txt -- 7352 rows/ subject_train.txt -- 2947 rows)

>* One file contains the number (1-6) identifying an activity (WALKING,SITTING...) (Y_test.txt -- 7352 rows / Y_train.txt -- 2947 rows)

>These datasets will then (thanks to the one to one relationship) be matched/merged/joined column bounded  with the datasets so that each combination of subject and activity matches with a row of features of the dataset

>Later on in the process the test and training datasets ,now each merged with the activity and subject id's will be merged (row bounded) together 

>the activity ids in the extended dataset will be replaced with the activity labels. This information  comes from a text file "activity_labels.txt" which has two colums one colum with the activity id and one with the activity label. There are six rows one for each label. This activity_id will be used to replace the activity_id's in the dataset with the more meaningfull activity labels.

Still later in the process a subset of fatues/variables/columns was taken to be used in the calculation of the means followed by rearranging the column order.

The following image might give a better id of the whole setup and process.

![Image of the structure of the tidy dataset]  (https://octodex.github.com/images/yaktocat.png)


## The "process  to obtain the  "tidy" dataset (R code explained)



### Part I -- Reading the variable/column names and the activity labels

### Step 1
>###### reading the variable names from the file "features.txt" 

>in a data.frame "features" and clean up  this list storing the net result in a data.frame "corrected_features_names" by:

* correction in features.txt file changing the errorneous "angle(tBodyAccMean,gravity)"
feature name by and replace by  "angle(tBodyAccMean,gravityMean)"  (adding "Mean" at the end)
* eliminating illegal characters ("()","(",")","-",",") 
* making the variable names unique by adding a sequence number ("1","2") by using make.unique()
* replacing "BodyBody" in some names by "Body"  f.ex "fBodyBodyGyroMag-mad()"
* replacing the begin characters "t" and "f" by a more meaning full "time" and "freq"
* eliminatng the end points (".") which do not make sense

>>code fragment

>>features<-read.csv(".\\UCI HAR Dataset \\features.txt", header=FALSE, sep="")
corrected_features_names<-gsub("\\(\\)","",features$V2)

>>corrected_features_names<-gsub("angle\\(tBodyAccMean, gravity\\)", "angle\\(tBodyAccMean,gravityMean\\)" , corrected_features_names)  
corrected_features_names<-gsub("[\\)\\(]","-",corrected_features_names)
corrected_features_names<-gsub("\\-",".",corrected_features_names)
corrected_features_names<-gsub("\\,",".",corrected_features_names) 
corrected_features_names<-gsub("BodyBody","Body",corrected_features_names)
corrected_features_names<-gsub("^f","freq",corrected_features_names) 
corrected_features_names<-gsub("^t","time",corrected_features_names)
corrected_features_names<-gsub("\\.$","",corrected_features_names)
corrected_features_names<-gsub("\\.\\.","\\.",corrected_features_names)
corrected_features_names<-make.unique(corrected_features_names) 


### Step 2 
>###### Reading the possible 6 activity labels
>("LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS") from the file "activity_labels.txt" in the data.frame "activity_labels" and adding Variable names ("activity_id","activity"). This activity_id is later used to  match and replace  the activity "number" with the activity label in the test and training dataset (x_test and X_train data.frames) once the activity "numbers" are merged with the test and training datasets.  

>>code fragment

>>activity_labels<-read.csv(".\\UCI HAR Dataset\\activity_labels.txt", header=FALSE, sep="",col.names=c("activity_id","activity"))


### Part II -- Reading and cleaning of the test data

### Step 1 
>###### reading the test data from the file "X_test.txt" 
 in the data.frame "x_test" adding the corrected/cleaned column/variable names (from "corrected_features_names) to it

>>code fragment 

>>x_test<-read.csv(".\\UCI HAR Dataset\\test\\X_test.txt", header=FALSE,sep="", col.names=corrected_features_names)

### Step 2
>###### reading the activity "number" (integer 1-6)
from the file "Y_test.txt" in the data.frame "Y_test" and naming its single column/variable  "activity_id" .

>Each row of this file/data.frame  "Y_test.txt"/y_test" corresponds one to one  with each row in the datafile/data.frame "X_test.txt/x_test". 

>In the next steps the "y_test" data.frame will be merged with the x_test dataframe , So each features row in the "x_test" data.frame will  be coupled with an activity   

>>code fragment

>>y_test<-read.csv(".\\UCI HAR Dataset\\test\\Y_test.txt",header=FALSE,sep="",col.names=c("activity_id"))

### Step 3
>###### reading the subject "number" (integer 1-30) 
>from the file "subject_test.txt" in the data.frame "sub_test" and naming the single variable/column  "subject_id". 

>Each row of this file/data.frame subject_test.txt / sub_test"  and the file/data.frame  "subject_test.txt/sub_test" corresponds one to one with each row in the datafile/data.frame "X_test.txt"/x_test. 

>In the next steps the "sub_test" data.frame will be merged with the "x_test" dataframe. So each features row in the "x_test" data.frame will  be coupled with an subject. The x_test data.frame
is extended with one extra column with column/variable  named "subject_id"

>>code fragment

>>sub_test<-read.csv(".\\UCI HAR Dataset\\test\\subject_test.txt", header=FALSE, sep="", col.names=c("subject_id"))

### Step 4
>##### column binding of the activity_id and the x_test data.frame 

>Each row of this  "y_test" data.frame  corresponds  one to one with each row in "x_test" data.frame and becomes  matched  and merged (joined) in an extended "x_test" data.frame with an extra Variable/column named "activity_id" . This variable/column will be replaced with the "activity label"  (WALKING,SITTING...) later on.

>>code fragment

>>x_test<-cbind(y_test,x_test)

### Step 5
>##### column binding of the data.frames "sub_test" and the "x_test.

>Each row of this "sub_test" data.frame  corresponds one to one  with each row in the  "x_test" data.frame and becomes matched/merged (joined)  in an again extended "x_test" data.frame with an extra variable/column "Subject_id"

>>code fragment

>>x_test<-cbind(sub_test,x_test)


## Part III -- Reading and cleaning of the training data

### Step 6 
>###### reading the test data from the file "Y_test.txt" 
 in the data.frame "x_train" adding the corrected/cleaned column/variable names (from "corrected_features_names) to it

>>code fragment 

>>x_train<-read.csv(".\\UCI HAR Dataset\\train\\X_train.txt", header=FALSE, sep="", col.names= corrected_features_names)

### Step 7
>###### reading the activity "number" (integer 1-6)
from the file "Y_train.txt" in the data.frame "Y_train" and naming its single column/variable  "activity_id" .

>Each row of this file/data.frame  "Y_train.txt"/y_train" corresponds one to one  with each row in the datafile/data.frame "X_train.txt/x_train". 

>In the next steps the "y_train" data.frame will be merged with the x_train dataframe , So each features row in the "x_train" data.frame will  be coupled with an activity and the x_train" data.frame is extended with an extra column/variable named "activity_id". This activty_id will later be replaced by the activity label.  

>>code fragment

>>y_train<-read.csv(".\\UCI HAR Dataset\\train\\Y_train.txt", header=FALSE, sep="", col.names= c("activity_id"))


### Step 8
>###### reading the subject "number" (integer 1-30) 
>from the file "subject_train.txt" in the data.frame "sub_train" and naming the single variable/column  "subject_id". 

>Each row of this file/data.frame subject_train.txt / sub_train"  and the file/data.frame  "subject_train.txt/sub_train" corresponds one to one with each row in the datafile/data.frame "X_train.txt"/x_train. 

>In the next steps the "sub_train" data.frame will be merged with the "x_train" dataframe. So each features row in the "x_train" data.frame will  be coupled with an subject. The x_train" dataframe receives an extra column/variable named "subject_id". 

>>code fragment

>>sub_train<-read.csv(".\\UCI HAR Dataset\\train\\subject_train.txt", header=FALSE, sep="", col.names=c("subject_id"))

### Step 9
>##### column binding of the activity_id and the train data.frame 

>Each row of this  "y_train" data.frame  corresponds  one to one with each row in "x_train" data.frame and becomes  matched  and merged (joined) in an extended "x_train" data.frame with an extra Variable/column "activity_id" . This variable/column will be replaced with the "activity label"  (WALKING,SITTING...) later on.

>>code fragment

>>x_train<-cbind(y_train,x_train)

### Step 10
>##### column binding of the data.frames "sub_train" and the "x_train.

>Each row of this "sub_train" data.frame  corresponds one to one  with each row in the  "x_train" data.frame and becomes matched/merged (joined)  in an again extended "x_train" data.frame with an extra variable/column "Subject_id"

>>code fragment

>>x_train<-cbind(sub_train,x_train)

## Part III -- Combine test and train data and calculate the means of the selected variables

### Step 11
>##### Combine test and train in a new data.frame "x_train_test"

>>code fragment

>>x_train_test<-rbind(x_train,x_test)

### Step 12 
>##### Select a subset of the variables/columns to retain
> * select mean / Mean / std / subject_id / activity_id variables only and stores the selection in a character vector "vars_to_retain"
> * keep the variables/column related to "angle" (7 pieces)
> * eliminate the variables with "mean" in the middle (f.ex ...meanFreq...)
> * add  the variable/column names "subject_id","activity_id" to "vars_to_retain" 
> * finally create the data.frame "x_train_test_mean_std_only" by subsetting the data.frame "x_train_test" retaining only the selected variables/columns.

>>code fragment

>> vars_to_retain <-corrected_features_names[grepl("mean$|Mean$|std$|mean.|Mean.|std." , corrected_features_names)]

>> vars_to_retain<-vars_to_retain[!grepl("meanFreq",vars_to_retain)] 

>> vars_to_retain<-c("subject_id","activity_id",as.character(vars_to_retain))

>> x_train_test_mean_std_only<-subset(x_train_test,select=vars_to_retain)


### Step 13 
>##### Replace the "activity_id" by the activity labels and change the column order

>("LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS") using the merge fuction

>>code fragment

>>x_train_test_mean_std_only<-merge(x=x_train_test_mean_std_only, y=activity_labels ,by.x="activity_id", by.y="activity_id")
x_train_test_mean_std_only<-subset(x_train_test_mean_std_only,select=c(2,76,3:75))

### Step 14 
>##### Calculation of the means

>Calculation of the means for every combination of people/activity/variable using "ddply" from the "plyr" R-package

>>code fragment

>>x_train_test_mean_std_only<-ddply(x_train_test_mean_std_only, as.quoted(c("subject_id", "activity")), colwise(mean))

### Step 15 
>#####Variable/Column order

>Change the varable/column names to start with "mean.of." since now it is the mean of "a mean" or a "std"
>>code fragment

>>colnames(x_train_test_mean_std_only) <-c("subject_id", "activity", paste0("mean.of.", colnames(x_train_test_mean_std_only[3:75])))

### Step FINAL output

>>code fragment

>>x_train_test_mean_std_only


### Extra code
>##### code to write the table to a text file

>>code fragment

>>write.table(x_train_test_mean_std_only,  file = "Human_Activity_Recognition_summary.txt", row.names=FALSE)

>##### code to read the table from the text file

>>code fragment

>>Human_Activity_Recognition_summary<-read.csv("Human_Activity_Recognition_summary.txt", header=TRUE, sep="")



## The  resulting "tidy" dataset/codebook section

From the original dataset  we kept only the variables/columns indicating a mean value or a standard deviation ("std" or "mean") a defined in the "features_info.txt" file  saying:
>* The set of variables that were estimated from these signals are: mean() std()
>* "Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:gravityMean /tBodyAccMean /tBodyAccJerkMean /tBodyGyroMean /tBodyGyroJerkMean
 
The dimension of this tidy dataset is 180 rows and 75 variables/columns

<table>
</td></tr>subject_id</td></tr>                                 
</td></tr>activity</td></tr>                                   
</td></tr>mean.of.timeBodyAcc.mean.X</td></tr>                 
</td></tr>mean.of.timeBodyAcc.mean.Y</td></tr>                 
</td></tr>mean.of.timeBodyAcc.mean.Z</td></tr>                 
</td></tr>mean.of.timeBodyAcc.std.X</td></tr>                  
</td></tr>mean.of.timeBodyAcc.std.Y</td></tr>                  
</td></tr>mean.of.timeBodyAcc.std.Z</td></tr>                  
</td></tr>mean.of.timeGravityAcc.mean.X</td></tr>              
</td></tr>mean.of.timeGravityAcc.mean.Y</td></tr>              
</td></tr>mean.of.timeGravityAcc.mean.Z</td></tr>              
</td></tr>mean.of.timeGravityAcc.std.X</td></tr>               
</td></tr>mean.of.timeGravityAcc.std.Y</td></tr>               
</td></tr>mean.of.timeGravityAcc.std.Z</td></tr>               
</td></tr>mean.of.timeBodyAccJerk.mean.X</td></tr>             
</td></tr>mean.of.timeBodyAccJerk.mean.Y</td></tr>             
</td></tr>mean.of.timeBodyAccJerk.mean.Z</td></tr>             
</td></tr>mean.of.timeBodyAccJerk.std.X</td></tr>              
</td></tr>mean.of.timeBodyAccJerk.std.Y</td></tr>              
</td></tr>mean.of.timeBodyAccJerk.std.Z</td></tr>              
</td></tr>mean.of.timeBodyGyro.mean.X</td></tr>                
</td></tr>mean.of.timeBodyGyro.mean.Y</td></tr>                
</td></tr>mean.of.timeBodyGyro.mean.Z</td></tr>                
</td></tr>mean.of.timeBodyGyro.std.X</td></tr>                 
</td></tr>mean.of.timeBodyGyro.std.Y</td></tr>                 
</td></tr>mean.of.timeBodyGyro.std.Z</td></tr>                 
</td></tr>mean.of.timeBodyGyroJerk.mean.X</td></tr>            
</td></tr>mean.of.timeBodyGyroJerk.mean.Y</td></tr>            
</td></tr>mean.of.timeBodyGyroJerk.mean.Z</td></tr>            
</td></tr>mean.of.timeBodyGyroJerk.std.X</td></tr>             
</td></tr>mean.of.timeBodyGyroJerk.std.Y</td></tr>             
</td></tr>mean.of.timeBodyGyroJerk.std.Z</td></tr>             
</td></tr>mean.of.timeBodyAccMag.mean</td></tr>                
</td></tr>mean.of.timeBodyAccMag.std</td></tr>                 
</td></tr>mean.of.timeGravityAccMag.mean</td></tr>             
</td></tr>mean.of.timeGravityAccMag.std</td></tr>              
</td></tr>mean.of.timeBodyAccJerkMag.mean</td></tr>            
</td></tr>mean.of.timeBodyAccJerkMag.std</td></tr>             
</td></tr>mean.of.timeBodyGyroMag.mean</td></tr>               
</td></tr>mean.of.timeBodyGyroMag.std</td></tr>                
</td></tr>mean.of.timeBodyGyroJerkMag.mean</td></tr>           
</td></tr>mean.of.timeBodyGyroJerkMag.std</td></tr>            
</td></tr>mean.of.freqBodyAcc.mean.X</td></tr>                 
</td></tr>mean.of.freqBodyAcc.mean.Y</td></tr>                 
</td></tr>mean.of.freqBodyAcc.mean.Z</td></tr>                 
</td></tr>mean.of.freqBodyAcc.std.X</td></tr>                  
</td></tr>mean.of.freqBodyAcc.std.Y</td></tr>                  
</td></tr>mean.of.freqBodyAcc.std.Z</td></tr>                  
</td></tr>mean.of.freqBodyAccJerk.mean.X</td></tr>             
</td></tr>mean.of.freqBodyAccJerk.mean.Y</td></tr>             
</td></tr>mean.of.freqBodyAccJerk.mean.Z</td></tr>             
</td></tr>mean.of.freqBodyAccJerk.std.X</td></tr>              
</td></tr>mean.of.freqBodyAccJerk.std.Y</td></tr>              
</td></tr>mean.of.freqBodyAccJerk.std.Z</td></tr>              
</td></tr>mean.of.freqBodyGyro.mean.X</td></tr>                
</td></tr>mean.of.freqBodyGyro.mean.Y</td></tr>                
</td></tr>mean.of.freqBodyGyro.mean.Z</td></tr>                
</td></tr>mean.of.freqBodyGyro.std.X</td></tr>                 
</td></tr>mean.of.freqBodyGyro.std.Y</td></tr>                 
</td></tr>mean.of.freqBodyGyro.std.Z</td></tr>                 
</td></tr>mean.of.freqBodyAccMag.mean</td></tr>                
</td></tr>mean.of.freqBodyAccMag.std</td></tr>                 
</td></tr>mean.of.freqBodyAccJerkMag.mean</td></tr>            
</td></tr>mean.of.freqBodyAccJerkMag.std</td></tr>             
</td></tr>mean.of.freqBodyGyroMag.mean</td></tr>               
</td></tr>mean.of.freqBodyGyroMag.std</td></tr>                
</td></tr>mean.of.freqBodyGyroJerkMag.mean</td></tr>           
</td></tr>mean.of.freqBodyGyroJerkMag.std</td></tr>            
</td></tr>mean.of.angle.tBodyAccMean.gravityMean</td></tr>     
</td></tr>mean.of.angle.tBodyAccJerkMean.gravityMean</td></tr> 
</td></tr>mean.of.angle.tBodyGyroMean.gravityMean</td></tr>    
</td></tr>mean.of.angle.tBodyGyroJerkMean.gravityMean</td></tr>
</td></tr>mean.of.angle.X.gravityMean</td></tr>                
</td></tr>mean.of.angle.Y.gravityMean</td></tr>                
</td></tr>mean.of.angle.Z.gravityMean</td></tr> 
</table>               

The subject_id variable/column:
* identifies a participant  
* has a value between 1 and 30 (30 participants).

The activity variable/column:
* identifies one of the 6 possible activities
* can have one of the six values: ("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

All other variables/columns:
* contain numeric data
* are normalized and bounded within [-1,1]. so units are gone
* are the means of other means or standard deviations
