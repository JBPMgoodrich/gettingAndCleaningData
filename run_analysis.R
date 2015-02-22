##
##    run_analysis.R
##
library(stringr)  ## for use of tolower()

##    Setup working directory and go there
##
setup<- function(dirName="workingDir"){
      if( !file.exists(dirName)) dir.create(dirName)
      else print("Working directory already exists")
      setwd(dirName)
      print( list.files() )
}
setup()

##    Download descriptions of data AND data
##    Unzip data file
##    Move to data file directory
##
getFiles<- function( descriptionFile="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
                   ,rawDataFile=     "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                   ,dirName=         "UCI HAR Dataset"
                   ){
      if( !file.exists("descriptionFile.html")) download.file(descriptionFile ,destfile="descriptionFile.html")
      if( !file.exists("dataFile.zip"))         download.file(rawDataFile ,destfile="dataFile.zip" ,mode="wb")
      print( list.files() )

      if( !file.exists(dirName)) unzip("dataFile.zip")
      
      setwd(dirName)
      print( list.files() )
}
getFiles()


## To merge data sets need to input each first
##
inputFiles<- function(subDir="train"){
      setwd(subDir)   
      print( list.files() )
      
      ## file subDir/"subject_"subDir".txt"
      ##    each row identifies subject who performed activity for each window sample
      ##    range is 1 to 30
      ##
      ## file subDir/"y_"subDir".txt"contains "labels"
      ##
      ## file subDir/"x_"subDir".txt"contains "data"
      ##
      ## file "features.txt" contains feature (variable) names
      ##            
      if(subDir=="train"){
            subjectFile<- "subject_train.txt"
            labelFile<-   "y_train.txt"
            dataFile<-    "x_train.txt"    
      } else{
            subjectFile<- "subject_test.txt"
            labelFile<-   "y_test.txt"
            dataFile<-    "x_test.txt"    
      }
            variableFile<-"..\\features.txt"
      
      subjects<- read.table(subjectFile)
      colnames(subjects)<- "subject"
      
      labels<- read.table(labelFile)
      colnames(labels)<- "label"
      
      data<- read.table(dataFile)
      
      variables<- read.table(variableFile)
      colnames(variables)<- c("variablePosition" ,"variableName")

      ## 2. REQUIREMENT: Extract only "measurments" on mean and standard deviation for each measurement
      ## get variable names and "positions" for mean and standard deviation of each measurement
      ##
      meanPositions<- grep("mean", variables$variableName ,ignore.case=TRUE)
      ##print( variables[meanPositions,] )
      
      stdPositions<- grep("std", variables$variableName ,ignore.case=TRUE)
      ##print( variables[stdPositions,] )
      
      foundVariables<- c(meanPositions ,stdPositions)
      keepVariables<- variables[foundVariables,]
      
      ## 4. REQUIREMENT: Appropriately label data set with descriptive variable names
      ## ensure legal R names
      ## trim out "." in variable names AND all lower case
      ##
      keepVariables$variableName<- make.names(keepVariables$variableName ,unique=TRUE)
      keepVariables$variableName<- tolower(gsub("\\." ,"" ,keepVariables$variableName))
      
      ## rename meaningless variable names to meaningful ones
      ##
      renameNames<- colnames(data)
      for(i in 1:length(foundVariables)) {
            variablePosition<- keepVariables$variablePosition[i]
            variableName<- as.character(keepVariables$variableName[i])
            renameNames[variablePosition]<- variableName
      }
      colnames(data)<- renameNames

      ## keep only the selected variables
      ##
      subData1 <- subset( data ,select=as.character(keepVariables$variableName) )
      
      ## combine subjects, labels (activities), and selected measurements
      ##
      data<- cbind(subjects ,labels ,subData1)
      ##
      ## check ## print( xtabs(~ subject + label ,data=data) ) 
      
      #return
      data
}

## 0.a. REQUIREMENT: Input data set train
trainData<- inputFiles("train")

## 0.b. REQUIREMENT: Input data set test
setwd("..")       ## return to main data set directory  (from train)
testData<- inputFiles("test")

## 1. REQUIREMENT: Merge the training and test data sets to create one data set
fullData<- merge(testData ,trainData ,all=TRUE)



### NEW CODE for this version ###

## 3. REQUIREMENT: Use descriptive activity names to name the activities in the data set
## input descriptive activity names
setwd("..")       ## return to main data set directory (from test)
activities<- read.table("activity_labels.txt")
colnames(activities) <- c("label" ,"activity")
data<- merge(fullData ,activities)
data<- data[,-1]  ## "drops" the first column of data (level), which don't need after there merge


## 5. REQUIREMENT: Create separate tidy data set with average of each variable for each activity for each subject
## create unique "combination variable" for subject and level combinations
##
comboSubjectLevel<- ( data[,1] + max(data[,1]) * (as.numeric(data[,88])-1) )
subject<- tapply( data$subject ,comboSubjectLevel ,mean )               ## way to check the combo didn't corrupt things
label<- tapply( as.numeric(data$activity) ,comboSubjectLevel ,mean )  ## way to check the combo didn't corrupt things

## create data frame of mean values to then write out
##
tmp<- cbind(subject ,label)   
meanValues<- merge(tmp ,activities) ## get back the meaningful name of activities, e.g. "WALKING"
meanValues<- meanValues[-1]         ## "drops" the first column of data (level), which don't need after there merge

## loop through variables to get their mean by combo Subject and activity
##
for(i in 2:87) {
      meanValues<- cbind(  meanValues ,tapply( data[,i] ,comboSubjectLevel ,mean )  )
      colnames(meanValues)[i+1]<- colnames(data)[i]   ## get back the column name for each mean value
}


## Create tidy data set as a txt file using write.table() with  row.name=FALSE
setwd("..")       ## return to working directory
write.table(data ,file="tidyData.txt" ,row.name=FALSE)
write.table(meanValues ,file="tidyData2.txt" ,row.name=FALSE)

setwd("..")       ## return to starting directory