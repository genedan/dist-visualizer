library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Distribution-Visualizer"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
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
                value = 10000)
    ,
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
  ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
