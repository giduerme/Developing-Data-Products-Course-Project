library(shiny)
shinyUI(fluidPage(
  titlePanel("Temperature Converter"),
  sidebarLayout(
    sidebarPanel(
      fluidRow(
        fluidRow(
          
          column(12, 
                 textInput(inputId = 'temp', label = textOutput(''), 
                           value = "", placeholder = "Enter the value"))
        ),
        
        column(12,
               radioButtons(inputId = "option", label = "Options:", choices = list("Fahrenheit to Celsius" = 1, "Fahrenheit to Kelvin" = 2, "Celsius to Fahrenheit" = 3, "Celsius to Kelvin" = 4, "Kelvin to Fahrenheit" = 5, "Kelvin to Celsius" = 6)))
      ),
      
      actionButton("convert", label = "Convert")
    ),
    
    mainPanel(
      h2(textOutput("result"))
    )
  ))
)