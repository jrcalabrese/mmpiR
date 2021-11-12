library(shiny)
library(tidyverse)
library(shinydashboard)
library(shinythemes)
library(rsconnect)

validity_ui <- 
  tabPanel("Validity",
           # Application title
           titlePanel("Profile for Validity Scales"),
           
           # Sidebar with numeric input boxes
           sidebarLayout(
             sidebarPanel(
               numericInput(inputId = "vrin", "VRIN", 55,
                                           min = 30, max = 120),
               numericInput(inputId = "trin", "TRIN", 55,
                                           min = 30, max = 120),
               numericInput(inputId = "f", "F", 55,
                                           min = 30, max = 120),
               numericInput(inputId = "fb", "Fb", 55,
                                           min = 30, max = 120),
               numericInput(inputId = "fp", "Fp", 55,
                                           min = 30, max = 120),
               numericInput(inputId = "fbs", "FBS", 55,
                                           min = 30, max = 120),
               numericInput(inputId = "l", "L", 55,
                                           min = 30, max = 120),
               numericInput(inputId = "k", "K", 55,
                                           min = 30, max = 120),
               numericInput(inputId = "s", "S", 55,
                                           min = 30, max = 120),
               ),
             mainPanel(
               plotOutput(outputId = "validity_plot"),
               downloadButton(outputId = "valid_down", label = "Download the plot"),
             )
             )
  )