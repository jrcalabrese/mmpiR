library(shiny)
library(tidyverse)
library(shinydashboard)
library(shinythemes)
library(rsconnect)

supp_ui <- 
  tabPanel("Supplementary",
         
         # Application title
         titlePanel("Profile for Supplementary Scales"),
         
         # Sidebar with numeric input boxes
         sidebarLayout(
           sidebarPanel(
             
             # Type in AGGR
             numericInput(inputId = "aggr", "AGGR", 55,
                          min = 30, max = 120),
             
             # Type in PSYC
             numericInput(inputId = "psyc", "PSYC", 55,
                          min = 30, max = 120),
             
             # Type in DISC
             numericInput(inputId = "disc", "DISC", 55,
                          min = 30, max = 120),
             
             # Type in NEGE
             numericInput(inputId = "nege", "NEGE", 55,
                          min = 30, max = 120),
             
             # Type in INTR
             numericInput(inputId = "intr", "INTR", 55,
                          min = 30, max = 120),
             
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
             numericInput(inputId = "ho", "Ho", 55,
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
           
         ))

supp_server <- function(input, output) {
  
  output$supp_plot <- renderPlot({
    
    # put supp in a dataframe
    supp_df <- data.frame(rbind(input$aggr, input$psyc, input$disc, input$nege, input$intr,
                                input$a, input$r, input$es,
                                input$do, input$re, input$mt,
                                input$pk, input$mds, input$ho, 
                                input$oh, input$macr, input$aas, 
                                input$aps, input$gm, input$gf)) %>%
      tibble::rownames_to_column(var = "scale") %>%
      rename(scale_score = 2) %>%
      mutate(scale_group = c("PSY-5 Scales", "PSY-5 Scales", "PSY-5 Scales", "PSY-5 Scales", "PSY-5 Scales",
                             "Broad Personality Characteristics", "Broad Personality Characteristics", "Broad Personality Characteristics", "Broad Personality Characteristics", "Broad Personality Characteristics", 
                             "Generalized\nEmotional Distress", "Generalized\nEmotional Distress", "Generalized\nEmotional Distress", 
                             "Behavioral Dyscontrol", "Behavioral Dyscontrol", "Behavioral Dyscontrol", "Behavioral Dyscontrol", "Behavioral Dyscontrol",
                             "Gender Role", "Gender Role"))
    
    supp_df$scale_group = factor(supp_df$scale_group,
                                 levels = c("PSY-5 Scales", "Broad Personality Characteristics", 
                                            "Generalized\nEmotional Distress", "Behavioral Dyscontrol",
                                            "Gender Role"))
    
    supp_df$scale <- factor(supp_df$scale, levels = supp_df$scale)
    
    supp_df$gp <- c(1,1,1,1,1,
                    2,2,2,2,2,
                    3,3,3,
                    4,4,4,4,4,
                    5,5)
    
    # order scale variable
    supp_labels = c("AGGR", "PSYC", "DISC", "NEGE", "INTR",
                    "A", "R", "Es", "Do", "Re", 
                    "Mt", "PK", "MDS", 
                    "Ho", "O-H", "MAC-R", "AAS","APS", 
                    "GM", "GF")
    
    names(supp_labels) <- interaction(supp_df$scale, factor(supp_df$scale_group))
    
    # make a ggplot
    supp_df %>%
      #ggplot(aes(x=scale, y=scale_score, group=gp)) + # Group=1 connects points
      ggplot(aes(x=interaction(scale, factor(scale_group)), y=as.numeric(scale_score), 
                 label = (scale_group),
                 group=interaction(scale_group, gp))) +
      geom_line() + 
      theme_bw() +
      #geom_vline(xintercept = 5.5) +
      #geom_vline(xintercept = 8.5) +
      #geom_vline(xintercept = 13.5) + 
      geom_point(size=2) +
      geom_hline(yintercept=50) +
      geom_hline(yintercept=65) +
      scale_x_discrete(labels = supp_labels) + 
      xlab("") + ylab("") +
      scale_y_continuous(sec.axis = dup_axis(), breaks = (seq(30, 120, by = 10)), limits = c(30,120)) +
      ggtitle("MMPI-2 SUPPLEMENTARY SCALES PROFILE") + theme(plot.title = element_text(hjust = 0.5)) +
      facet_grid( ~ scale_group,
                  scales = "free", space = "free")
  })
  
  output$supp_down <- downloadHandler(
    filename = "supp_plot.png",
    content = function(file){
      ggsave(file, device = "png", width=12, height=3.5)
    }
  )
  
}