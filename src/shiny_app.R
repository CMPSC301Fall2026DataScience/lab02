#!/usr/bin/env Rscript
# OBC

# Shiny App: Build-Your-Own Data Frame Explorer
#
# This app is provided complete and ready to run - no bugs to fix!
# It lets you build a small data frame either by choosing a built-in
# synthetic dataset or by typing in your own numbers, then create a
# scatterplot, histogram, or boxplot from it.
#
# To run this app in RStudio:
#   1. Install shiny once with: install.packages("shiny")
#   2. Open this file and click the "Run App" button, OR
#      run in the console: shiny::runApp("src/shiny_app.R")

library(shiny)

# ------------------------------------------------------------------
# Built-in synthetic datasets students can explore without typing
# any numbers themselves
# ------------------------------------------------------------------
built_in_datasets <- list(
  "Student Survey (CSV)" = tryCatch(
    read.csv("data/student_survey.csv", stringsAsFactors = FALSE),
    error = function(e) NULL
  ),
  "Cars (mtcars)" = mtcars,
  "Flowers (iris)" = iris,
  "Synthetic Sales" = data.frame(
    week = 1:10,
    revenue = c(1200, 1350, 1100, 1600, 1750, 1500, 1900, 2100, 1950, 2300),
    ad_spend = c(200, 220, 180, 260, 300, 250, 320, 350, 330, 380)
  )
)

ui <- fluidPage(
  titlePanel("Build-Your-Own Data Frame Explorer"),
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        "data_source", "Where should the data come from?",
        choices = c("Use a built-in dataset" = "builtin", "Enter my own data" = "custom"),
        selected = "builtin"
      ),

      # Shown only when using a built-in dataset
      conditionalPanel(
        condition = "input.data_source == 'builtin'",
        selectInput("dataset_name", "Choose a dataset:", choices = names(built_in_datasets)),
        uiOutput("column_selectors")
      ),

      # Shown only when the student wants to build their own data frame
      conditionalPanel(
        condition = "input.data_source == 'custom'",
        textAreaInput("custom_x", "X values (comma-separated numbers):", value = "1, 2, 3, 4, 5"),
        textAreaInput("custom_y", "Y values (comma-separated numbers):", value = "10, 14, 13, 18, 22"),
        textInput("custom_x_label", "X axis label:", value = "x"),
        textInput("custom_y_label", "Y axis label:", value = "y")
      ),

      selectInput(
        "plot_type", "Plot type:",
        choices = c("Scatterplot" = "scatter", "Histogram (X only)" = "hist", "Boxplot (X only)" = "box")
      ),
      selectInput(
        "plot_color", "Plot color:",
        choices = c("steelblue", "firebrick", "darkgreen", "purple", "orange")
      ),
      actionButton("show_code", "Show Code")
    ),
    mainPanel(
      plotOutput("main_plot"),
      h4("Data used for this plot"),
      tableOutput("data_preview")
    )
  )
)

server <- function(input, output, session) {

  # Let the student pick which two numeric columns to plot when
  # using a built-in dataset
  output$column_selectors <- renderUI({
    req(input$dataset_name)
    df <- built_in_datasets[[input$dataset_name]]
    numeric_cols <- names(df)[sapply(df, is.numeric)]
    tagList(
      selectInput("builtin_x", "X column:", choices = numeric_cols, selected = numeric_cols[1]),
      selectInput("builtin_y", "Y column:", choices = numeric_cols,
                  selected = numeric_cols[min(2, length(numeric_cols))])
    )
  })

  # Build the working data frame from whichever source the student chose
  plot_data <- reactive({
    if (input$data_source == "builtin") {
      req(input$builtin_x, input$builtin_y)
      df <- built_in_datasets[[input$dataset_name]]
      data.frame(
        x = df[[input$builtin_x]],
        y = df[[input$builtin_y]]
      )
    } else {
      x_vals <- as.numeric(trimws(strsplit(input$custom_x, ",")[[1]]))
      y_vals <- as.numeric(trimws(strsplit(input$custom_y, ",")[[1]]))
      validate(need(length(x_vals) == length(y_vals),
                     "X values and Y values must have the same number of entries."))
      data.frame(x = x_vals, y = y_vals)
    }
  })

  x_label <- reactive({
    if (input$data_source == "builtin") input$builtin_x else input$custom_x_label
  })
  y_label <- reactive({
    if (input$data_source == "builtin") input$builtin_y else input$custom_y_label
  })

  output$main_plot <- renderPlot({
    df <- plot_data()
    if (input$plot_type == "scatter") {
      plot(df$x, df$y,
           main = paste(y_label(), "vs.", x_label()),
           xlab = x_label(), ylab = y_label(),
           pch = 19, col = input$plot_color)
      abline(lm(y ~ x, data = df), col = "black", lwd = 2, lty = 2)
    } else if (input$plot_type == "hist") {
      hist(df$x,
           main = paste("Distribution of", x_label()),
           xlab = x_label(), col = input$plot_color)
    } else {
      boxplot(df$x,
              main = paste("Boxplot of", x_label()),
              ylab = x_label(), col = input$plot_color)
    }
  })

  output$data_preview <- renderTable({
    head(plot_data(), 10)
  })

  # Build the plotting code as text so students can see what generated the plot
  plot_code <- reactive({
    xl <- x_label()
    yl <- y_label()
    col <- input$plot_color
    if (input$plot_type == "scatter") {
      paste0(
        "plot(df$x, df$y,\n",
        "     main = \"", yl, " vs. ", xl, "\",\n",
        "     xlab = \"", xl, "\", ylab = \"", yl, "\",\n",
        "     pch = 19, col = \"", col, "\")\n",
        "abline(lm(y ~ x, data = df), col = \"black\", lwd = 2, lty = 2)"
      )
    } else if (input$plot_type == "hist") {
      paste0(
        "hist(df$x,\n",
        "     main = \"Distribution of ", xl, "\",\n",
        "     xlab = \"", xl, "\", col = \"", col, "\")"
      )
    } else {
      paste0(
        "boxplot(df$x,\n",
        "        main = \"Boxplot of ", xl, "\",\n",
        "        ylab = \"", xl, "\", col = \"", col, "\")"
      )
    }
  })

  observeEvent(input$show_code, {
    showModal(modalDialog(
      title = "Code used for this plot. Note: x and y will likely need to be defined in your own code.",
      tags$pre(plot_code()),
      easyClose = TRUE,
      footer = modalButton("Close")
    ))
  })
}

shinyApp(ui = ui, server = server)
