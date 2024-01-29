library(shiny)
source("functions.R") 
ui <- fluidPage(
  titlePanel("Sample Numbers"),
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "sd", 
                   label = "Standard Deviation:", 
                   value = 10),
      numericInput(inputId = "MDE", 
                   label = "Minimum Detectable Effect:", 
                   value = 5),
      numericInput(inputId = "alpha", 
                   label = "Significance Level:", 
                   value = 0.05),
      numericInput(inputId = "power", 
                   label = "Power:", 
                   value = 0.8),
      actionButton("calculateBtn", "Calculate")
    ),
    
    mainPanel(
      h4("Calculated Sample Size:"),
      verbatimTextOutput("result")
    )
  )
)

server <- function(input, output, session) {
  observeEvent(input$calculateBtn, {
    result <- sample_size(input$sd, input$MDE, input$alpha, input$power)
    output$result <- renderText(result)
  })
}

shinyApp(ui, server)
