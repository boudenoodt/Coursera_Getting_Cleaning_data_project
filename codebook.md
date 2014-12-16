# Human Activity Recognition Using Smartphones
###  Source of original data
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Università degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, 
Italy.activityrecognition@smartlab.ws

www.smartlab.ws

###  Base dataset
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals:
* tBodyAccJerk-XYZ 
* tBodyGyroJerk-XYZ

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm:
* tBodyAccMag
* tGravityAccMag 
* tBodyAccJerkMag 
* tBodyGyroMag 
* tBodyGyroJerkMag

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing: 
* fBodyAcc-XYZ 
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ 
* fBodyAccJerkMag 
* fBodyGyroMag 
* fBodyGyroJerkMag 
  (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions:

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
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest * magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
*bandsEnergy(): Energy of a frequency interval within the 64 * bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean


#### Processed data
 [1] "subject_id"                                  
 [2] "activity"                                    
 [3] "mean.of.tBodyAcc.mean.X"                     
 [4] "mean.of.tBodyAcc.mean.Y"                     
 [5] "mean.of.tBodyAcc.mean.Z"                     
 [6] "mean.of.tBodyAcc.std.X"                      
 [7] "mean.of.tBodyAcc.std.Y"                      
 [8] "mean.of.tBodyAcc.std.Z"                      
 [9] "mean.of.tGravityAcc.mean.X"                  
[10] "mean.of.tGravityAcc.mean.Y"                  
[11] "mean.of.tGravityAcc.mean.Z"                  
[12] "mean.of.tGravityAcc.std.X"                   
[13] "mean.of.tGravityAcc.std.Y"                   
[14] "mean.of.tGravityAcc.std.Z"                   
[15] "mean.of.tBodyAccJerk.mean.X"                 
[16] "mean.of.tBodyAccJerk.mean.Y"                 
[17] "mean.of.tBodyAccJerk.mean.Z"                 
[18] "mean.of.tBodyAccJerk.std.X"                  
[19] "mean.of.tBodyAccJerk.std.Y"                  
[20] "mean.of.tBodyAccJerk.std.Z"                  
[21] "mean.of.tBodyGyro.mean.X"                    
[22] "mean.of.tBodyGyro.mean.Y"                    
[23] "mean.of.tBodyGyro.mean.Z"                    
[24] "mean.of.tBodyGyro.std.X"                     
[25] "mean.of.tBodyGyro.std.Y"                     
[26] "mean.of.tBodyGyro.std.Z"                     
[27] "mean.of.tBodyGyroJerk.mean.X"                
[28] "mean.of.tBodyGyroJerk.mean.Y"                
[29] "mean.of.tBodyGyroJerk.mean.Z"                
[30] "mean.of.tBodyGyroJerk.std.X"                 
[31] "mean.of.tBodyGyroJerk.std.Y"                 
[32] "mean.of.tBodyGyroJerk.std.Z"                 
[33] "mean.of.tBodyAccMag.mean"                    
[34] "mean.of.tBodyAccMag.std"                     
[35] "mean.of.tGravityAccMag.mean"                 
[36] "mean.of.tGravityAccMag.std"                  
[37] "mean.of.tBodyAccJerkMag.mean"                
[38] "mean.of.tBodyAccJerkMag.std"                 
[39] "mean.of.tBodyGyroMag.mean"                   
[40] "mean.of.tBodyGyroMag.std"                    
[41] "mean.of.tBodyGyroJerkMag.mean"               
[42] "mean.of.tBodyGyroJerkMag.std"                
[43] "mean.of.fBodyAcc.mean.X"                     
[44] "mean.of.fBodyAcc.mean.Y"                     
[45] "mean.of.fBodyAcc.mean.Z"                     
[46] "mean.of.fBodyAcc.std.X"                      
[47] "mean.of.fBodyAcc.std.Y"                      
[48] "mean.of.fBodyAcc.std.Z"                      
[49] "mean.of.fBodyAcc.meanFreq.X"                 
[50] "mean.of.fBodyAcc.meanFreq.Y"                 
[51] "mean.of.fBodyAcc.meanFreq.Z"                 
[52] "mean.of.fBodyAccJerk.mean.X"                 
[53] "mean.of.fBodyAccJerk.mean.Y"                 
[54] "mean.of.fBodyAccJerk.mean.Z"                 
[55] "mean.of.fBodyAccJerk.std.X"                  
[56] "mean.of.fBodyAccJerk.std.Y"                  
[57] "mean.of.fBodyAccJerk.std.Z"                  
[58] "mean.of.fBodyAccJerk.meanFreq.X"             
[59] "mean.of.fBodyAccJerk.meanFreq.Y"             
[60] "mean.of.fBodyAccJerk.meanFreq.Z"             
[61] "mean.of.fBodyGyro.mean.X"                    
[62] "mean.of.fBodyGyro.mean.Y"                    
[63] "mean.of.fBodyGyro.mean.Z"                    
[64] "mean.of.fBodyGyro.std.X"                     
[65] "mean.of.fBodyGyro.std.Y"                     
[66] "mean.of.fBodyGyro.std.Z"                     
[67] "mean.of.fBodyGyro.meanFreq.X"                
[68] "mean.of.fBodyGyro.meanFreq.Y"                
[69] "mean.of.fBodyGyro.meanFreq.Z"                
[70] "mean.of.fBodyAccMag.mean"                    
[71] "mean.of.fBodyAccMag.std"                     
[72] "mean.of.fBodyAccMag.meanFreq"                
[73] "mean.of.fBodyBodyAccJerkMag.mean"            
[74] "mean.of.fBodyBodyAccJerkMag.std"             
[75] "mean.of.fBodyBodyAccJerkMag.meanFreq"        
[76] "mean.of.fBodyBodyGyroMag.mean"               
[77] "mean.of.fBodyBodyGyroMag.std"                
[78] "mean.of.fBodyBodyGyroMag.meanFreq"           
[79] "mean.of.fBodyBodyGyroJerkMag.mean"
[84] "mean.of.angle.tBodyGyroMean.gravityMean."    
[85] "mean.of.angle.tBodyGyroJerkMean.gravityMean."
[86] "mean.of.angle.X.gravityMean."       
[80] "mean.of.fBodyBodyGyroJerkMag.std"            
[81] "mean.of.fBodyBodyGyroJerkMag.meanFreq"       
[82] "mean.of.angle.tBodyAccMean.gravity."         
[83] "mean.of.angle.tBodyAccJerkMean.gravityMean."
[87] "mean.of.angle.Y.gravityMean."                
[88] "mean.of.angle.Z.gravityMean." 
