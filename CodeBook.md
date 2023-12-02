#This is the code book for the project

##How to get to the tinyData.txt:
1. Download data from the link below and unzip it into working directory of R Studio.
2. Execute the R script.

##Information About the Original Data
The original dataset is derived from the Human Activity Recognition Using Smartphones Data Set. You can find a comprehensive description of the dataset at this web address:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The dataset required for this project is available for download here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## About R script
This R code performs a series of data processing and analysis steps on a Human Activity Recognition dataset. Here's a summary according to the step labels in the comments:

Step 1: Merge Training and Test Sets
   - 1.1: Load Data from Files: Training and test datasets are loaded. This includes the main data (features), outcome variables (activity labels), and subject IDs for both training and test sets.
   - 1.1.3: Load Feature Names: Feature names are loaded from a file. These names correspond to the columns in the main data sets.
   - 1.1.4: Load Activity Labels: Activity labels are loaded, providing descriptive names for each activity.
   - 1.2: Set Column Names: Columns in the training and test datasets are named using the loaded feature names, activity IDs, and subject IDs.
   - 1.3: Combine Training and Test Datasets: The training and test data are combined into a single dataset for further analysis.

Step 2: Extract Measurements on Mean and Standard Deviation
   - 2.1: Identify Column Names: The code retrieves column names from the combined dataset.
   - 2.2: Define Criteria for Mean and Standard Deviation Columns: A logical vector is created to identify columns related to mean, standard deviation, activity ID, and subject ID.
   - 2.3: Filter Dataset Based on Criteria: The dataset is filtered to include only columns related to mean, standard deviation, activity ID, and subject ID.

Step 3: Use Descriptive Activity Names
   - This step involves merging the filtered dataset with activity labels to include descriptive names for the activities.

Step 4: Label the Dataset with Descriptive Variable Names
   - The dataset already has descriptive names assigned to its variables from the previous steps.

Step 5: Create a Second, Independent Tidy Data Set
   - 5.1: Prepare for Aggregation: Only numeric columns are selected for aggregation, as mean calculations can only be performed on numeric data.
   - 5.2: Aggregate Data: The data is aggregated to calculate the average of each variable for each activity and subject combination.
   - 5.3: Save the Tidy Dataset: The final tidy dataset, which contains aggregated averages, is saved to a text file for future use or sharing.

Overall, our script is focused on merging, processing, and tidying a dataset for analysis, particularly emphasizing the extraction of mean a
nd standard deviation measurements, and organizing the data in a structured, easy-to-understand format.

