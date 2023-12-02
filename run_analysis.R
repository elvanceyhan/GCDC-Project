library(plyr)

############## LOAD DATA ################################################
#Set Working Directory to Source File Location
library("rstudioapi") # Load rstudioapi package

setwd(dirname(getActiveDocumentContext()$path)) # Set working directory to source file location
getwd() # Check updated working directory

#one has to first download and unzip the data in the current directory
#it has to be in the folder "UCI HAR Dataset" in the current folder where this R file is

# Step 1: Merge the training and the test sets to create one data set.
# Step 1.1: Load Data from Files

# Step 1.1.1 Load Training Data
# Load the main training data (features), outcome variable (activity labels), and subject IDs
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)  # Feature dataset for training
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)  # Activity labels for training
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)  # Subject IDs for training dataset

# Step 1.1.2 Load Test Data
# Similarly, load the test data: features, labels, and subject IDs
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)  # Feature dataset for testing
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)  # Activity labels for testing
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)  # Subject IDs for testing dataset

# Listing Files in the Dataset Directory
list.files("UCI HAR Dataset")

# Step 1.1.3: Load the Feature Names
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)

# Step 1.1.4: Load Activity Labels
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

# Step 1.2: Set Column Names for Datasets
# Assign feature names to the columns of training and test datasets
colnames(x_train) <- features[,2]  
# The second column of the features dataset contains the actual feature names
colnames(x_test) <- features[,2]

# Assign 'activityID' as the column name for activity labels in both training and test datasets
colnames(y_train) <- "activityID"
colnames(y_test) <- "activityID"

# Assign 'subjectID' as the column name for subject IDs in both training and test datasets
colnames(subject_train) <- "subjectID"
colnames(subject_test) <- "subjectID"

# Name the columns of the activity labels dataset as 'activityID' and 'activityType'
colnames(activity_labels) <- c("activityID", "activityType")

# Step 1.3: Combine Training and Test Datasets
# Combine the training and test datasets into a single dataset for analysis.
train_comb <- cbind(y_train, subject_train, x_train)  
# Combine training data: activity labels, subject IDs, and features
test_comb <- cbind(y_test, subject_test, x_test)     
# Combine test data: activity labels, subject IDs, and features
all_comb <- rbind(train_comb, test_comb)             
# Merge the combined training and test datasets

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement
# This step filters the dataset to include only the columns related to mean and standard deviation.

# Step 2.1 Identify Column Names
colNames <- colnames(all_comb)  # Retrieve column names from the combined dataset

# Step 2.2 Define Criteria for Mean and Standard Deviation Columns
# Create a logical vector to identify columns related to mean, standard deviation, activity ID, and subject ID
mean_stddev <- (grepl("activityID", colNames) |
                    grepl("subjectID", colNames) |
                    grepl("mean..", colNames) |
                    grepl("std...", colNames))

# Step 2.3 Filter Dataset Based on Criteria
data_mean_stddev <- all_comb[ , mean_stddev]  
# Subset the dataset to include only the specified columns

# Step 3: Use descriptive activity names to name the activities in the data set
# Merge the filtered dataset with the activity labels for more descriptive data.
data_activity_names <- merge(data_mean_stddev, activity_labels,
                             by = "activityID",
                             all.x = TRUE)

# Step 4: Appropriately label the data set with descriptive variable names
# The dataset is already labeled with descriptive names in previous steps.

# Step 5: From the data set in step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# Step 5.1 Prepare for Aggregation
# Select only numeric columns for aggregation. Non-numeric columns cannot be averaged.
numeric_data <- data_activity_names[sapply(data_activity_names, is.numeric)]

# Step 5.2 Aggregate Data
# Calculate the average for each combination of subject ID and activity ID
tidy_data <- aggregate(. ~ subjectID + activityID, numeric_data, mean)
tidy_data <- tidy_data[order(tidy_data$subjectID, tidy_data$activityID), ]  
# Sort by subject ID and activity ID

# Step 5.3 Save the Tidy Dataset
# Write the final tidy dataset to a text file for future use or sharing.
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
