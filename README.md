# get-and-clean-data-coursera
### Getting and Cleaning Data Course Project

Included in this repository you find the following files:

* `README.md` (this file), 
* `run_analysis.R` the R script for performing the analysis, and 
* `CODEBOOK.md` that describes the variables, the data, and transformations performed to clean up the input data.

As a bonus you also find the two files:

* `output.txt` the output from fourth step described below
* `output2.txt` the output from fifth step described below

In the script run_analysis.R the following steps are performed:

    0 Initial (optional) step: Download and unzip data to the data folder. Create data folder if it does not exist.
    1 Read features, labels and data, and merge the training and the test sets to create one data set.
    2 Extract only the measurements on the mean and standard deviation for each measurement.
    3 Use descriptive activity names to name the activities in the data set.
    4 Appropriately label the data set with descriptive variable names and output the tidy data to output.txt
    5 Create a second tidy data set (output2.txt) with averages of each variable for each activity and each subject.

The results are written to the two files `output.txt` and `output2.txt` in the data folder.

For more detailed information please take a look at the `CODEBOOK.md` file and the the R script `run_analysis.R`.
