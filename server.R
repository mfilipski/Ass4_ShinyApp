#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    selectedData <- reactive({
        WorldPhones[,c(input$region)]
    })
    years <- as.numeric(row.names(WorldPhones))
    
    # The fit:
    fit <- reactive({ 
        d <-WorldPhones[,c(input$region)]
        lm(cbind(d) ~ years)
    })
    slopes <- reactive({ 
        matrix(fit()$coefficients, nrow=2)
    })
    pred<-reactive({ 
        d <- WorldPhones[,c(input$region)]
        f <- lm(cbind(d) ~ years)
        predict(f, newdata = data.frame(years=1951:1961))
    })
    output$slopes <- renderTable({
         data.frame(Region=input$region, Slope=slopes()[2,])
    })
    output$pred <- renderText({
        pred()
    })
    
    output$phonePlot <- renderPlot({
    # Try a bubble plot:
#    plot( WorldPhones[,input$region]~ row.names(WorldPhones), 
#          size=WorldPhones[,input$region], sizes = c(10:100))
#    plot( selectedData() ~ years, 
#            size=WorldPhones[,input$region], sizes = c(10:100))
    matplot(years, selectedData(), pch=16, ylab = "Number of phones, 1000s")    # draw the histogram with the specified number of bins
    matlines(1951:1961, pred())
    legend("topleft",c(input$region), col = 1:length(c(input$region)), pch=16)
    
  })
  
})
