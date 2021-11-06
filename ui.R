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

# Define UI for application that draws various ggplots
ui <- navbarPage("mmpiR by @jrosecalabrese", theme = shinytheme("flatly"),
                 tabPanel("Validity Scales",
                          
                          # Application title
                          titlePanel("MMPI-2 Validity Scales"),
                          
                          # Sidebar with numeric input boxes
                          sidebarLayout(
                              sidebarPanel(
                                  
                                  # Type in VRIN
                                  numericInput(inputId = "vrin", "VRIN", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in TRIN
                                  numericInput(inputId = "trin", "TRIN", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in F
                                  numericInput(inputId = "f", "F", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in Fb
                                  numericInput(inputId = "fb", "Fb", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in Fp
                                  numericInput(inputId = "fp", "Fp", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in FBS
                                  numericInput(inputId = "fbs", "FBS", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in L
                                  numericInput(inputId = "l", "L", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in K
                                  numericInput(inputId = "k", "K", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in S
                                  numericInput(inputId = "s", "S", 55,
                                               min = 30, max = 120),
                                  
                              ),
                              
                              # Show the line plot
                              mainPanel(
                                  plotOutput(outputId = "validity_plot"),
                                  downloadButton(outputId = "valid_down", label = "Download the plot"),
                              )
                          )),
                 
                 tabPanel("Clinical Scales",
                          
                          # Application title
                          titlePanel("MMPI-2 Clinical Scales"),
                          
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
                          )),
                 tabPanel("Content Scales",
                          
                          # Application title
                          titlePanel("MMPI-2 Content Scales"),
                          
                          # Sidebar with numeric input boxes
                          sidebarLayout(
                              sidebarPanel(
                                  
                                  # Type in ANX
                                  numericInput(inputId = "anx", "ANX", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in FRS
                                  numericInput(inputId = "frs", "FRS", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in OBS
                                  numericInput(inputId = "obs", "OBS", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in DEP
                                  numericInput(inputId = "dep", "DEP", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in HEA
                                  numericInput(inputId = "hea", "HEA", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in BIZ
                                  numericInput(inputId = "biz", "BIZ", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in ANG
                                  numericInput(inputId = "ang", "ANG", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in CYN
                                  numericInput(inputId = "cyn", "CYN", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in ASP
                                  numericInput(inputId = "asp", "ASP", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in TPA
                                  numericInput(inputId = "tpa", "TPA", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in LSE
                                  numericInput(inputId = "lse", "LSE", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in SOD
                                  numericInput(inputId = "sod", "SOD", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in FAM
                                  numericInput(inputId = "fam", "FAM", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in WRK
                                  numericInput(inputId = "wrk", "WRK", 55,
                                               min = 30, max = 120),
                                  
                                  # Type in TRT
                                  numericInput(inputId = "trt", "TRT", 55,
                                               min = 30, max = 120)
                              ),
                              
                              # Show the lineplot
                              mainPanel(
                                  plotOutput(outputId = "content_plot"),
                                  downloadButton(outputId = "content_down", label = "Download the plot"),
                              )
                              
                          )),
                 
                 tabPanel("Supplementary Scales",
                          
                          # Application title
                          titlePanel("MMPI-2 Supplementary Scales"),
                          
                          # Sidebar with numeric input boxes
                          sidebarLayout(
                            sidebarPanel(
                              
                              # Type in A
                              numericInput(inputId = "a", "A", 55,
                                           min = 30, max = 120),
                              
                              # Type in R
                              numericInput(inputId = "r", "R", 55,
                                           min = 30, max = 120),
                              
                              # Type in Es
                              numericInput(inputId = "es", "ES", 55,
                                           min = 30, max = 120),
                              
                              # Type in Do
                              numericInput(inputId = "do", "Do", 55,
                                           min = 30, max = 120),
                              
                              # Type in Re
                              numericInput(inputId = "re", "Re", 55,
                                           min = 30, max = 120),
                              
                              # Type in Mt
                              numericInput(inputId = "mt", "Mt", 55,
                                           min = 30, max = 120),
                              
                              # Type in PK
                              numericInput(inputId = "pk", "PK", 55,
                                           min = 30, max = 120),
                              
                              # Type in MDS
                              numericInput(inputId = "mds", "MDS", 55,
                                           min = 30, max = 120),
                              
                              # Type in Ho
                              numericInput(inputId = "ho", "HO", 55,
                                           min = 30, max = 120),
                              
                              # Type in O-H
                              numericInput(inputId = "oh", "O-H", 55,
                                           min = 30, max = 120),
                              
                              # Type in MAC-R
                              numericInput(inputId = "macr", "MAC-R", 55,
                                           min = 30, max = 120),
                              
                              # Type in AAS
                              numericInput(inputId = "aas", "AAS", 55,
                                           min = 30, max = 120),
                              
                              # Type in APS
                              numericInput(inputId = "aps", "APS", 55,
                                           min = 30, max = 120),
                              
                              # Type in GM
                              numericInput(inputId = "gm", "GM", 55,
                                           min = 30, max = 120),
                              
                              # Type in GF
                              numericInput(inputId = "gf", "GF", 55,
                                           min = 30, max = 120)
                            ),
                            
                            # Show the lineplot
                            mainPanel(
                              plotOutput(outputId = "supp_plot"),
                              downloadButton(outputId = "supp_down", label = "Download the plot"),
                            )
                            
                          )),
                 )
