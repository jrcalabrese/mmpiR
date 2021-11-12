library(shiny)
library(tidyverse)
library(shinydashboard)
library(shinythemes)
library(rsconnect)

restructured_ui <- 
  tabPanel("Restructured",
           
           # Application title
           titlePanel("Profile for Restructured Clinical (RC) Scales"),
           
           # Sidebar with numeric input boxes
           sidebarLayout(
             sidebarPanel(
               
               numericInput(inputId = "rcd", "RCd", 55,
                            min = 30, max = 120),
               numericInput(inputId = "rc1", "RC1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "rc2", "RC2", 55,
                            min = 30, max = 120),
               numericInput(inputId = "rc3", "RC3", 55,
                            min = 30, max = 120),
               numericInput(inputId = "rc4", "RC4", 55,
                            min = 30, max = 120),
               numericInput(inputId = "rc6", "RC6", 55,
                            min = 30, max = 120),
               numericInput(inputId = "rc7", "RC7", 55,
                            min = 30, max = 120),
               numericInput(inputId = "rc8", "RC8", 55,
                            min = 30, max = 120),
               numericInput(inputId = "rc9", "RC9", 55,
                            min = 30, max = 120),
             ),
             
             # Show the lineplot
             mainPanel(
               plotOutput(outputId = "restructured_plot"),
               downloadButton(outputId = "restructured_down", label = "Download the plot"),
             )
             
           ))