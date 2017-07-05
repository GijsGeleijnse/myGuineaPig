#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Guinea Pig Extravaganza"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
     
       checkboxInput("inclOJ", "Include Orange Juice", value = TRUE),
       checkboxInput("inclVC", "Include Ascorbic Acid", value = TRUE),
       checkboxInput("pink", "Pink is my favorite color", value = FALSE),
       
       submitButton("Submit"),
       h3("Please check the README for documentation")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
