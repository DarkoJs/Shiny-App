#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

navbarPage("Vitamin C study",theme = shinytheme("united"),
           tabPanel("Documentation",
                    HTML("<b>Documentation</b>
                         <br>                    
                         <br>How to use the app (a technical note):
                         <ol>
                            <li>You can swith between the Documentation and Plot tab</li>
                            <li>From the Plot tab you can select one of two variables of your choice</li>
                            <li>After that you will notice a change on the horizontal x axis</li>
                            <li>Based on that the entire plot output changes</li>
                            <li>To perform a t-test calculation by supppement type and lenght, you need to check the box.</li>
                         </ol>
                         
                         <br>About the dataset and the analysis:
                         <ul>
                            <li>The analysis is based on R's built-in ToothGrowth dataset.</li>
                            <li>The dataset aims to show the results of an experiment that tried to test the effect of vitamin C on the length of teeth of 60 guinea pigs.</li>
                            <li>The pigs were divided in groups and received 0.5mg/day, 1mg/day, or 2mg/day of either ascorbic acid or orange juice as vitamin C supplement.</li>
                            <li>Visual inspection shows that the amount of vitamin C dose is significant predictor of tooth lenght.</li>
                            <li>For the effect of given type vitamin C supplement, the results are less cler. Therefore a t-test is calculated to find the answer.</li>
                            <li><i>Source: C. I. Bliss (1952). The Statistics of Bioassay. Academic Press.</i></li>
                         </ul>
                         <img src='https://5.imimg.com/data5/TS/KN/MY-3269076/juice-fresh-orange-250x250.jpg'>
                         ")
           ),
           tabPanel("Plot",
                    sidebarLayout(
                        sidebarPanel(
                            radioButtons(inputId = "x", label = "Variable selector:",
                                         choices = c("Supplement_type", "Dose"),
                                         selected = "Dose"),
                            helpText("Please select one of 
                                     the variables above!"),
                            hr(),
                            checkboxInput(inputId = "test",
                                          label = "Perform t-test on supplement types",
                                          value = FALSE),
                            helpText("If you want to make a t-test, please check the box above.")
                        ),
                        
                        mainPanel(
                            h4("Dotplot"),
                            plotOutput("boxPlot"),
                            h4("Results of t-test"),
                            verbatimTextOutput("test")
                        )
                    )
           )
)
