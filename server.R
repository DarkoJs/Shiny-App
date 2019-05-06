#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
names(ToothGrowth) <- c("Length", "Supplement_type", "Dose")
ToothGrowth$"Dose" <- as.factor(ToothGrowth$"Dose")

# Define server logic required to draw a histogram and print t-test
shinyServer(function(input, output) {
    
    output$boxPlot <- renderPlot({
        ggplot(data = ToothGrowth, aes_string(x = input$x, y = "Length")) +
            geom_dotplot(binaxis = "y", stackdir = "center")
    })
    output$test <- renderPrint({
        if(input$test){
            t.test(Length ~ Supplement_type, ToothGrowth)
        }
    
})
})

