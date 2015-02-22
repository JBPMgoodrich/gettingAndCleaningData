---
title: "Course Project for Getting and Cleaning Data"
author: "James Goodrich"
date: "Saturday, February 21, 2015"
output: html_document
---

</br>
This file gives an overview of 4 course project files, including itself.  In addition, it describes one of the other files in detail.

  The course project submission is composed of the following four files:

    1. **README.md** - This markdown file you are reading, which inventories the set of 4 submssion files, describing 1 in detai.
    2. **run_analysis.R** - An R script that transforms provided raw data to a "tidier" data set.
    4. **tidyData2.txt** - Primary output of **run_analysis.R**.  NOTE: It was submitted on coursera.org so is not included here.
    3. **CodeBook.md** - A markdown file describing the contents of tidyData2.txt.
    NOTE: The reminder of this markdown file describes requirements of **run_analysis.R** and documents how those requirements are met.


</br>
</br>
  The requirements for an R script **run_analysis.R** were:

    1. Merge the training and the test sets to create one data set.
    2. Extract only the measurements on the mean and standard deviation for each measurement. 
    3. Use descriptive activity names to name the activities in the data set.
    4. Appropriately label the data set with descriptive variable names. 
    5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

</br>
  A. As coded, the R script **run_analysis.R** began with some preliminary steps:

    0. Include the R library **stringr** for access to its function tolower()
    1. Define and use internal function setup() to check for a specified working directory and create it if it doesn't exist
    2. Define and use getFiles() to download and unzip raw "data set" from specified URL if data set doesn't exist
    NOTE: Throughout preliminaries and during rest of script, the process navigates an expected directory tree for the data set

</br>
  B. Next, the R script **run_analysis.R** completed operations to input the raw data:

    NOTE: I created an internal function inputFiles() applied twice, once on "train" data and again on "test" data
    1. Four raw files are input using read.table: 
       - subject_XXX.txt, where XXX is train or test, was stored in data.frame *subjects*
       - y_XXX.txt, where XXX is train or test, into *labels*
       - x_XXX.txt into *data*
       - features.txt into *variables*
    2. Use colnames()<- to rename variables meaningfully
    3. Search *variables* using grep() to locate the ones to keep as specified in **REQ 2**
    4. While doing other manipulations of *data*, handle **REQ 4** using make.names() and tolower()
    5. Use subset() to keep only the measurements of means and standard deviations
    6. Use cbind() to combine subset *data* with "keys", i.e. with subject and "label", from correspoding rows of other input files

</br>
  C. Next, **run_analysis.R** completed steps:

    1. Use merge() to put together training and test data sets, meeting **REQ 1**
    2. Input an addtional file activity_labels.txt with descriptive names for activities.
    3. Merge in the activity (descriptive name), then drop out the numeric variable level, meeting **REQ 3**

</br>
  D. Next, created the second of two "tidy data sets":

    1. Create a variable *comboSubjectLevel* with value unique to combination of subject and activity (level)
    2. cbind() the subject and level variables to create a data.frame that will also store mean values
    3. Repeat step C.3 to get back to the descriptive name activity in place of numeric variable level
    4. Iterate across *data* as it exists after step C.3:
       - Use cbind() to combine mean of each numeric variable resulting from tapply() with mean on *comboSubjectLevel* 
       - Use colnames()<- to get back meaningful name of the variable whose mean was just calculated
    NOTE: Likely there is easier, more "R-like" way for these steps but this matched pivot table test in Excel on tidyData.txt
   
</br>
  E. And finally, to complete **REQ 5**, etc.

    1. Use write.table() to output tidyData2.txt, i.e. the data set of means for selected variables by subject and by activity
    2. Also output tidyData.txt, the larger data set resulting from Step C.3
    NOTE: At this point, the script ends with process back in starting working directory

</br>
</br>
