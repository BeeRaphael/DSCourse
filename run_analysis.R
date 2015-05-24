
## 1 Merges the training and the test sets to create one data set.
## 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3 Uses descriptive activity names to name the activities in the data set
## 4 Appropriately labels the data set with descriptive variable names. 
## 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


library(dplyr)
library(tidyr)

## Reading data in
AllFilesThere <- TRUE
if (file.exists("X_train.txt")) {
df_train       <-read.table("X_train.txt",colClasses=c("numeric")) } else AllFilesThere <- FALSE
if (file.exists("subject_train.txt")) {
subject_train  <-read.table("subject_train.txt",colClasses=c("numeric")) } else AllFilesThere <- FALSE
if (file.exists("y_train.txt")) {
activity_train <-read.table("y_train.txt",colClasses=c("numeric")) } else AllFilesThere <- FALSE
if (file.exists("X_test.txt")) {
df_test        <-read.table("X_test.txt",colClasses=c("numeric")) } else AllFilesThere <- FALSE
if (file.exists("subject_test.txt")) {
subject_test   <-read.table("subject_test.txt",colClasses=c("numeric")) } else AllFilesThere <- FALSE
if (file.exists("y_test.txt")) {
activity_test  <-read.table("y_test.txt",colClasses=c("numeric")) } else AllFilesThere <- FALSE
if (file.exists("activity_labels.txt")) {activity_labels <-read.table("activity_labels.txt",colClasses=c("character"))}  else  AllFilesThere <- FALSE

if (AllFilesThere == TRUE) { 

## add 2 columns named "activity" containging the activity and "subject" containing subject number
df_test$activity <-activity_test$V1  
df_test$subject  <-subject_test$V1  
df_train$activity <-activity_train$V1  
df_train$subject  <-subject_train$V1   



##  STEP 1 merge 2  datasets
df_merged <- rbind(df_train,df_test)
rm(df_train,df_test, subject_test, subject_train, activity_test, activity_train)


## STEP 4
features_labels <-read.table("data/UCIHARDataset/features.txt",colClasses=c("character"))
valid_features_labels <- make.names(names=features_labels[,2], unique=T, allow_ = F) ## make names unique
valid_features_labels<- gsub("\\.","",valid_features_labels) ## remove the periods in the names
valid_features_labels <- c(valid_features_labels,"activity","subject") ## add the names of the last 2 columns
names(df_merged)     <- valid_features_labels  # add labels to each column in the merged data set


## STEP 2 extract columns of mean and std
df_merged <- select(df_merged, subject, activity, contains("mean"), contains("std"),contains("Mean"))


## STEP 3 replace activity numbers in column "activity" with descriptive activity names
## doing this with a for loop is a rather crude and inelegant way of doing it
## I am sure there are many better ways
ActivityColumn<-df_merged$activity

for (i in activity_labels[,1]) {    
      Ind<-which(df_merged$activity==i) 
      A<-activity_labels[activity_labels[,1]==i,2]
      ActivityColumn<-replace(ActivityColumn,Ind,A)
}

df_merged$activity<-ActivityColumn


## STEP 5 get the average of each variable for each activity and each subject
df_tidy<- df_merged %>% 
      gather(Feature, MeasuredValue, -activity, -subject) %>%   
      group_by(subject, activity, Feature) %>%
      summarize(AVG = mean(MeasuredValue))   %>%

write.table(df_tidy, file= "tidy_dataset.txt", row.name=FALSE)

}
