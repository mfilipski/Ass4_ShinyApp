#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
data("WorldPhones")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Phones in the World"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       checkboxGroupInput("region","Please select at least one region to display:", choices=colnames(WorldPhones), 
                          selected = "N.Amer"),
       hr()
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("phonePlot"),
       hr(),
       h4("Average Rates of Growth [in 1000s of phones / year]:"),
       tableOutput("slopes")
    )
    
  )
))
