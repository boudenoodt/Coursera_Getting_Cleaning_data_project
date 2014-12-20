library(plyr)

## ****************************************************************************************************
## reading the variable names from features.txt and clean up as far as possible by:
##      correction in features.txt file changing the errorneous "angle(tBodyAccMean,gravity)"
##      feature name by and replace by  "angle(tBodyAccMean,gravityMean)"  (adding "Mean" at the end
##		eliminating illegal characters ("()","(",")","-",",") 
##      making the variable names unique by adding a sequence number ("1","2") by using make.unique()
##      replacing "BodyBody" in some names by "Body"  f.ex "fBodyBodyGyroMag-mad()"
##      replacing the begin characters "t" and "f" by a more meaning full "time" and "freq"
##      eliminatng the end points (".") which do no longer make sense
## *****************************************************************************************************

features<-read.csv(".\\UCI HAR Dataset\\features.txt",header=FALSE,sep="")
corrected_features_names<-gsub("\\(\\)","",features$V2)                    ## replace "()" by an empty string
corrected_features_names<-gsub("angle\\(tBodyAccMean,gravity\\)","angle\\(tBodyAccMean,gravityMean\\)",corrected_features_names)    ## replace "angle(tBodyAccMean,gravity)" by angle(tBodyAccMean,gravityMean)"
corrected_features_names<-gsub("[\\)\\(]","-",corrected_features_names)    ## replace 
corrected_features_names<-gsub("\\-",".",corrected_features_names)         ## replace "-" by "."
corrected_features_names<-gsub("\\,",".",corrected_features_names)         ## replace "," by "."
corrected_features_names<-gsub("BodyBody","Body",corrected_features_names) ## correct error in naming "BodyBody" becomes "Body"
corrected_features_names<-gsub("^f","freq",corrected_features_names)       ## replace f by a more descriptive "freq"
corrected_features_names<-gsub("^t","time",corrected_features_names)       ## replace t by a more descriptive "time"
corrected_features_names<-gsub("\\.$","",corrected_features_names)         ## remove last (end of word) "."
corrected_features_names<-gsub("\\.\\.","\\.",corrected_features_names)    ## replace ".." by "."
corrected_features_names<-make.unique(corrected_features_names) 		   ## make the field names unique (adding 1,2 ... to the name)

##***************************************
## Reading the possible 6 activity labels 
##***************************************

## reading the possible (6) row labels/activity names from activity_labels.txt ==>
## ("LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS") 
## and adding  column/variable names to this data.frame ("activity_id","activity") activity_id is later used to merge
## the actual activity names with the data  (replacing activity_id by the activity label itself)
activity_labels<-read.csv(".\\UCI HAR Dataset\\activity_labels.txt",header=FALSE,sep="",col.names=c("activity_id","activity"))

##**************************************
## Reading and cleaning of the test data
##**************************************

## reading the test data and adding the corrected/cleaned column/variable names (from "corrected_features_names/features.txt") to it
x_test<-read.csv(".\\UCI HAR Dataset\\test\\X_test.txt",header=FALSE,sep="",col.names=corrected_features_names)

## reading the activity (integer 1-6) and naming the column/variable name "activity_id" 
## each row of this data.frame corresponds one to one  each row in the datafile ("X_test.txt")
y_test<-read.csv(".\\UCI HAR Dataset\\test\\Y_test.txt",header=FALSE,sep="",col.names=c("activity_id"))

## reading the subject id(integer 1-30) and naming the column/variable name "subject_id"
## each row of this data.frame corresponds one to one with each row in the datafile ("X_test.txt")
sub_test<-read.csv(".\\UCI HAR Dataset\\test\\subject_test.txt",header=FALSE,sep="",col.names=c("subject_id"))

## column binding of the activity_id and the test data.frame 
## each row of this activity data.frame  corresponds one to one  each row in the datafile ("X_test.txt")
x_test<-cbind(y_test,x_test)

## column binding of the subject_id and the test data.frame 
## each row of this subject data.frame  corresponds one to one  each row in the datafile ("X_test.txt")
x_test<-cbind(sub_test,x_test)


##******************************************
## Reading and cleaning of the training data
##******************************************

## reading the training data and adding the corrected/cleaned column/variable names (from "corrected_features_names/features.txt") to it
x_train<-read.csv(".\\UCI HAR Dataset\\train\\X_train.txt",header=FALSE,sep="",col.names=corrected_features_names)

## reading the activity (integer 1-6) and naming the column/variable name "activity_id" 
## each row of this data.frame corresponds one to one  each row in the datafile ("Y_train.txt")
y_train<-read.csv(".\\UCI HAR Dataset\\train\\Y_train.txt",header=FALSE,sep="",col.names=c("activity_id"))

## reading the subject id(integer 1-30) and naming the column/variable name "subject_id"
## each row of this data.frame corresponds one to one with each row in the datafile ("X_train.txt")
sub_train<-read.csv(".\\UCI HAR Dataset\\train\\subject_train.txt",header=FALSE,sep="",col.names=c("subject_id"))

## column binding of the activity_id and the training data.frame 
## each row of this activity data.frame  corresponds one to one  each row in the datafile ("X_train.txt")
x_train<-cbind(y_train,x_train)

## column binding of the subject_id and the test data.frame 
## each row of this subject data.frame  corresponds one to one  each row in the datafile ("X_train.txt")
x_train<-cbind(sub_train,x_train)

## *****************************************
## combine test and train data by rowbinding
## *****************************************
x_train_test<-rbind(x_train,x_test)

## select mean / Mean / std / subject_id / activity_id variables only
## remove the variables/column related to "angle" and "meanFreq"
## and keep only those variabled/columns by subsetting  and "select"
 vars_to_retain<-corrected_features_names[grepl("mean$|Mean$|std$|mean.|Mean.|std.",corrected_features_names)] 
## eliminate the variables/column with "meanFreq" in the name as this are probably not real means (I guess)
vars_to_retain<-vars_to_retain[!grepl("meanFreq",vars_to_retain)] 
## eliminate the variables/column with "angle" in the name as this are probably not real means but moving averages(I guess)
vars_to_retain<-vars_to_retain[!grepl("^angle",vars_to_retain)] 
vars_to_retain<-c("subject_id","activity_id",as.character(vars_to_retain))
x_train_test_mean_std_only<-subset(x_train_test,select=vars_to_retain)

## Replace the "activity_id" by the activity labels and change the column order
## ("LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS") using the merge fuction
x_train_test_mean_std_only<-merge(x=x_train_test_mean_std_only,y=activity_labels,by.x="activity_id",by.y="activity_id")
x_train_test_mean_std_only<-subset(x_train_test_mean_std_only,select=c(2,69,3:68))

## calculate the mean for every combination of people/activity/variable using ddply from the "plyr" package
x_train_test_mean_std_only<-ddply(x_train_test_mean_std_only,as.quoted(c("subject_id","activity")),colwise(mean))
## change the varable/column names to start with "mean.of." since now it is the mean of "a mean" or a "std"
colnames(x_train_test_mean_std_only)<-c("subject_id","activity",paste0("mean.of.",colnames(x_train_test_mean_std_only[3:68])))

## script output
x_train_test_mean_std_only


## code to write the table to a text file
## write.table(x_train_test_mean_std_only, file = "Human_Activity_Recognition_summary.txt",row.names=FALSE)
## code to read the data back in a data.frame
## Human_Activity_Recognition_summary<-read.csv("Human_Activity_Recognition_summary.txt", header=TRUE, sep="")
