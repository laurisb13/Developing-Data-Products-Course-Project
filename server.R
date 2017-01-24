library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    output$plot1 <- renderPlot({
      OJ <- ToothGrowth[ToothGrowth$supp == "OJ",]
      fit1 <- lm(OJ$len ~ OJ$dose)
      a1 <- summary(fit1)$coefficients[1,1]
      b1 <- summary(fit1)$coefficients[2,1]
      res1 <- a1+((input$predOJ)*b1)
      ggplot(data = OJ, aes(x = dose, y = len), main="Predicted Tooth Growth OJ") +
      geom_point(aes(x = dose, y = len)) +
      geom_point(aes(x = input$predOJ, y = res1), color="red", size=3)
    }, quoted = FALSE, width=300, height=300)
    
    output$text1 <- renderText("Predicted Tooth Growth for OJ dose")
    
  output$plot2 <- renderPlot({
    VC <- ToothGrowth[ToothGrowth$supp == "VC",]
    fit2 <- lm(VC$len ~ VC$dose)
    a2 <- summary(fit2)$coefficients[1,1]
    b2 <- summary(fit2)$coefficients[2,1]
    res2 <- a2+((input$predVC)*b2)
    ggplot(data = VC, aes(x = dose, y = len), main="Predicted Tooth Growth VC") +
    geom_point(aes(x = dose, y = len)) +
    geom_point(aes(x = input$predVC, y = res2), color="red", size=3)
  }, quoted = FALSE, width=300, height=300)
  
  output$text2 <- renderText("Predicted Tooth Growth for VC dose")
  
  })