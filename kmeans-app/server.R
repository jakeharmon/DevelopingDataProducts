palette(rainbow(6))

shinyServer(function(input, output, session) {
  
  selectedData <- reactive({
    wine[, c(input$xcol, input$ycol,names(wine)[1])]
  })
  
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$plotKmeans <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData()[,1],selectedData()[,2],xlab = input$xcol,ylab = input$ycol,
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
     text(selectedData()[,1],selectedData()[,2],selectedData()[,3],cex=0.7,pos=4,col="black")
  })
  
})