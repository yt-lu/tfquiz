library(shiny)
library(shinyalert)
library(DT)

Sys.setenv(TZ = 'US/Eastern')

shinyServer(function(input, output, session) {
  observeEvent(input$submit, {
    score <- 0
    key <- c("T", "F", "F", "F", "T", 
             "F", "T", "T", "T", "F")
    if (input$q1 == key[1]) {score <- score + 1}
    if (input$q2 == key[2]) {score <- score + 1}
    if (input$q3 == key[3]) {score <- score + 1}
    if (input$q4 == key[4]) {score <- score + 1}
    if (input$q5 == key[5]) {score <- score + 1}
    if (input$q6 == key[6]) {score <- score + 1}
    if (input$q7 == key[7]) {score <- score + 1}
    if (input$q8 == key[8]) {score <- score + 1}
    if (input$q9 == key[9]) {score <- score + 1}
    if (input$q10 == key[10]) {score <- score + 1}
    write.table(score, 'report.csv', append = TRUE,
                col.names = FALSE, row.names = FALSE,
                quote = FALSE, sep = "")
    shinyalert(title = paste('Wow, you scored ', score, "!"), type = "success")
    for (i in 1:10) {
      id <- paste0("q", i)
      tag <- paste0("Question ", i)
      updateSelectInput(session, id, tag, c("Select T/F", "T", "F"))
    }
    
  })
  
  observeEvent(input$graph, {
    x <- read.csv('report.csv' ,strip.white = TRUE, header = TRUE)
    x <- na.omit(x$Quiz)
  })
  
  userdata <- eventReactive(input$graph, {
    x <- read.csv('report.csv' ,strip.white = TRUE, header = TRUE)
    x <- na.omit(x$Quiz)
    return(x)
  })
  
  output$graph <- renderPlot({
    stripchart(userdata(), method = "stack", offset = .5, at = .15, pch = 20, 
               xlim = c(0,10), ylim = c(0,5), 
               xlab = "Grades", cex.lab = 1, family = "mono")
    title(main = "Distibution of Quiz Grades", cex.main = 2, 
          line = 0.5, family = "mono")
    axis(side = 1, at = 1:10)
  })
  
  
})
