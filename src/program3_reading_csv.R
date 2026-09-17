#!/usr/bin/env Rscript

# Name: TODO Add Your Name Here

# Program 3: Reading and Cleaning CSV Data
#
# Real data rarely arrives perfectly clean. This program reads a
# synthetic student survey from a CSV file, checks for missing
# values, and demonstrates two common cleaning strategies: dropping
# incomplete rows and filling in missing values with the mean.
# Several lines below contain BUGS - use the HINT comments to find
# and fix each one.
#
# NOTE: Run this script with the lab folder as your working directory
# (open the lab folder as an RStudio Project) so the relative path
# "data/student_survey.csv" resolves correctly.

cat(strrep("=", 50), "\n")
cat("Program 3: Reading and Cleaning CSV Data\n")
cat(strrep("=", 50), "\n")

# ------------------------------------------------------------------
# STEP 1: Read the CSV file into a data frame
# BUG: the file path is missing the "data/" folder prefix.
# HINT: look at the project's folder structure - where does the
# CSV file actually live relative to the lab folder?
# ------------------------------------------------------------------
survey <- read.csv("student_survey.csv", stringsAsFactors = FALSE)

# Cool trick: use file.choose() to open a file dialog and select the CSV file
# Example: survey <- read.csv(file.choose(), stringsAsFactors = FALSE)
# Then use string variable to store the selected file path
# and pass it to read.csv() like this:
# file_path <- file.choose()
# survey <- read.csv(file_path, stringsAsFactors = FALSE)
# This is useful if you do not want to hard-code the file path, 
# but it will not work in an automated execution environment. :-(

cat("\nStructure of the survey data:\n")
str(survey)

cat("\nFirst 6 rows:\n")
print(head(survey))

# ------------------------------------------------------------------
# STEP 2: Check how many missing values (NA) are in each column
# TODO: use colSums() together with is.na() to count NAs per column
# ------------------------------------------------------------------
cat("\nMissing values per column:\n")


# ------------------------------------------------------------------
# STEP 3: Create a "clean" version by dropping rows with any NA
# in the exam_score column
# BUG: the "!" (NOT) is missing, so this keeps ONLY the rows that
# ARE missing, which is the opposite of what we want.
# HINT: we want to KEEP rows where exam_score is NOT NA.
# ------------------------------------------------------------------
survey_clean <- survey[is.na(survey$exam_score), ]
cat("\nRows remaining after dropping missing exam_score:\n")
print(nrow(survey_clean))

# ------------------------------------------------------------------
# STEP 4: Compute the mean exam score, ignoring remaining NAs
# BUG: na.rm = TRUE is missing, so any remaining NA makes the
# result NA.
# HINT: mean() needs to be told to ignore missing values.
# ------------------------------------------------------------------
cat("\nAverage exam score:\n")
print(mean(survey_clean$exam_score))

# ------------------------------------------------------------------
# STEP 5: Instead of dropping rows, fill missing study_hours with
# the column mean (a common alternative to deleting data)
# TODO: compute mean_study_hours using mean() with na.rm = TRUE
# TODO: assign mean_study_hours into the NA positions of
#       survey$study_hours using is.na()
# ------------------------------------------------------------------


cat("\nMissing values per column after filling study_hours:\n")
print(colSums(is.na(survey)))

cat("\n", strrep("=", 50), "\n")
cat("Program 3 Complete!\n")
cat(strrep("=", 50), "\n")
