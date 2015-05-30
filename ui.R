library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Distribution-Visualizer"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("Distribution","Distribution",c("Beta","Binomial","Tweedie"),selected="Beta"),
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      ,
      sliderInput("observations",
                  "Number of observations:",
                  min = 1,
                  max = 20000,
                  value = 10000),
      
      # Panels to be displayed for Beta
      conditionalPanel(
        condition = "input.Distribution == 'Beta'",
        sliderInput("alpha",
                    "Shape Parameter α:",
                    min = 0,
                    max = 5,
                    value = 2.5,
                    step = .1)
        ,
        sliderInput("beta",
                    "Shape Parameter β:",
                    min = 0,
                    max = 5,
                    value = 2.5,
                    step = .1)
        ),
      # Panels to be displayed for Binomial
      conditionalPanel(
        condition = "input.Distribution == 'Binomial'",
        sliderInput("trials",
                    "Number of trials:",
                    min = 0,
                    max = 10000,
                    value = 10,
                    step = 1)
        ,
        sliderInput("probsuccess",
                    "Probability of Sucess:",
                    min = 0,
                    max = 1,
                    step = .01,
                    value = .5)
        ),
      # Panels to be displayed for Tweedie
      conditionalPanel(
        condition = "input.Distribution == 'Tweedie'",
        sliderInput("power",
                    "Power ξ:",
                    min = 1,
                    max = 2,
                    value = 1.5,
                    step=.1)
        ,
        sliderInput("mu",
                    "Mean μ:",
                    min = 0,
                    max = 1000,
                    value = 1,
                    step = .1)
        ,
        sliderInput("phi",
                    "Dispersion φ:",
                    min = 0,
                    max = 5,
                    value = 1,
                    step = .1)
  )),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot",width = "600px", height="800px")
    )
  )
))
