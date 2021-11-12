library(shiny)
library(tidyverse)
library(shinydashboard)
library(shinythemes)
library(rsconnect)

clinical_ui <- 
  tabPanel("Clinical",
         
         # Application title
         titlePanel("Profile for Clinical Scales"),
         
         # Sidebar with numeric input boxes
         sidebarLayout(
           sidebarPanel(
             
             # Type in Scale 1 Hs
             numericInput(inputId = "scale1", "Scale 1: Hs", 55,
                          min = 30, max = 120),
             
             # Type in Scale 2 D
             numericInput(inputId = "scale2", "Scale 2: D", 55,
                          min = 30, max = 120),
             
             # Type in Scale 3 Hy
             numericInput(inputId = "scale3", "Scale 3: Hy", 55,
                          min = 30, max = 120),
             
             # Type in Scale 4 Pd
             numericInput(inputId = "scale4", "Scale 4: Pd", 55,
                          min = 30, max = 120),
             
             # Type in Scale 5 Mf
             numericInput(inputId = "scale5", "Scale 5: Mf", 55,
                          min = 30, max = 120),
             
             # Type in Scale 6 Pa
             numericInput(inputId = "scale6", "Scale 6: Pa", 55,
                          min = 30, max = 120),
             
             # Type in Scale 7 Pt
             numericInput(inputId = "scale7", "Scale 7: Pt", 55,
                          min = 30, max = 120),
             
             # Type in Scale 8 Sc
             numericInput(inputId = "scale8", "Scale 8: Sc", 55,
                          min = 30, max = 120),
             
             # Type in Scale 9 Ma
             numericInput(inputId = "scale9", "Scale 9: Ma", 55,
                          min = 30, max = 120),
             
             # Type in Scale 0 Si
             numericInput(inputId = "scale0", "Scale 0: Si", 55,
                          min = 30, max = 120)
           ),
           
           # Show the lineplot
           mainPanel(
             plotOutput(outputId = "clinical_plot"),
             downloadButton(outputId = "clinical_down", label = "Download the plot"),
           )
         ))
