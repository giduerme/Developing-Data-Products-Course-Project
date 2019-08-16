library(shiny)

FahrenheitToCelsius <- function(Fahrenheit1) {
  ((Fahrenheit1 - 32) * 5) / 9
}

FahrenheitToKelvin <- function(Fahrenheit2) {
  (((Fahrenheit2 - 32) * 5) / 9) + 273.15
}

CelsiusToFahrenheit <- function(Celsius1) {
  ((Celsius1 * 9) / 5) + 32
}

CelsiusToKelvin <- function(Celsius2) {
  (Celsius2 + 273.15)
}

KelvinToFahrenheit <- function(Kelvin1) {
  (((Kelvin1 - 273.15) * 9) / 5) + 32
}

KelvinToCelsius <- function(Kelvin2) {
  (Kelvin2 - 273.15)
}

shinyServer(
  function(input, output) {

    
    result <- eventReactive(input$convert, {
      input$temperature
      temp <- as.numeric(input$temp)
      
      if(input$option == 1){
        fc <- FahrenheitToCelsius(temp)
        paste(fc, ' degree Fahrenheit')
      }
      
      else if (input$option == 2){
        fk <- FahrenheitToKelvin(temp)
        paste(fk, ' degree Kelvin')
      }
      
      else if (input$option == 3){
        cf <- CelsiusToFahrenheit(temp)
        paste(cf, ' degree Fahrenheit')
      }
      
      else if (input$option == 4){
        ck <- CelsiusToKelvin(temp)
        paste(ck, ' degree Kelvin')
      }
      
      else if (input$option == 5){
        kf <- KelvinToFahrenheit(temp)
        paste(kf, ' degree Fahrenheit')
      }
      
      else{
        kc <- KelvinToCelsius(temp)
        paste(kc, ' degree Celsius')
      }
    })
    
    output$result <- renderText({
      result()
    })
  }
)