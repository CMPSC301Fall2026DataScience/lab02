#!/usr/bin/env Rscript

# Name: TODO Add Your Name Here

# Program 2: Exploring Built-in Datasets
#
# R ships with many practice datasets. This program explores `mtcars`
# (car specifications) and `iris` (flower measurements) to practice
# inspecting, filtering, and summarizing data frames that we did not
# have to build ourselves. Several lines below contain BUGS - use the
# HINT comments to find and fix each one.

cat(strrep("=", 50), "\n")
cat("Program 2: Exploring Built-in Datasets\n")
cat(strrep("=", 50), "\n")

# ------------------------------------------------------------------
# STEP 1: Load and preview the mtcars dataset
# TODO: call data(mtcars) to load the dataset
# TODO: print the first 6 rows using head()
# TODO: print the structure using str()
# ------------------------------------------------------------------


cat("\nFirst 6 rows of mtcars:\n")


cat("\nStructure of mtcars:\n")


# ------------------------------------------------------------------
# STEP 2: Subset cars with good fuel economy (mpg > 25)
# BUG: the comma is missing, so this does not select rows correctly.
# HINT: data frame indexing is mtcars[row_condition, ] - notice the
# trailing comma that keeps every column.
# ------------------------------------------------------------------
cat("\nCars with more than 25 miles per gallon:\n")
print(mtcars[mtcars$mpg > 25])

# ------------------------------------------------------------------
# STEP 3: Compute the average horsepower across all cars
# BUG: the column name has the wrong capitalization.
# HINT: check the exact column names with names(mtcars) or str(mtcars).
# ------------------------------------------------------------------
cat("\nAverage horsepower across all cars:\n")
print(mean(mtcars$Hp))

# ------------------------------------------------------------------
# STEP 4: Load the iris dataset and inspect its structure
# ------------------------------------------------------------------
data(iris)
cat("\nStructure of iris:\n")
str(iris)

# ------------------------------------------------------------------
# STEP 5: Average Sepal.Length grouped by Species
# BUG: the formula uses the wrong capitalization for Sepal.Length.
# HINT: column names in iris use a capital letter for each word.
# ------------------------------------------------------------------
cat("\nAverage Sepal.Length by Species:\n")
print(aggregate(Sepal.length ~ Species, data = iris, FUN = mean))

# ------------------------------------------------------------------
# STEP 6: Count how many flowers belong to each species
# BUG: the column name has the wrong capitalization.
# HINT: use names(iris) to see the exact column names.
# ------------------------------------------------------------------
cat("\nNumber of flowers per species:\n")
print(table(iris$species))

cat("\n", strrep("=", 50), "\n")
cat("Program 2 Complete!\n")
cat(strrep("=", 50), "\n")
