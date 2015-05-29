library(shiny)
library(tweedie)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    par(mfrow=c(2,1))
    # generates dataset based on selected distribution
    if(input$Distribution == "Tweedie")
    {
      x    <-   rtweedie(input$observations,input$power,input$mu,input$phi)
    } else {
      x    <-   rbeta(input$observations,input$alpha,input$beta)
    }
    
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # calculate the empirical cumulative distribution
    P = ecdf(x)
    P(0.0)    
    # draw the histogram with the specified number of bins
    title = paste("Histogram of ",input$Distribution," Distribution",sep='')
    p1 = hist(x, breaks = bins, col = 'lightblue', border = 'white',main=title)
    p2 = plot(P, main = "Empirical Cumulative Distribution")
  })
})
