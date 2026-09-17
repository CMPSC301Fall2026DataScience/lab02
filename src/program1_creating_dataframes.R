#!/usr/bin/env Rscript

# Name: TODO Add Your Name Here

# Program 1: Creating and Exploring Data Frames
#
# This program introduces the data.frame(), the core data structure
# for data analysis in R. You will build a small data frame from
# scratch, inspect it, and practice accessing rows, columns, and
# subsets. Several lines below contain BUGS - use the HINT comments
# to find and fix each one.

cat(strrep("=", 50), "\n")
cat("Program 1: Creating and Exploring Data Frames\n")
cat(strrep("=", 50), "\n")

# ------------------------------------------------------------------
# STEP 1: Create a data frame describing a small group of students
# BUG: one of the vectors below is missing a value, so its length
# does not match the others.
# HINT: every column vector in a data.frame() must be the same
# length. Count the names and compare to the ages.
# ------------------------------------------------------------------
students <- data.frame(
  name   = c("Amara", "Diego", "Priya", "Noah", "Yuki"),
  age    = c(20, 22, 21, 23),
  major  = c("Biology", "CS", "Statistics", "CS", "Biology"),
  gpa    = c(3.4, 3.8, 3.9, 2.9, 3.6),
  honors = c(FALSE, TRUE, TRUE, FALSE, TRUE)
)

cat("\nThe full data frame:\n")
print(students)

# ------------------------------------------------------------------
# STEP 2: Inspect the structure and summary statistics
# TODO: call str() on students to print its structure
# TODO: call summary() on students and print the result
# ------------------------------------------------------------------
cat("\nStructure of the data frame:\n")


cat("\nSummary statistics:\n")


# ------------------------------------------------------------------
# STEP 3: Access a single column with the $ operator
# BUG: the column name has the wrong capitalization.
# HINT: R is case-sensitive - column names must match exactly.
# ------------------------------------------------------------------
cat("\nAll student GPAs:\n")
print(students$Gpa)

# ------------------------------------------------------------------
# STEP 4: Access a single row (comma keeps ALL columns for that row)
# BUG: the comma is missing, so this selects a COLUMN, not a row.
# HINT: data frame indexing is students[row, column]. An empty
# column position means "keep every column".
# ------------------------------------------------------------------
cat("\nThe third student's record:\n")
print(students[3])

# ------------------------------------------------------------------
# STEP 5: Subset rows using a logical condition
# BUG: a single "=" is used instead of the comparison operator "==".
# HINT: "=" assigns a value; "==" checks for equality.
# ------------------------------------------------------------------
cat("\nStudents who are in Honors:\n")
print(students[students$honors = TRUE, ])

# ------------------------------------------------------------------
# STEP 6: Add a new column computed from an existing one
# BUG: the column name "hpa" does not exist - it's a typo.
# HINT: double-check the spelling against the columns you created
# in STEP 1.
# ------------------------------------------------------------------
students$gpa_percent <- (students$hpa / 4.0) * 100
cat("\nData frame with a new gpa_percent column:\n")
print(students)

cat("\n", strrep("=", 50), "\n")
cat("Program 1 Complete!\n")
cat(strrep("=", 50), "\n")
