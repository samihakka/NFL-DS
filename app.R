# Define UI
ui <- fluidPage(
  titlePanel("Interactive Analysis"),

  sidebarLayout(
    sidebarPanel(
      # Add input elements (e.g., sliders, text inputs)
      sliderInput("input_range", "Select a range:", min = 1, max = 100, value = c(25, 75))
    ),
    mainPanel(
      # Add output elements (e.g., plots, tables)
      plotOutput("output_plot")
    )
  )
)

sliding_bar <- function(input_range) {
  # Extract the minimum and maximum values from the input range
  min_value <- input_range[1]
  max_value <- input_range[2]
  
  # Generate 1000 random data points within the specified range
  random_data <- runif(1000, min = min_value, max = max_value)
  
  return(random_data)
}

# Define server
server <- function(input, output) {
  # Add reactive expressions or functions
  reactive_data <- reactive({
    # Use input values to filter or modify data
    data <- sliding_bar(input$input_range)
    return(data)
  })

  # Render outputs based on reactive expressions
  output$output_plot <- renderPlot({
    # Use the reactive data to create a plot
    data <- reactive_data()
    # Example: Create a histogram
    hist(data, main = "Histogram", xlab = "Values")
  })
}
# Run the Shiny app
shinyApp(ui = ui, server = server)