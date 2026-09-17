#!/usr/bin/env Rscript

# Name: TODO Add Your Name Here

# Program 5: Data Visualization
#
# This program builds several base-R plots from the student survey
# data and the built-in iris dataset: a scatterplot with a trend
# line, a histogram, a boxplot by group, and a scatterplot matrix.
# Several lines below contain BUGS - use the HINT comments to find
# and fix each one.

cat(strrep("=", 50), "\n")
cat("Program 5: Data Visualization\n")
cat(strrep("=", 50), "\n")

survey <- read.csv("data/student_survey.csv", stringsAsFactors = FALSE)

# ------------------------------------------------------------------
# STEP 1: Scatterplot of study_hours vs. exam_score with a trend line
# BUG: the arguments to lm() are reversed. In lm(), the formula is
# written response ~ predictor (y ~ x), not the other way around.
# HINT: we are predicting exam_score FROM study_hours.
# ------------------------------------------------------------------
plot(
  survey$study_hours, survey$exam_score,
  main = "Study Hours vs. Exam Score",
  xlab = "Study hours",
  ylab = "Exam score",
  pch = 19,
  col = "steelblue"
)
abline(lm(study_hours ~ exam_score, data = survey), col = "firebrick", lwd = 2)

# ------------------------------------------------------------------
# STEP 2: Histogram of exam scores
# TODO: create a histogram of survey$exam_score using hist().
#       Give it a main title, an xlab, a col of your choice, and
#       breaks = 8
# ------------------------------------------------------------------


# ------------------------------------------------------------------
# STEP 3: Boxplot of exam scores grouped by major
# BUG: the formula's left and right sides are swapped. We want to
# group exam_score BY major, so the response comes first.
# HINT: formulas are written response ~ grouping_variable.
# ------------------------------------------------------------------
boxplot(
  major ~ exam_score,
  data = survey,
  main = "Exam Scores by Major",
  xlab = "Major",
  ylab = "Exam score",
  col = "lightyellow"
)

# ------------------------------------------------------------------
# STEP 4: A scatterplot matrix using the built-in iris dataset
# BUG: iris only has 4 numeric measurement columns (column 5,
# Species, is a factor/category, not a measurement).
# HINT: use iris[, 1:4] to select only the numeric columns.
# ------------------------------------------------------------------
data(iris)
pairs(
  iris[, 1:5],
  main = "Iris Measurements Scatterplot Matrix",
  col = as.numeric(iris$Species)
)

cat("\n", strrep("=", 50), "\n")
cat("Program 5 Complete! Check the Plots pane in RStudio.\n")
cat(strrep("=", 50), "\n")
