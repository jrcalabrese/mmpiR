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
library(rsconnect)

source("ui.R")

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$validity_plot <- renderPlot({
      
        # put validity in a dataframe
        validity_df <- data.frame(rbind(input$vrin, input$trin, input$f,
                                        input$fb, input$fp, input$fbs, input$l, 
                                        input$k, input$s)) %>%
            tibble::rownames_to_column(var = "scale") %>%
            rename(scale_score = 2)
        
        # order scale variable
        validity_labels = c("VRIN", "TRIN", "F", "Fb", "Fp", "FBS", "L", "K", "S")
        
        # make a ggplot
        validity_df %>%
          ggplot(aes(x=scale, y=as.numeric(scale_score), group=1)) + # Group=1 connects points
          theme_bw() +
          geom_line() + 
          geom_point(size=2) +
          geom_hline(yintercept=50) +
          geom_hline(yintercept=65) +
          scale_y_continuous(sec.axis = dup_axis(), breaks = (seq(30, 120, by = 10)), limits = c(30,120)) +
          scale_x_discrete(labels = validity_labels) +
          xlab("") + ylab("") +
          ggtitle("MMPI-2 VALIDITY PATTERN") + theme(plot.title = element_text(hjust = 0.5))
        
    })
    
    output$valid_down <- downloadHandler(
      filename = "valid_plot.png",
      content = function(file){
        ggsave(file, device = "png", width=7, height=3.5)
      }
    )
    
    output$clinical_plot <- renderPlot({
      
        # put clinical in a dataframe
        clinical_df <- data.frame(rbind(input$scale1, input$scale2, input$scale3,
                                        input$scale4, input$scale5, input$scale6,
                                        input$scale7, input$scale8, input$scale9,
                                        input$scale0)) %>%
            tibble::rownames_to_column(var = "scale") %>%
            rename(scale_score = 2) %>%
            mutate(scale=replace(scale, scale==10, "0")) 
        
        # order scale variable
        clinical_df$scale <- factor(clinical_df$scale, levels=c("1", "2", "3",
                                                                "4", "5", "6",
                                                                "7", "8", "9",
                                                                "0"))
        
        # clinical labels
        clinical_labels <- c("Hs", "D", "Hy", 
                             "Pd", "Mf", "Pa", 
                             "Pt", "Sc", "Ma", "Si")
        
        # make a ggplot
        clinical_df %>%
          ggplot(aes(x=scale, y=scale_score, group=1)) + # Group=1 connects points
          theme_bw() +
          geom_line() + 
          geom_point(size=2) +
          geom_hline(yintercept=50) +
          geom_hline(yintercept=65) +
          scale_x_discrete(labels = clinical_labels) +
          xlab("") + ylab("") +
          scale_y_continuous(sec.axis = dup_axis(), breaks = (seq(30, 120, by = 10)), limits = c(30,120)) +
          ggtitle("MMPI-2 CLINICAL SCALES PROFILE") + theme(plot.title = element_text(hjust = 0.5))

    })
    
    output$clinical_down <- downloadHandler(
      filename = "clinical_plot.png",
      content = function(file){
        ggsave(file, device = "png", width=7, height=3.5)
      }
    )
    
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
    
    output$supp_plot <- renderPlot({
      
      # put content in a dataframe
      supp_df <- data.frame(rbind(input$a, input$r, input$es,
                                     input$do, input$re, input$mt,
                                     input$pk, input$mds, input$ho, 
                                     input$oh, input$macr, input$aas, 
                                     input$aps, input$gm, input$gf)) %>%
        tibble::rownames_to_column(var = "scale") %>%
        rename(scale_score = 2)
      
      supp_df$scale <- factor(supp_df$scale, levels = supp_df$scale)
      
      # order scale variable
      supp_labels = c("A", "R", "Es", 
                         "Do", "Re", "Mt",
                         "PK", "MDS", "Ho", 
                         "O-H", "MAC-R", "AAS",
                         "APS", "GM", "GF")
      
      # make a ggplot
      supp_df %>%
        ggplot(aes(x=scale, y=scale_score, group=1)) + # Group=1 connects points
        geom_line() + 
        theme_bw() +
        geom_point(size=2) +
        geom_hline(yintercept=50) +
        geom_hline(yintercept=65) +
        scale_x_discrete(labels = supp_labels) + 
        xlab("") + ylab("") +
        scale_y_continuous(sec.axis = dup_axis(), breaks = (seq(30, 120, by = 10)), limits = c(30,120)) +
        ggtitle("MMPI-2 SUPPLEMENTARY SCALES PROFILE") + theme(plot.title = element_text(hjust = 0.5))
    })
    
    output$content_down <- downloadHandler(
      filename = "supp_plot.png",
      content = function(file){
        ggsave(file, device = "png", width=7, height=3.5)
      }
    )
    
}

# DO NOT ACTUALLY INLCLUDE THESE LINES IN THE FINAL PRODUCT!!!!
# JUST COPY AND PASTE THEM DIRECTLY INTO YOUR CONSOLE!!!

# Run the application 
#shinyApp(ui = ui, server = server)

# Deploy app
#deployApp(appName="mmpiR", account="jrcalabrese")