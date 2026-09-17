#!/usr/bin/env Rscript

# Name: TODO Add Your Name Here

# Program 4: Statistical Analysis
#
# This program applies common descriptive statistics and grouped
# summaries to the student survey data: measures of center, spread,
# correlation, and group comparisons using aggregate() and tapply().
# Several lines below contain BUGS - use the HINT comments to find
# and fix each one.

cat(strrep("=", 50), "\n")
cat("Program 4: Statistical Analysis\n")
cat(strrep("=", 50), "\n")

survey <- read.csv("data/student_survey.csv", stringsAsFactors = FALSE)

# ------------------------------------------------------------------
# STEP 1: Measures of center and spread for exam_score
# BUG: R's standard deviation function is not called std().
# HINT: what is the correct base-R function name for standard
# deviation? Try ?sd in the console.
# ------------------------------------------------------------------
cat("\nExam score summary statistics:\n")
cat("Mean:  ", mean(survey$exam_score, na.rm = TRUE), "\n")
cat("Median:", median(survey$exam_score, na.rm = TRUE), "\n")
cat("SD:    ", std(survey$exam_score, na.rm = TRUE), "\n")
cat("Range: ", range(survey$exam_score, na.rm = TRUE), "\n")

# ------------------------------------------------------------------
# STEP 2: Quantiles give a fuller picture of the distribution
# TODO: print the quantiles of survey$exam_score using quantile(),
#       remembering to ignore missing values
# ------------------------------------------------------------------
cat("\nExam score quantiles:\n")


# ------------------------------------------------------------------
# STEP 3: Correlation between study_hours and exam_score
# BUG: use = "complete.obs" is missing, so NA values in either
# column cause cor() to return NA.
# HINT: cor() needs to be told how to handle missing values, just
# like mean() needs na.rm.
# ------------------------------------------------------------------
cat("\nCorrelation between study_hours and exam_score:\n")
print(cor(survey$study_hours, survey$exam_score))

# ------------------------------------------------------------------
# STEP 4: Average exam score grouped by major
# ------------------------------------------------------------------
cat("\nAverage exam score by major:\n")
print(aggregate(exam_score ~ major, data = survey, FUN = mean))

# ------------------------------------------------------------------
# STEP 5: Use tapply() to compute average study hours by major
# BUG: tapply() is missing na.rm = TRUE, which is needed because
# study_hours has missing values.
# HINT: extra arguments after the function name in tapply() are
# passed along to that function.
# ------------------------------------------------------------------
cat("\nAverage study hours by major (tapply):\n")
print(tapply(survey$study_hours, survey$major, mean))

# ------------------------------------------------------------------
# STEP 6: Identify students who scored above the class average
# TODO: compute class_average using mean() with na.rm = TRUE
# TODO: build above_average by subsetting survey where exam_score
#       is not NA AND exam_score is greater than class_average
# ------------------------------------------------------------------


cat("\nStudents scoring above the class average:\n")

cat("\n", strrep("=", 50), "\n")
cat("Program 4 Complete!\n")
cat(strrep("=", 50), "\n")
