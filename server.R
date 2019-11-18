setwd("C:/Users/cmilbank/Documents")

#Sys.setenv(JAVA_HOME = "H:/Decision Support/Stats Jam/R files/Java/jre1.8.0_201")

library(shiny)
library(shinythemes)

warnings()

server <- function(input, output) {
  
  #Calculate p-value
  values <- reactiveValues()
  observe({
#    input$action_Calc
    values$n_total <- input$n_red + input$n_purple + input$n_green + input$n_orange + input$n_yellow
    values$chi_red <- (input$n_red - values$n_total/5)^2/(values$n_total/5)
    values$chi_purple <- (input$n_purple - values$n_total/5)^2/(values$n_total/5)
    values$chi_green <- (input$n_green - values$n_total/5)^2/(values$n_total/5)
    values$chi_orange <- (input$n_orange - values$n_total/5)^2/(values$n_total/5)
    values$chi_yellow <- (input$n_yellow - values$n_total/5)^2/(values$n_total/5)
    values$chi_total <- values$chi_red + values$chi_purple + values$chi_green + values$chi_orange + values$chi_yellow
    values$p_value <- round(1 - pchisq(values$chi_total, 4, ncp = 0, lower.tail = TRUE, log.p = FALSE), 3)
  })
  
  # Reactive expression to create data frame of all input values ----
  sliderValues <- reactive({
    
    data.frame(
      Item = c(
               "Total number of skittles",
               "Chi-Square contribution (Red)",
               "Chi-Square contribution (Purple)",
               "Chi-Square contribution (Green)",
               "Chi-Square contribution (Orange)",
               "Chi-Square contribution (Yellow)",
               "Chi-Square (Total)",
               "p-value"),
      Value = as.character(c(values$n_total,
                             round(values$chi_red, 2),
                             round(values$chi_purple, 2),
                             round(values$chi_green, 2),
                             round(values$chi_orange, 2),
                             round(values$chi_yellow, 2),
                             round(values$chi_total, 2),
                             values$p_value)),
      stringsAsFactors = FALSE)
    
  })
  
# Show the values in an HTML table ----
  output$values <- renderTable({
    sliderValues()
  })

  
#  output$text_int <- renderText({
#    if(input$action_Calc == 0) ""
#    else
#      paste("Simple Interest [$]:", values$p_value)
#  })
  
}