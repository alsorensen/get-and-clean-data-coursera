# get-and-clean-data-coursera
### Getting and Cleaning Data Course Project

Included in this repository you find this file `README.md`, the R script `run_analysis.R` for performing the analysis, as well as the file `CODEBOOK.md` that describes the variables, the data, and transformations performed to clean up the input data.

In the script run_analysis.R the following steps are performed:

    0 Initial (optional) step: Download and unzip data to the data folder. Create data folder if it does not exist.
    1 Read features, labels and data, and merge the training and the test sets to create one data set.
    2 Extract only the measurements on the mean and standard deviation for each measurement.
    3 Use descriptive activity names to name the activities in the data set.
    4 Appropriately label the data set with descriptive variable names and output the data to output.txt
    5 Create a second data set (output2.txt) with the average of each variable for each activity and each subject.

The results are written to the two files `output.txt` and `output2.txt` in the data folder.
