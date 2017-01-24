library(shiny)

shinyUI((fluidPage(
  titlePanel("Tooth Growth"),
  sidebarLayout(
  sidebarPanel(
          helpText("Predict Tooth Growth for indicated dose"),
          sliderInput("predOJ", label = h3("OJ dose"), value=2, min=0, max=10),
          sliderInput("predVC", label = h3("VC dose"), value=2, min=0, max=10)
          ),
  mainPanel(
    (textOutput("text1")),
    (plotOutput("plot1")),
    (textOutput("text2")),   
    (plotOutput("plot2"))
)))))
