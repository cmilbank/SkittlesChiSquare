setwd("C:/Users/cmilbank/Documents")

#Sys.setenv(JAVA_HOME = "H:/Decision Support/Stats Jam/R files/Java/jre1.8.0_201")

library(shiny)
library(shinythemes)

warnings()


ui <- fluidPage(theme = shinytheme("slate"),
  
  # App title ----
  titlePanel("Arizona Team Meeting Stats Jam - a.k.a. SKITTLE JAM!"),
  
  fluidRow(
    column(10, offset = 0,
           p("Have you ever opened a bag of skittles and felt totally hosed? Me too. Today we will explore 
             random variation by looking at the distribution of skittles with the Chi-Square Test (and then eating them).")
    )
    ),
  
  fluidRow(
    column(10, offset = 0,
           p("Say there are 15 skittles in a bag. Certainly, *on average*, you would expect to get three of each
             color. However, anyone who has had a bag of skittles before knows this is not usually what you see. I've
             even heard a story of someone who opened a bag and didn't get any red or purple skittles, which is just unfair.")
    )
  ),

  
  fluidRow(
    column(10, offset = 0,
           p("In statistical terms, our null hypothesis is that the true population averages of red, purple, green,
             orange, and yellow skittles are the same. We can reasonably assume that this hypothesis is true in real life.
             However, when we run individual experiments on our own bags of skittles, we may see differing results
             due to the small sample size.")
    )
  ),
  
  fluidRow(
    column(10, offset = 0,
           p("The Chi-Square Test is a statistical techinique used for categorical (i.e. non-numerical) data to determine whether there
             is a significant difference between the *expected* and *actual* distributions of results. The chi-square statistic
             is calculated by summing up each of the squared differences between expected and observed and dividing by the 
             expected value. For example, if we got 5 red skittles but expected 3, the chi-square contribution for red would be (5-3)^2/3 = 1.33.
             We would do this for each color and then compare the total chi-square value to a chi-square distribution with
             k-1 degrees of freedom (where k is the number of categories) to determine the p-value.")
    )
  ),
  
  fluidRow(
    column(10, offset = 0,
           p("As a reminder, the p-value is the probability of seeing data/results at least as strong as we are seeing due 
             to luck alone, assuming that the null hypothesis is true. As we know, a 5% p-value is typically considered statistically
             significant. However, since we are running multiple tests, we should not be surprised if one or more of our p-values are 
             below the 5% threshold.")
           )
           ),
  
  fluidRow(
    column(10, offset = 0,
           p("Are there any ideas on how we can apply this concept to workforce analytics?")
    )
  ),

  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar to demonstrate various slider options ----
    sidebarPanel(
      
      # Input: Integer interval with step value ----
      numericInput("n_red", p("Number of red skittles:", style = "color:red"),
                   min = 0, max = 10,
                   value = 0, step = 1),
      
      # Input: Integer interval with step value ----
      numericInput("n_purple", p("Number of purple skittles:", style = "color:purple"),
                  min = 0, max = 10,
                  value = 0, step = 1),
      
      # Input: Integer interval with step value ----
      numericInput("n_green", p("Number of green skittles:", style = "color:green"),
                   min = 0, max = 10,
                   value = 0, step = 1),
      
      # Input: Integer interval with step value ----
      numericInput("n_orange", p("Number of orange skittles:", style = "color:orange"),
                   min = 0, max = 10,
                   value = 0, step = 1),
      
      # Input: Integer interval with step value ----
      numericInput("n_yellow", p("Number of yellow skittles:", style = "color:yellow"),
                   min = 0, max = 10,
                   value = 0, step = 1)
      
    ),
    
    
    # Main panel for displaying outputs ----
       mainPanel( 
         #img(src='screenshot_smallest4.png', align = "middle", offset = 0),
    
    # Output: Table summarizing the values entered ----
    tableOutput("values")
      
      
    )
  )
)
