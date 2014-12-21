======================================================================================
Getting and Cleaning Data
Course Project
Dec 21, 2014

Code Book (CodeBook.md)
======================================================================================
Using Human Activity Recognition Using Smartphones Dataset Version 1.0 
test (.txt) files to create a tidy data set

A code book describes the variables, the data, and any transformations or work performed to clean up the data. 


The program:
<ol>
<li>Merges the training and the test sets to create one data set.</li>
    -  the UCI HAR dataset is downloaded and unzipped into the working directory
    -  all files are .txt files that contain unlabelled data or variables
    -  information on the files is available in a README.txt files
    -  the train and test datasets are read
    -  the activity labels and feature variable datasets are read
    -  the datasets are combined into one 
    -  variable labels are added to the columns
    -  datasets are checked with dim() to ensure dataframes with the 
        correct dimensions are being created 
    
<li>Extract only the measurements on the mean and standard deviation for each measurement. </li>
    -  A subset of the dataset is created with the mean and standard deviation values
    
<li>Use descriptive activity names to name the activities in the data set</li>
    - Activity labels are added to the activity identification column
    
<li>Appropriately labels the data set with descriptive variable names. </li>
    - variable names are transformed into user friendly names
    
<li>From the data set in step 4, creates a second, independent tidy data set </li>
  with the average of each variable for each activity and each subject.
    - the data is "melted" together by subject id (1:30) and by activity (1:6) 
    Activity
    1 WALKING
    2 WALKING_UPSTAIRS
    3 WALKING_DOWNSTAIRS
    4 SITTING
    5 STANDING
    6 LAYING
    
    and the mean for each activity for each subject is calculated
</ol>   
   
The data is written to a .txt file in the working directory

