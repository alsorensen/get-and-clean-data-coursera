# get-and-clean-data-coursera
### Getting and Cleaning Data Course Project

Below is a description of the data, the variables, and transformations performed in the script `run_analysis.R` to clean up the data.

### The data

The data named `UCI HAR Dataset` represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using the embedded accelerometer and gyroscope, 
3-axial linear acceleration and 3-axial angular velocity was captured at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for 
generating the training data and 30% the test data.

For further details please go to the site where the data was obtained:

  <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The data used for the project is from the following zip file:

  <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

 In the data zip file above you find the two files `features_info.txt` and `features.txt`.
 A general introduction and desciption of the 561 features in the test and training data can be found in `features_info.txt`. 
 The complete list of variables in the data of each feature vector is available in `features.txt`.
 
 
### The variables

Here is a short description of the variables used in the analysis. Further details below when describing the 
script `run_analysis.R`.

#### Part 1

First the data from the `UCI HAR Dataset` is loaded into:

    `activity_labels` links the class labels with their activity name.
    `features` is the list of all features.
    `x_test` the test set.
    `y_test` the test labels.
    `subject_test` contains the ID of subject who performed the test activity.
    `x_train` the training set.
    `y_train` the training labels.
    `subject_train` contains the ID of the subject who performed the training activity.

Afterwards the data is merged into one dataset named `output1`.

#### Part 2

The next step is to create a dataset named `output2` that contains only the measurements on the mean and standard deviation for each measurement.

#### Part 3
In step 3 descriptive activity names to name the activities are included. These are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING mentioned in the introduction. The result is `output3`.

#### Part 4
In the fourth step we label the data set `output3` with descriptive variable names and output the tidy data set `output4` to the file `output.txt` in the data folder.

#### Part 5
From the data set `output4`, we create a second, independent tidy data set `output5` with the average of each variable for each activity and each subject, which is written to the file `output2.txt` in the data folder.

### The script `run_analysis.R`

The script is divided into 6 steps, described below. In the script the library `dplyr` is used.

#### Step 0
This is the initial and optional step, where the `UCI HAR Dataset` is download and unzipped to the data folder in the working directory. The data folder is created if it does not exist.

#### Step 1
Here features, labels, test data and trainig data is read. These data is the merged using `cbind` and `rbind` to create one data set `output1`.

#### Step 2
This step extracts only the measurements on the mean and standard deviation for each measurement in `output1` using `grep`. The result is called `output2`.

#### Step 3
Here the descriptive activity names are used to name the activities in the data set `output2`. The result is called `output3`.

#### Step 4
In this step we follow the recommendations for names of variables from the lectures and use `gsub`.
We appropriate label the data set to make descriptive variable names in the tidy data set `output4`
and finally output the data to the file `output.txt` in the data folder.

#### Step 5
From the data set `output4`, we create a second, independent tidy data set `data_step5` with the average of each variable for each activityID and each subject by the use of `aggregate` with `FUN = mean` on a `data_extract` from `output4`, where the column `activity` is dropped. 

After the above computation of the `mean` the column `activity` is merged on to the dataset to create the final dataset `output5`,
which is also written to the file `output2.txt` in the data folder.
