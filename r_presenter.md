Guinea Pigs are so cool
========================================================

We created an app to honor them!


The UI s
========================================================

In the interface, we allow you to select the type of supplement. Also,
you can indicate your preference for pink. All highly reactive - guaranteed!


```r
checkboxInput("inclOJ", "Include Orange Juice", value = TRUE),
       checkboxInput("inclVC", "Include Ascorbic Acid", value = TRUE),
       checkboxInput("pink", "Pink is my favorite color", value = FALSE),
```
 

The Server (1)
========================================================

The server slices the data set according to your preference!

```r
shinyServer(function(input, output) {
    a <- NULL
    a <- c(a,ToothGrowth)
    a <- c(a,filter(ToothGrowth,supp!="OJ"))
    a <- c(a,filter(ToothGrowth,supp!="VC"))
    a <- c(a,filter(ToothGrowth,supp=="lala"))
    
  dataT <- reactive({
    if(input$inclOJ && input$inclVC) i <-1
    else if(!input$inclOJ && input$inclVC) i <-2
    else if(input$inclOJ && !input$inclVC) i <-3
    else i <-4
    i
  }) 
  
  pink <- reactive({
    input$pink
  }) 
```

The Server (2)
========================================================

The server slices the data set according to your preference!

```r
output$distPlot <- renderPlot({
    i <- dataT()
    if(i==1) teeth <- ToothGrowth
    if(i==2)teeth <-filter(ToothGrowth,supp!="OJ")
    if(i==3) teeth <- filter(ToothGrowth,supp!="VC")
    if(i==4) teeth <- filter(ToothGrowth,supp=="lala")
    if(pink()){
    plot(teeth$dose,teeth$len,xlim = c(0, 3), ylim = c(0, 40),col="pink",xlab="Dosage",ylab="Length")
    if(i<4){model <- lm(len ~ dose, data=teeth)
    abline(model, col = "pink", lwd = 2) }}
    else{
      plot(teeth$dose,teeth$len,xlim = c(0, 3), ylim = c(0, 40),col="blue",xlab="Dosage",ylab="Length")
      if(i<4){model <- lm(len ~ dose, data=teeth)
      abline(model, col = "black", lwd = 2) }}
```

  
  
Slide With an Example Plot
========================================================

Guinea Pig teeth through a pink lens.
    
![plot of chunk unnamed-chunk-4](r_presenter-figure/unnamed-chunk-4-1.png)

Thanks and so Long!
