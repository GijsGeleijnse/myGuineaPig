#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)

# Define server logic required to draw the plot and regression line
shinyServer(function(input, output) {
    a <- NULL
    a <- c(a,ToothGrowth)
    a <- c(a,filter(ToothGrowth,supp!="OJ"))
    a <- c(a,filter(ToothGrowth,supp!="VC"))
    a <- c(a,filter(ToothGrowth,supp=="lala"))
    
  dataT <- reactive({
    if(input$inclOJ && input$inclVC) i <-1
    else if(!input$inclOJ && input$inclVC) i <-2
    else if(input$inclOJ && !input$inclVC) i <-3
    else i <-4
    i
  }) 
  
  pink <- reactive({
    input$pink
  }) 
  
  
  output$distPlot <- renderPlot({
    i <- dataT()
    if(i==1) teeth <- ToothGrowth
    if(i==2)teeth <-filter(ToothGrowth,supp!="OJ")
    if(i==3) teeth <- filter(ToothGrowth,supp!="VC")
    if(i==4) teeth <- filter(ToothGrowth,supp=="lala")
    if(pink()){
    plot(teeth$dose,teeth$len,xlim = c(0, 3), ylim = c(0, 40),col="pink",xlab="Dosage",ylab="Length")
    if(i<4){model <- lm(len ~ dose, data=teeth)
    abline(model, col = "pink", lwd = 2) }}
    else{
      plot(teeth$dose,teeth$len,xlim = c(0, 3), ylim = c(0, 40),col="blue",xlab="Dosage",ylab="Length")
      if(i<4){model <- lm(len ~ dose, data=teeth)
      abline(model, col = "black", lwd = 2) }}
      
    
    
  })
  
})
