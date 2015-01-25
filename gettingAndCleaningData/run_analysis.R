###########################################
##                                       ##
##    Set the working directory          ##
##                                       ##
###########################################
setwd("c:/R_Programming/gettingAndCleaningData")

###########################################
##                                       ##
##    Load required libraries            ##
##                                       ##
###########################################

library(downloader)
library(reshape2)

#####################################################
##                                                 ##
## Define the directory info                       ##
## for the courseProjectDataset.                   ##
##                                                 ##
#####################################################

datasetPath <- file.path("../gettingAndCleaningData" , "UCI HAR Dataset")

#####################################################
##                                                 ##
##                                                 ##
## Define the list of files we need                ##
## fir the courseProjectDataset                    ##
##                                                 ##
##                                                 ##
#####################################################

datasetFiles<-list.files(datasetPath, recursive=TRUE)
datasetFiles

#####################################################
##                                                 ##
##                                                 ##
## First read in the test and training data        ## 
## Assign each of these sets an initial name       ## 
##                                                 ##
#####################################################

subject_test <- read.table(file.path(datasetPath, "test" , "subject_test.txt" ),header = FALSE)
y_test <- read.table(file.path(datasetPath, "test" , "y_test.txt" ),header = FALSE)
x_test <- read.table(file.path(datasetPath, "test" , "x_test.txt" ),header = FALSE)
subject_train <- read.table(file.path(datasetPath, "train" , "subject_train.txt" ),header = FALSE)
y_train <- read.table(file.path(datasetPath, "train" , "y_train.txt" ),header = FALSE)
x_train<- read.table(file.path(datasetPath, "train" , "x_train.txt" ),header = FALSE)

#####################################################
##                                                 ##
##                                                 ##
## Next add appropriate labels for variable names  ## 
## Assign each of these to the initial datasets    ## 
## that were just created                          ##
##                                                 ##
## This will also use the 'features.txt'           ##
## to provide the appropriate labels               ##
##                                                 ##
##                                                 ##
## Additional information on these labels          ##
## can be found in the "features_info.txt" file    ##
##                                                 ##
#####################################################

# Generic label for the Subject variable
names(subject_train) <- "subjectID" 
names(subject_test) <- "subjectID" 

# Descriptive labels for the features utilizing the features file
featureNames <- read.table(file.path(datasetPath, "features.txt"), header = FALSE )
names(x_train) <- featureNames$V2 
names(x_test) <- featureNames$V2

# Generic label for the Activity label 
names(y_train) <- "activity" 
names(y_test) <- "activity" 


#####################################################
##                                                 ##
##                                                 ##
## Now the datasets can be combined                ## 
##                                                 ##
## This will go through each set for train and test##
## and then it will combine train and test to      ##
## create the single dataset                       ##
##                                                 ##
#####################################################

train <- cbind(subject_train, y_train, x_train) 
test <- cbind(subject_test, y_test, x_test) 
combined <- rbind(train, test) 

#####################################################
##                                                 ##
##                                                 ##
## Now extract only the measurements on the        ##
## mean and standard deviation for each measurement## 
##                                                 ##
##                                                 ##
#####################################################


## Determine which columns contain "mean()" or "std()" 
meanstdcols <- grepl("mean\\(\\)", names(combined)) | 
  grepl("std\\(\\)", names(combined)) 

## Keep the subjectID and activity columns 
meanstdcols[1:2] <- TRUE 

## Remove unnecessary columns 
combined <- combined[, meanstdcols] 


#####################################################
##                                                 ##
##                                                 ##
## Use descriptive activity names to name          ##
## the activities in the data set                  ##
##                                                 ## 
## This information is provided in the             ##
## 'Activities.txt' file                           ##
##                                                 ##
#####################################################

  
## Convert the activity column from integer to factor 
combined$activity <- factor(combined$activity, labels=c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")) 

#####################################################
##                                                 ##
##                                                 ##
## Create a second, independent tidy data         ##
## set with the average of each variable for       ##
## each activity and each subject.                 ##
#####################################################

## Clean up the data set  

melted <- melt(combined, id=c("subjectID","activity")) 
tidy <- dcast(melted, subjectID+activity ~ variable, mean) 

## Write the tidy data set to a text file with row.names=FALSE as required
write.table(tidy, "courseProjectDataset.txt", row.names=FALSE) 

## The file could also be written as a CSV if desired using the following
## This line was intentionally commented out
## write.csv(tidy, "courseProjectDataset.csv", row.names=FALSE) 
