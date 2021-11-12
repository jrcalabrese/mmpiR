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

source("validity.R")
source("clinical.R")
source("restructured.R")
source("content.R")
source("harrislingoes.R")
source("contentcomponent.R")
source("supp.R")

ui <- navbarPage("mmpiR by @jrosecalabrese", theme = shinytheme("flatly"),
                 validity_ui,
                 clinical_ui,
                 restructured_ui,
                 content_ui,
                 harrislingoes_ui,
                 contentcomponent_ui,
                 supp_ui
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$validity_plot <- renderPlot({
    validity_df <- data.frame(rbind(input$vrin, input$trin, input$f, input$fb, input$fp, input$fbs, 
                                    input$l, input$k, input$s)) %>%
      tibble::rownames_to_column(var = "scale") %>%
      rename(scale_score = 2)
    
    validity_labels = c("VRIN", "TRIN", "F", "Fb", "Fp", "FBS", 
                        "L", "K", "S")
    
    validity_df %>%
      ggplot(aes(x=scale, y=as.numeric(scale_score), group=1)) +
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
      
      })
  
  output$clinical_plot <- renderPlot({
    
    clinical_df <- data.frame(rbind(input$scale1, input$scale2, input$scale3, input$scale4, input$scale5, 
                                    input$scale6, input$scale7, input$scale8, input$scale9, input$scale0)) %>%
      tibble::rownames_to_column(var = "scale") %>%
      rename(scale_score = 2) %>%
      mutate(scale=replace(scale, scale==10, "0")) 
    
    clinical_df$scale <- factor(clinical_df$scale, levels=c("1", "2", "3", "4", "5", 
                                                            "6", "7", "8", "9", "0"))
    
    clinical_labels <- c("Hs", "D", "Hy", "Pd", "Mf", 
                         "Pa", "Pt", "Sc", "Ma", "Si")
    
    clinical_df %>%
      ggplot(aes(x=scale, y=scale_score, group=1)) +
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
      
    })

  output$restructured_plot <- renderPlot({
    restructured_df <- data.frame(rbind(input$rcd, input$rc1, input$rc2, input$rc3, input$rc4, 
                                        input$rc6, input$rc7, input$rc8, input$rc9)) %>%
      tibble::rownames_to_column(var = "scale") %>%
      rename(scale_score = 2)
    
    restructured_df$scale <- factor(restructured_df$scale, levels = restructured_df$scale)
    
    restructured_labels = c("RCD", "RC1", "RC2", "RC3", "RC4", 
                            "RC6", "RC7", "RC8", "RC9")
    
    restructured_df %>%
      ggplot(aes(x=scale, y=scale_score, group=1)) +
      geom_line() + 
      theme_bw() +
      geom_point(size=2) +
      geom_hline(yintercept=50) +
      geom_hline(yintercept=65) +
      scale_x_discrete(labels = restructured_labels) + 
      xlab("") + ylab("") +
      scale_y_continuous(sec.axis = dup_axis(), breaks = (seq(30, 120, by = 10)), limits = c(30,120)) +
      ggtitle("MMPI-2 RESTRUCTURED SCALES PROFILE") + theme(plot.title = element_text(hjust = 0.5))
  })
  
  output$restructured_down <- downloadHandler(
    filename = "restructured_plot.png",
    content = function(file){
      ggsave(file, device = "png", width=7, height=3.5)
      
    })

  output$content_plot <- renderPlot({
    
    content_df <- data.frame(rbind(input$anx, input$frs, input$obs, input$dep, input$hea, 
                                   input$biz, input$ang, input$cyn, input$asp, input$tpa, 
                                   input$lse, input$sod, input$fam, input$wrk, input$trt)) %>%
      tibble::rownames_to_column(var = "scale") %>%
      rename(scale_score = 2)
    
    content_df$scale <- factor(content_df$scale, levels = content_df$scale)
    
    content_labels = c("ANX", "FRS", "OBS", "DEP", "HEA", 
                       "BIZ", "ANG", "CYN", "ASP", "TPA", 
                       "LSE", "SOD", "FAM", "WRK", "TRT")
    
    content_df %>%
      ggplot(aes(x=scale, y=scale_score, group=1)) +
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
      
    })
  
  output$harrislingoes_plot <- renderPlot({
    harrislingoes_df <- data.frame(rbind(input$d1, input$d2, input$d3,input$d4, input$d5,
                                         input$hy1, input$hy2, input$hy3, input$hy4, input$hy5,
                                         input$pd1, input$pd2, input$pd3, input$pd4, input$pd5, 
                                         input$pa1, input$pa2, input$pa3,
                                         input$sc1, input$sc2, input$sc3, input$sc4, input$sc5, input$sc6,
                                         input$ma1, input$ma2, input$ma3, input$ma4,
                                         input$si1, input$si2, input$si3)) %>%
      tibble::rownames_to_column(var = "scale") %>%
      rename(scale_score = 2) %>%
      mutate(scale_group = c("Depression", "Depression", "Depression", "Depression", "Depression",
                             "Hysteria", "Hysteria", "Hysteria", "Hysteria", "Hysteria",
                             "Psychopathic Deviate", "Psychopathic Deviate", "Psychopathic Deviate", "Psychopathic Deviate", "Psychopathic Deviate",
                             "Paranoia", "Paranoia", "Paranoia",
                             "Schizophrenia", "Schizophrenia", "Schizophrenia", "Schizophrenia", "Schizophrenia", "Schizophrenia",
                             "Hypomania", "Hypomania", "Hypomania", "Hypomania",
                             "Social Introversion", "Social Introversion", "Social Introversion"
                             ))
    
    harrislingoes_df$scale_group = factor(harrislingoes_df$scale_group,
                                 levels = c("Depression", "Hysteria", "Psychopathic Deviate",
                                            "Paranoia", "Schizophrenia", "Hypomania",
                                            "Social Introversion"))
    
    harrislingoes_df$scale <- factor(harrislingoes_df$scale, levels = harrislingoes_df$scale)
    
    harrislingoes_df$gp <- c(1,1,1,1,1,
                             2,2,2,2,2,
                             3,3,3,3,3,
                             4,4,4,
                             5,5,5,5,5,5,
                             6,6,6,6,
                             7,7,7)
    
    harrislingoes_labels = c("D1", "D2", "D3", "D4", "D5",
                             "HY1", "HY2", "HY3", "HY4", "HY5",
                             "PD1", "PD2", "PD3", "PD4", "PD5",
                             "PA1", "PA2", "PA3",
                             "SC1", "SC2", "SC3", "SC4", "SC5", "SC6",
                             "MA1", "MA2", "MA3", "MA4",
                             "SI1", "SI2", "SI3")
    
    names(harrislingoes_labels) <- interaction(harrislingoes_df$scale, factor(harrislingoes_df$scale_group))

    harrislingoes_df %>%
      ggplot(aes(x=interaction(scale, factor(scale_group)), y=as.numeric(scale_score), 
                 label = (scale_group),
                 group=interaction(scale_group, gp))) +
      geom_line() + 
      theme_bw() +
      geom_point(size=2) +
      geom_hline(yintercept=50) +
      geom_hline(yintercept=65) +
      scale_x_discrete(labels = harrislingoes_labels) + 
      xlab("") + ylab("") +
      scale_y_continuous(sec.axis = dup_axis(), breaks = (seq(30, 120, by = 10)), limits = c(30,120)) +
      ggtitle("MMPI-2 HARRIS-LINGOES SCALES PROFILE") + theme(plot.title = element_text(hjust = 0.5)) +
      facet_grid( ~ scale_group,
                  scales = "free", space = "free")
    
  })
  
  output$harrislingoes_down <- downloadHandler(
    filename = "harrislingoes_plot.png",
    content = function(file){
      ggsave(file, device = "png", width=12, height=3.5)
      
    })

output$contentcomponent_plot <- renderPlot({
  contentcomponent_df <- data.frame(rbind(input$frs1, input$frs2, 
                                          input$dep1, input$dep2, input$dep3, input$dep4, 
                                          input$hea1, input$hea2, input$hea3, 
                                          input$biz1, input$biz2, 
                                          input$ang1, input$ang2, 
                                          input$cyn1, input$cyn2, 
                                          input$asp1, input$asp2, 
                                          input$tpa1, input$tpa2, 
                                          input$lse1, input$lse2, 
                                          input$sod1, input$sod2, 
                                          input$fam1, input$fam2, 
                                          input$trt1, input$trt2)) %>%
    tibble::rownames_to_column(var = "scale") %>%
    rename(scale_score = 2) %>%
    mutate(scale_group = c("Fearfulness", "Fearfulness",
                           "Depression", "Depression", "Depression", "Depression",
                           "Health Concerns", "Health Concerns", "Health Concerns",
                           "Bizarre\nMentation", "Bizarre\nMentation",
                           "Anger", "Anger",
                           "Cynicism", "Cynicism",
                           "Antisocial\nPersonality", "Antisocial\nPersonality",
                           "Type A\nPersonality", "Type A\nPersonality",
                           "Low\nSelf-Esteem", "Low\nSelf-Esteem",
                           "Social\nDiscomfort", "Social\nDiscomfort",
                           "Family\nProblems", "Family\nProblems",
                           "Negative\nTreatment\nIndicators", "Negative\nTreatment\nIndicators"))
  
  contentcomponent_df$scale_group = factor(contentcomponent_df$scale_group,
                               levels = c("Fearfulness", "Depression", "Health Concerns",
                                          "Bizarre\nMentation", "Anger", "Cynicism",
                                          "Antisocial\nPersonality", "Type A\nPersonality", "Low\nSelf-Esteem",
                                          "Social\nDiscomfort", "Family\nProblems", "Negative\nTreatment\nIndicators"))
    
    contentcomponent_df$scale <- factor(contentcomponent_df$scale, levels = contentcomponent_df$scale)
    
    contentcomponent_labels = c("FRS1", "FRS2",
                                "DEP1", "DEP2", "DEP3", "DEP4",
                                "HEA1", "HEA2", "HEA3",
                                "BIZ1", "BIZ2",
                                "ANG1", "ANG2",
                                "CYN1", "CYN2",
                                "ASP1", "ASP2",
                                "TPA1", "TPA2",
                                "LSE1", "LSE2",
                                "SOD1", "SOD2",
                                "FAM1", "FAM2",
                                "TRT1", "TRT2")
    
    names(contentcomponent_labels) <- interaction(contentcomponent_df$scale, factor(contentcomponent_df$scale_group))
    
    contentcomponent_df$gp <- c(1,1,
                             2,2,2,2,
                             3,3,3,
                             4,4,
                             5,5,
                             6,6,
                             7,7,
                             8,8,
                             9,9,
                             10,10,
                             11,11,
                             12,12)
    
    contentcomponent_df %>%
      ggplot(aes(x=interaction(scale, factor(scale_group)), y=as.numeric(scale_score), 
                 label = (scale_group),
                 group=interaction(scale_group, gp))) +
      geom_line() + 
      theme_bw() +
      geom_point(size=2) +
      geom_hline(yintercept=50) +
      geom_hline(yintercept=65) +
      scale_x_discrete(labels = contentcomponent_labels) + 
      xlab("") + ylab("") +
      scale_y_continuous(sec.axis = dup_axis(), breaks = (seq(30, 120, by = 10)), limits = c(30,120)) +
      ggtitle("MMPI-2 CONTENT COMPONENT SCALES PROFILE") + theme(plot.title = element_text(hjust = 0.5)) +
      facet_grid( ~ scale_group,
                  scales = "free", space = "free")
    
  })
  
  output$contentcomponent_down <- downloadHandler(
    filename = "contentcomponent_plot.png",
    content = function(file){
      ggsave(file, device = "png", width=12, height=3.5)
      
    })
  
  output$supp_plot <- renderPlot({
    supp_df <- data.frame(rbind(input$aggr, input$psyc, input$disc, input$nege, input$intr,
                                input$a, input$r, input$es, input$do, input$re, 
                                input$mt, input$pk, input$mds, 
                                input$ho, input$oh, input$macr, input$aas, input$aps, 
                                input$gm, input$gf)) %>%
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
    
    supp_df %>%
      ggplot(aes(x=interaction(scale, factor(scale_group)), y=as.numeric(scale_score), 
                 label = (scale_group),
                 group=interaction(scale_group, gp))) +
      geom_line() + 
      theme_bw() +
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
      
    })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

# DO NOT ACTUALLY INLCLUDE THESE LINES IN THE FINAL PRODUCT!!!!
# JUST COPY AND PASTE THEM DIRECTLY INTO YOUR CONSOLE!!!

# Run the application 
#shinyApp(ui = ui, server = server)

# Deploy app
#deployApp(appName="mmpiR", account="jrcalabrese")


