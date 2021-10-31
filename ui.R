#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(shinydashboard)
library(shinythemes)

# Define UI for application that draws a histogram
ui <- navbarPage("mmpiR by @jrosecalabrese", theme = shinytheme("flatly"),
                 tabPanel("Validity Scales",
                          
                          # Application title
                          titlePanel("MMPI-2 Validity Scales"),
                          
                          # Sidebar with a slider input for number of bins 
                          sidebarLayout(
                              sidebarPanel(
                                  
                                  # Type in VRIN
                                  numericInput(inputId = "vrin", "VRIN", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in TRIN
                                  numericInput(inputId = "trin", "TRIN", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in F
                                  numericInput(inputId = "f", "F", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in Fb
                                  numericInput(inputId = "fb", "Fb", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in Fp
                                  numericInput(inputId = "fp", "Fp", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in L
                                  numericInput(inputId = "l", "L", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in K
                                  numericInput(inputId = "k", "K", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in S
                                  numericInput(inputId = "s", "S", 50,
                                               min = 30, max = 120),
                                  
                              ),
                              
                              # Show a plot of the generated distribution
                              mainPanel(
                                  plotOutput(outputId = "validity_plot"),
                                  downloadButton(outputId = "valid_down", label = "Download the plot"),
                              )
                          )),
                 
                 tabPanel("Clinical Scales",
                          
                          # Application title
                          titlePanel("MMPI-2 Clinical Scales"),
                          
                          # Sidebar with a slider input for number of bins 
                          sidebarLayout(
                              sidebarPanel(
                                  
                                  # Type in Scale 1 Hs
                                  numericInput(inputId = "scale1", "Scale 1: Hs", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in Scale 2 D
                                  numericInput(inputId = "scale2", "Scale 2: D", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in Scale 3 Hy
                                  numericInput(inputId = "scale3", "Scale 3: Hy", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in Scale 4 Pd
                                  numericInput(inputId = "scale4", "Scale 4: Pd", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in Scale 5 Mf
                                  numericInput(inputId = "scale5", "Scale 5: Mf", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in Scale 6 Pa
                                  numericInput(inputId = "scale6", "Scale 6: Pa", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in Scale 7 Pt
                                  numericInput(inputId = "scale7", "Scale 7: Pt", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in Scale 8 Sc
                                  numericInput(inputId = "scale8", "Scale 8: Sc", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in Scale 9 Ma
                                  numericInput(inputId = "scale9", "Scale 9: Ma", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in Scale 0 Si
                                  numericInput(inputId = "scale0", "Scale 0: Si", 50,
                                               min = 30, max = 120)
                              ),
                              
                              # Show a plot of the generated distribution
                              mainPanel(
                                  plotOutput(outputId = "clinical_plot"),
                                  downloadButton(outputId = "clinical_down", label = "Download the plot"),
                              )
                          )),
                 tabPanel("Content Scales",
                          
                          # Application title
                          titlePanel("MMPI-2 Content Scales"),
                          
                          # Sidebar with a slider input for number of bins 
                          sidebarLayout(
                              sidebarPanel(
                                  
                                  # Type in ANX
                                  numericInput(inputId = "anx", "ANX", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in FRS
                                  numericInput(inputId = "frs", "FRS", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in OBS
                                  numericInput(inputId = "obs", "OBS", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in DEP
                                  numericInput(inputId = "dep", "DEP", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in HEA
                                  numericInput(inputId = "hea", "HEA", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in BIZ
                                  numericInput(inputId = "biz", "BIZ", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in ANG
                                  numericInput(inputId = "ang", "ANG", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in CYN
                                  numericInput(inputId = "cyn", "CYN", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in ASP
                                  numericInput(inputId = "asp", "ASP", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in TPA
                                  numericInput(inputId = "tpa", "TPA", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in LSE
                                  numericInput(inputId = "lse", "LSE", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in SOD
                                  numericInput(inputId = "sod", "SOD", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in FAM
                                  numericInput(inputId = "fam", "FAM", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in WRK
                                  numericInput(inputId = "wrk", "WRK", 50,
                                               min = 30, max = 120),
                                  
                                  # Type in TRT
                                  numericInput(inputId = "trt", "TRT", 50,
                                               min = 30, max = 120),
                              ),
                              
                              # Show a plot of the generated distribution
                              mainPanel(
                                  plotOutput(outputId = "content_plot"),
                                  downloadButton(outputId = "content_down", label = "Download the plot"),
                              )
                              
                          )),
                 )
