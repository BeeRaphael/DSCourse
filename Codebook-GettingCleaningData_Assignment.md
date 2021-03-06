
## Code book for Getting and Cleaning Data Assignment  "Human Activity Recognition Using Smartphones Dataset"

### Data:
*****

These are data collected from the accelerometers from the Samsung Galaxy S smartphone.

Infos from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

* Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

* The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

* subjects: group of 30 volunteers within an age bracket of 19-48 years, numbered from 1 to 30.

###Files that were read in to the R script and analysed:
***

- 'activity_labels.txt':   Links the class labels with their activity name.   loaded in R as     activity_labels
- 'X_train.txt': 		Training set.    				loaded in R as df\_train
- 'y_train.txt': 		Training labels.				loaded in R as activity\_train
- 'X_test.txt': 		Test set.					loaded in R as df\_test
- 'y_test.txt': 		Test labels.					loaded in R as activity\_test
- 'features.txt'		Variable names / 561 Measures		loaded in R as features\_labels
- 'subject_train.txt' Each row identifies the subject of the training group who performed the activity for each window sample.
		Its range is from 1 to 30.   				loaded in R as subject\_train
- 'subject_test.txt' Each row identifies the subject of the test group who performed the activity for each window sample. 
		Its range is from 1 to 30.   				loaded in R as subject\_test

Link: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#### Source of data: 
* Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)\
1 - Smartlab - Non-Linear Complex Systems Laboratory DITEN - Universit\'e0 degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living   Universitat Polit\'e8cnica de Catalunya (BarcelonaTech). Vilanova i la Geltr\'fa (08800), Spain    activityrecognition '@' smartlab.ws

###Task:
*******
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### What the script does  /  Variables in the R script:
******************************************
* all txt files mentioned above were read in as data frames
* in case one of the files is not in the working directory the flag "AllFilesThere" is set to FALSE and  the script does and returns nothing
* Lines 30-34: if all files could be loaded, one column with the activity number and one column with the subject 
			number is added to the dataframes with the measured data (df_test and df\_train)
* Lines 38 ff: STEP 1 of the task list:    the training and test dataframe are merged to df\_merged
						variables are deleted to clean up workspace
* Lines 43 ff: STEP 4 of the task list:   
	* the names of the variables in freatures_labels from features.txt are made unique (there were some doubles in the txt file!)
	* the periods in the names are removed --> generates "valid\_features\_labels"
* Line 47				the names of the 2 added columns "activity" and "subject" are added to valid\_features\_labels 
* Line 48		the merged dataframe gets column names
* Line 52  STEP 2		extract from df\_merged only the columns whose names contain mean or std
* Lines 58 ff:	STEP 3	
	* replace activity numbers in column "activity" with descriptive activity names from activity_labels.txt
	* this is admittedly done not in the most elegant way
* Line 70 ff:   STEP 5		
	* produce tidy dataset by transforming all the feature columns in one long column
	* grouping by subject, activity and freature
	* calculate mean for each group
* Line 75:					safe df\_tidy as tidy_dataset.txt

### Result:
*******
* R script 				run_analysis.R
* resulting tidy dataset  	tidy_dataset.txt
* Codebook	(this file)		Codebook - GettingCleaningData Assignment.md
* README.md			readme file to explain the script
