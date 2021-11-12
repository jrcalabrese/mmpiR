library(shiny)
library(tidyverse)
library(shinydashboard)
library(shinythemes)
library(rsconnect)

content_ui <- 
  tabPanel("Content",
         
         # Application title
         titlePanel("Profile for Content Scales"),
         
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
           
         ))

content_server <- function(input, output) {
  
  output$content_plot <- renderPlot({
    
    # put content in a dataframe
    content_df <- data.frame(rbind(input$anx, input$frs, input$obs,
                                   input$dep, input$hea, input$biz,
                                   input$ang, input$cyn, input$asp, 
                                   input$tpa, input$lse, input$sod, 
                                   input$fam, input$wrk, input$trt)) %>%
      tibble::rownames_to_column(var = "scale") %>%
      rename(scale_score = 2)
    
    content_df$scale <- factor(content_df$scale, levels = content_df$scale)
    
    # order scale variable
    content_labels = c("ANX", "FRS", "OBS", 
                       "DEP", "HEA", "BIZ",
                       "ANG", "CYN", "ASP", 
                       "TPA", "LSE", "SOD",
                       "FAM", "WRK", "TRT")
    
    # make a ggplot
    content_df %>%
      ggplot(aes(x=scale, y=scale_score, group=1)) + # Group=1 connects points
      geom_line() + 
      theme_bw() +
      geom_point(size=2) +
      geom_hline(yintercept=50) +
      geom_hline(yintercept=65) +
      scale_x_discrete(labels = content_labels) + 
      xlab("") + ylab("") +
      scale_y_continuous(sec.axis = dup_axis(), breaks = (seq(30, 120, by = 10)), limits = c(30,120)) +
      ggtitle("MMPI-2 CONTENT SCALES PROFILE") + theme(plot.title = element_text(hjust = 0.5))
  })
  
  output$content_down <- downloadHandler(
    filename = "content_plot.png",
    content = function(file){
      ggsave(file, device = "png", width=7, height=3.5)
    }
  )
}