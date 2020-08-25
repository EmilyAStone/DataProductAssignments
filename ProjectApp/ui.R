library(shiny)

dat <- mtcars

shinyUI(pageWithSidebar(
    headerPanel("Multivariate regression on the motor cars data set"),
    
    sidebarPanel(
        selectInput("dependent", "Dependent Variable:", names(dat)),
        uiOutput("independent")
    ),
    
    mainPanel(tableOutput("regTab"))
))

