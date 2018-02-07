# CodeBook for the Getting and Cleaning Data Course Project

This file describes the variables, the data, and any transformations or work that you performed to clean up the data
## Step 1
the test and the train data have been merge
the activity name has been added
the subjet have also been added based on subject_train.txt and subject_test.txt

## Variable description : subject
the subject column is an identifier of the subject who carried out the experiment

## Variable description : activityname
the activityname column is an identifier of the subject who carried out the experiment


## Variables description : features 
only mean and std columns have been kept from the original data.
The average of each variable for each activity and each subject have been calculated on the following columns
 * activityname 
* type                    
* tBodyAcc-mean()-X 
* tBodyAcc-mean()-Y 
* tBodyAcc-mean()-Z 
* tGravityAcc-mean()-X 
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z   
* tBodyAccJerk-mean()-X 
* tBodyAccJerk-mean()-Y  
* tBodyAccJerk-mean()-Z  
* tBodyGyro-mean()-X     
* tBodyGyro-mean()-Y     
* tBodyGyro-mean()-Z     
* tBodyGyroJerk-mean()-X 
* tBodyGyroJerk-mean()-Y 
* tBodyGyroJerk-mean()-Z 
* fBodyAcc-mean()-X      
* fBodyAcc-mean()-Y      
* fBodyAcc-mean()-Z      
* fBodyAccJerk-mean()-X  
* fBodyAccJerk-mean()-Y  
* fBodyAccJerk-mean()-Z  
* fBodyGyro-mean()-X     
* fBodyGyro-mean()-Y     
* fBodyGyro-mean()-Z     
* tBodyAcc-std()-X       
* tBodyAcc-std()-Y       
* tBodyAcc-std()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z    
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-std()-X      
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y  
* tBodyGyroJerk-std()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z       
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-std()-X      
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z      
