library(shiny)
library(DT)
library(shinyalert)

# Define UI for application that draws a histogram
shinyUI(fluidPage(


  # Application title
  titlePanel("A Quiz with 10 T/F Questions"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "q1", "Question 1:",
                   choices = c("Select T/F" = '',
                               "True" = 'T',
                               "False" = 'F')
      ),
      selectInput(inputId = "q2", "Question 2:",
                  choices = c("Select T/F" = '',
                              "True" = 'T',
                              "False" = 'F')
      ),
      selectInput(inputId = "q3", "Question 3:",
                  choices = c("Select T/F" = '',
                              "True" = 'T',
                              "False" = 'F')
      ),
      selectInput(inputId = "q4", "Question 4:",
                  choices = c("Select T/F" = '',
                              "True" = 'T',
                              "False" = 'F')
      ),
      selectInput(inputId = "q5", "Question 5:",
                  choices = c("Select T/F" = '',
                              "True" = 'T',
                              "False" = 'F')
      ),
      selectInput(inputId = "q6", "Question 6:",
                  choices = c("Select T/F" = '',
                              "True" = 'T',
                              "False" = 'F')
      ),
      selectInput(inputId = "q7", "Question 7:",
                  choices = c("Select T/F" = '',
                              "True" = 'T',
                              "False" = 'F')
      ),
      selectInput(inputId = "q8", "Question 8:",
                  choices = c("Select T/F" = '',
                              "True" = 'T',
                              "False" = 'F')
      ),
      selectInput(inputId = "q9", "Question 9:",
                  choices = c("Select T/F" = '',
                              "True" = 'T',
                              "False" = 'F')
      ),
      selectInput(inputId = "q10", "Question 10:",
                  choices = c("Select T/F" = '',
                              "True" = 'T',
                              "False" = 'F')
      ),
      
      useShinyalert(),
      actionButton("submit", "Submit"),
      actionButton("graph", "Class Report")
    ),
  
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("graph")
        )#end of mainPanel
)#end of sidebar layout
)#end of fluidpage
)#end of shinyUI
