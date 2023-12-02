# Project for Week 4 of "Getting and Cleaning Data (GCDC)" Course
This repository is for the Week 4 project in Coursera's "Getting and Cleaning Data" course. 
It includes the R script, a detailed codebook, and the resultant tidy data set for the given assignment.

## Contents of this Repository:
- CodeBook.md: This document details the usage instructions, describes the variables, the original data, 
and outlines the transformation processes and cleaning procedures applied to the data.

- run_analysis.R: This script encompasses all the steps required to execute the analysis as per the project's requirements. 
The script can be easily run in RStudio by importing the file. 
The analysis process is divided into five key steps:
   1. Combining the training and test datasets to form a unified dataset.
   2. Selecting only the measurements on the mean and standard deviation for each measurement.
   3. Applying descriptive names to the activities within the dataset.
   4. Labeling the dataset with descriptive names for each variable.
   5. Generating a secondary, clean tidy data set from step 4, averaging each variable for every activity and subject.

- tidyData.txt: This file is the end product of the fifth step, representing the cleaned and processed data set.
