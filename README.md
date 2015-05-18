####Repo includes the following files
**run_analysis.R** 
- R script to create a tidy dataset from the Samsung data.  The Samsung data folder, "UCI HAR Dataset" is assumed to be in the same directory as the script.  
- The following steps are performed in the script
 
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the mean and standard deviation measurements for each subject and activity (note: only mean() and std() features were selected, meanFreq() was not considered a "mean value" measurement.)
  3. Added a column to describe activity name in the data set
  4. Appropriately labels the data set with descriptive variable names as per features.txt provided in the Samsung data.  For additional information, refer to features_info.txt
  5. From the data set in step 4, output a tidy data set ("Tidy_Dataset.txt") with the average of each variable for each activity and each subject.  

**Tidy_Dataset.txt** 
- Dataset output produced by the run_analysis.R script
- To read in the dataset, use the following command in r:  read.table("Tidy_Dataset.txt", header=TRUE)
- 6 activities by 30 subjects, a 180x69 table with the average for each variable for each activity and each subject

**Codebook.md** 
- Codebook describing the variable names in Tidy_Dataset.txt


