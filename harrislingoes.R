library(shiny)
library(tidyverse)
library(shinydashboard)
library(shinythemes)
library(rsconnect)

harrislingoes_ui <- 
  tabPanel("Harris-Lingoes",
           
           # Application title
           titlePanel("Harris-Lingoes and Si Subscales Score Record"),
           
           # Sidebar with numeric input boxes
           sidebarLayout(
             sidebarPanel(
               
               # Type in Depression
               numericInput(inputId = "d1", "D1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "d2", "D2", 55,
                            min = 30, max = 120),
               numericInput(inputId = "d3", "D3", 55,
                            min = 30, max = 120),
               numericInput(inputId = "d4", "D4", 55,
                            min = 30, max = 120),
               numericInput(inputId = "d5", "D5", 55,
                            min = 30, max = 120),
               
               # Type in Hysteria
               numericInput(inputId = "hy1", "Hy1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "hy2", "Hy2", 55,
                            min = 30, max = 120),
               numericInput(inputId = "hy3", "Hy3", 55,
                            min = 30, max = 120),
               numericInput(inputId = "hy4", "Hy4", 55,
                            min = 30, max = 120),
               numericInput(inputId = "hy5", "Hy5", 55,
                            min = 30, max = 120),
               
               # Type in Psychopath Deviate
               numericInput(inputId = "pd1", "Pd1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "pd2", "Pd2", 55,
                            min = 30, max = 120),
               numericInput(inputId = "pd3", "Pd3", 55,
                            min = 30, max = 120),
               numericInput(inputId = "pd4", "Pd4", 55,
                            min = 30, max = 120),
               numericInput(inputId = "pd5", "Pd5", 55,
                            min = 30, max = 120),
               
               # Type in Paranoia
               numericInput(inputId = "pa1", "Pa1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "pa2", "Pa2", 55,
                            min = 30, max = 120),
               numericInput(inputId = "pa3", "Pa3", 55,
                            min = 30, max = 120),
               
               # Type in Schizophrenia
               numericInput(inputId = "sc1", "Sc1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "sc2", "Sc2", 55,
                            min = 30, max = 120),
               numericInput(inputId = "sc3", "Sc3", 55,
                            min = 30, max = 120),
               numericInput(inputId = "sc4", "Sc4", 55,
                            min = 30, max = 120),
               numericInput(inputId = "sc5", "Sc5", 55,
                            min = 30, max = 120),
               numericInput(inputId = "sc6", "Sc6", 55,
                            min = 30, max = 120),
               
               # Type in Hypomania
               numericInput(inputId = "ma1", "Ma1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "ma2", "Ma2", 55,
                            min = 30, max = 120),
               numericInput(inputId = "ma3", "Ma3", 55,
                            min = 30, max = 120),
               numericInput(inputId = "ma4", "Ma4", 55,
                            min = 30, max = 120),
               
               # Type in Social Introversion
               numericInput(inputId = "si1", "Si1", 55,
                            min = 30, max = 120),
               numericInput(inputId = "si2", "Si2", 55,
                            min = 30, max = 120),
               numericInput(inputId = "si3", "Si3", 55,
                            min = 30, max = 120),
             ),
             
             # Show the lineplot
             mainPanel(
               plotOutput(outputId = "harrislingoes_plot"),
               downloadButton(outputId = "harrislingoes_down", label = "Download the plot"),
             )
             
           ))