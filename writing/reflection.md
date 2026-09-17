# Lab 02 Reflection

**Student Name:** Add Your Name Here
**Date:** TODO: Add the date

---

## Instructions

Now that you have completed all five R programs and explored the Shiny app, take some time to reflect on what you learned. Answer each question thoughtfully and in complete sentences. These questions are designed to help you think conceptually about data frames, statistics, visualization, and interactive tools - not just recall code syntax. Please use clear and meaningful language in your responses -- no one-liners or single-word answers, please!

---

## Conceptual Questions

### Question 1: What Is a Data Frame?

In your own words, explain what a data frame is and why it is described as "the heart of data science in R." How is a data frame different from a plain vector or a matrix?

**Your Answer:**

TODO: Write your answer here (3-5 sentences)

---

### Question 2: Accessing Data Frame Elements

Explain the difference between `students$gpa`, `students[3, ]`, and `students[students$honors == TRUE, ]`. What does each expression return, and when would you use one over the others?

**Your Answer:**

TODO: Write your answer here (3-5 sentences)

---

### Question 3: Built-in vs. External Data

In Program 2, you explored `mtcars` and `iris`, two datasets that come built into R. In Program 3, you read a CSV file from disk instead. Describe one advantage and one limitation of using built-in datasets versus reading in your own data file.

**Your Answer:**

TODO: Write your answer here (3-5 sentences)

---

### Question 4: Handling Missing Data

Program 3 demonstrated two ways of handling missing values: dropping incomplete rows and filling missing values with the column mean. Explain the trade-offs of each approach. Which approach did you use in your fixed code, and why might dropping rows be risky with a small dataset?

**Your Answer:**

TODO: Write your answer here (4-6 sentences)

---

### Question 5: Interpreting Statistics

In Program 4, you computed the mean, median, standard deviation, and correlation between `study_hours` and `exam_score`. What did the correlation value tell you about the relationship between these two variables? Would you consider it a strong or weak relationship, and why?

**Your Answer:**

TODO: Write your answer here (3-5 sentences)

---

### Question 6: Grouped Summaries

You used both `aggregate()` and `tapply()` to compute grouped statistics by major. Explain what "grouping" means in this context and why comparing averages across groups (rather than just one overall average) can reveal more useful insights.

**Your Answer:**

TODO: Write your answer here (3-5 sentences)

---

### Question 7: Choosing a Visualization

Program 5 used a scatterplot, a histogram, and a boxplot. Explain what kind of question each of these plot types is best suited to answer. Why would a boxplot be a poor choice for showing the relationship between two numeric variables?

**Your Answer:**

TODO: Write your answer here (4-6 sentences)

---

### Question 8: Debugging Data Frame Code

Several programs in this lab contained intentional bugs, such as mismatched vector lengths, incorrect column names, and using `=` instead of `==`. Describe the bug you found most difficult to identify. What was the error message (or unexpected output) that helped you track it down, and what strategy did you use to fix it?

**Your Answer:**

TODO: Write your answer here (4-6 sentences)

---

### Question 9: Real-World Applications

Think about real-world scenarios where analyzing a data frame full of survey or measurement data (like the student survey in this lab) would be useful. Describe at least two specific examples of how organizations might use this kind of data analysis to make decisions.

**Your Answer:**

TODO: Write your answer here (4-6 sentences)

---

## Shiny App Critical Thinking

The completed Shiny app let you build a data frame from a built-in dataset or from your own typed-in values, then generate a scatterplot, histogram, or boxplot.

### Question 10: Exploring with the Shiny App

Describe at least two different combinations of dataset and plot type that you tried in the Shiny app. What did you notice about how quickly you could compare different variables or datasets compared to writing a new R script for each one?

**Your Answer:**

TODO: Write your answer here (4-6 sentences)

---

### Question 11: Custom Data and Trustworthiness

When you entered your own X and Y values into the Shiny app, the app did not know whether your numbers represented a real phenomenon or were made up. What responsibilities does a data analyst have when presenting a chart, regardless of whether the underlying data is real or synthetic? Why is it important to be transparent about the source of your data?

**Your Answer:**

TODO: Write your answer here (4-6 sentences)

---

### Question 12: Interactive Tools vs. Scripts

Compare the experience of exploring data with the Shiny app to the experience of writing and running the R scripts in Programs 1-5. What are the advantages of an interactive app for exploring data quickly? What are the advantages of a written, reproducible script instead? Can you think of a situation where you would prefer one over the other?

**Your Answer:**

TODO: Write your answer here (4-6 sentences)

---

## Lab Feedback

### Feedback Question 1: Lab Difficulty

How would you rate the difficulty of this lab? Were the programs and the intentional bugs appropriately challenging, too easy, or too difficult? Which bug or program was the most challenging and why?

**Your Answer:**

TODO: Write your answer here (3-5 sentences)

---

### Feedback Question 2: Lab Improvements

What suggestions do you have for improving this lab? Was anything unclear in the instructions? Were the hints helpful? What would have made this lab better for your learning?

**Your Answer:**

TODO: Write your answer here (3-5 sentences)

---

## Completion Checklist

Before submitting, please make sure that the following have been addressed:

- Fixed all bugs and completed all TODOs in the five programs in `src/student/`
- Verified each program runs without errors in RStudio
- Explored the completed Shiny app in `src/shiny_app.R`
- Answered all 12 conceptual and critical thinking questions above
- Answered both feedback questions
- Added your name and date at the top of this document
- Reviewed your answers for completeness and clarity
- Committed and pushed all changes to GitHub

---
