library(shiny)
library(tidyverse)
library(shinydashboard)
library(shinythemes)
library(rsconnect)

contentcomponent_ui <- 
  tabPanel("Content Component",
           
           # Application title
           titlePanel("Content Component Scales Score Record"),
           
           # Sidebar with numeric input boxes
           sidebarLayout(
             sidebarPanel(
               
               # Type in Fears
               numericInput(inputId = "frs1", "FRS1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "frs2", "FRS2", 55,
                            min = 30, max = 120),
               
               # Type in Depression
               numericInput(inputId = "dep1", "DEP1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "dep2", "DEP2", 55,
                            min = 30, max = 120),
               numericInput(inputId = "dep3", "DEP3", 55,
                            min = 30, max = 120),
               numericInput(inputId = "dep4", "DEP4", 55,
                            min = 30, max = 120),
               
               # Type in Hysteria
               numericInput(inputId = "hea1", "HEA1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "hea2", "HEA2", 55,
                            min = 30, max = 120),
               numericInput(inputId = "hea3", "HEA3", 55,
                            min = 30, max = 120),
               
               # Type in Bizarre
               numericInput(inputId = "biz1", "BIZ1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "biz2", "BIZ2", 55,
                            min = 30, max = 120),
               
               # Type in Anger
               numericInput(inputId = "ang1", "ANG1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "ang2", "ANG2", 55,
                            min = 30, max = 120),
               
               # Type in Cynicism
               numericInput(inputId = "cyn1", "CYN1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "cyn2", "CYN2", 55,
                            min = 30, max = 120),
               
               # Type in Antisocial Personality
               numericInput(inputId = "asp1", "ASP1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "asp2", "ASP2", 55,
                            min = 30, max = 120),
               
               # Type in Type A Personality
               numericInput(inputId = "tpa1", "TPA1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "tpa2", "TPA2", 55,
                            min = 30, max = 120),

               # Type in Low Self-Esteem
               numericInput(inputId = "lse1", "LSE1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "lse2", "LSE2", 55,
                            min = 30, max = 120),
               
               # Type in Social Discomfort
               numericInput(inputId = "sod1", "SOD1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "sod2", "SOD2", 55,
                            min = 30, max = 120),
               
               # Type in Family Problems
               numericInput(inputId = "fam1", "FAM1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "fam2", "FAM2", 55,
                            min = 30, max = 120),
               
               # Type in Negative Treatment Indicators
               numericInput(inputId = "trt1", "TRT1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "trt2", "TRT2", 55,
                            min = 30, max = 120),

             ),
             
             # Show the lineplot
             mainPanel(
               plotOutput(outputId = "contentcomponent_plot"),
               downloadButton(outputId = "contentcomponent_down", label = "Download the plot"),
             )
             
           ))