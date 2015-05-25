# Data Assignment  "Human Activity Recognition Using Smartphones Dataset"
## script "run_analysis.R"

### Variables loaded in the R script:

* "activity\_labels.txt":   Links the class labels with their activity name.   loaded in R as     activity\_labels
* 'X\_train.txt':       	Training set.    				loaded in R as df\_train
* 'y_train.txt': 		Training labels.				loaded in R as activity\_train
* 'X_test.txt': 		Test set.					loaded in R as df_test
* 'y_test.txt': 		Test labels.	                  loaded in R as activity_test
* 'features.txt':		Variable names / 561 Measures		loaded in R as features_labels
* 'subject\_train.txt' Each row identifies the subject of the training group who performed the activity for each window sample. 
		Its range is from 1 to 30.   				loaded in R as subject_train
* 'subject\_test.txt' Each row identifies the subject of the test group who performed the activity for each window sample. 
		Its range is from 1 to 30.   				loaded in R as subject_test
            
            
### What the script does  /  Variables in the R script:

* all txt files mentioned above were read in as data frames
* in case one of the files is not in the working directory the flag "AllFilesThere" is set to FALSE and  the script does and returns nothing
* Lines 30-34: if all files could be loaded, one column with the activity number and one column with the subject 
      		number is added to the dataframes with the measured data (df_test and df_train)
* Lines 38 ff: STEP 1 of the task list:  +  the training and test dataframe are merged to df_merged
					+	variables are deleted to clean up workspace
* Lines 43 ff: STEP 4 of the task list:  + the names of the variables in freatures_labels from features.txt are made unique 
					+	(there were some doubles in the txt file!)
					+	the periods in the names are removed --> generates "valid_features_labels"
* Line 47				the names of the 2 added columns "activity" and "subject" are added to valid_features_labels  
* Line 48				the merged dataframe gets column names

* Line 52  STEP 2		extract from df_merged only the columns whose names contain mean or std

* Lines 58 ff:	STEP 3	replace activity numbers in column "activity" with descriptive activity names from activity_labels.txt
					this is admittedly done not in the most elegant way
* Line 70 ff:   STEP 5		produce tidy dataset by transforming all the feature columns in one long column, 
					grouping by subject, activity and freature
					calculate mean for each group
* Line 75:					safe df_tidy as tidy_dataset.txt

