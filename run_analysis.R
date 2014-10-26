# This script does the following.
#
# 1. Merges the training and the test sets to create one data set
# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names
# 5. From the data set in step 4, creates a second, independent tidy data set with the
#    average of each variable for each activity and each subject

##########################################################################################

# Setting the working directory
wd  <- "D:/OneDrive/Coursera/3 - Get and Cleaning Data/Project"
setwd( wd )
rm( wd )

# Loading stuff
source( "run_analysis.step0.R" )

# Step 1.
# Merging the training and the test sets to create one data set
source( "run_analysis.step1.R" )

# Step 2.
# Extracting only the measurements on the mean and standard deviation for each measurement
source( "run_analysis.step2.R" )

# Step 3
# Using descriptive activity names to name the activities in the data set
source( "run_analysis.step3.R" )

# Step 4
# Labelling the data set with descriptive variable names
source( "run_analysis.step4.R" )

# Step 5.
# Creating a second, independent tidy data set with the average of each variable for each
# activity and each subject
source( "run_analysis.step5.R" )

# Output
dataset     <- read.table( file = "dataset.txt", header = T )