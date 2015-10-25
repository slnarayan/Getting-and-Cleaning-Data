# Getting-and-Cleaning-Data

The files present in this repo are created to share the output of project course work

File Inventory: 
- run_analysis.R - R Script created to perform the project coursework actions
- assignActivityNames.R - R Script to lookup & assign activity names from activity_labels.txt to extracted dataset 
- assigncolnames.R - R Script to read column names from features.txt and assign those to the extracted dataset 
- courseprojectoutput.txt - The tidy data set created by running the run_analysis.R script

Prior to running the script, the following files should be available in the current working directory:
- run_analysis.R
- assignActivityNames.R
- assigncolnames.R
- subject_test.txt
- X_test.txt
- y_test.txt
- subject_train.txt
- X_train.txt
- y_train.txt
- features.txt
- activity_labels.txt

Running the script
- source("run_analysis.R")
Output
- The output file courseprojectoutput.txt will be created in the working directory