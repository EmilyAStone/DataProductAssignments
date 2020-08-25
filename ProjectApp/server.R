library(shiny)

dat <- mtcars
library(ggplot2)

shinyServer(function(input, output, session) {
    
    output$independent <- renderUI({
        checkboxGroupInput("independent", "Independent Variables:",names(dat)[!names(dat) %in% input$dependent],names(dat)[!names(dat) %in% input$dependent])
    })
    
    
    runRegression <- reactive({
        lm(as.formula(paste(input$dependent," ~ ",paste(input$independent,collapse="+"))),data=dat)
    })
    
    output$regTab <- renderTable({
        if(!is.null(input$independent)){
            summary(runRegression())$coefficients
        } else {
            print(data.frame(Warning="Please select Model Parameters."))
        }
    }, include.rownames=TRUE)
})


