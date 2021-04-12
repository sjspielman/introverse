color_module_ui <- function(id, label = "Color all by same color or based on category?" ) {
  ns <- NS(id)
  tagList(
    selectInput(ns("color_style"), label = label,
                choices = color_choices # Single color
    
    ),
    conditionalPanel("input.color_style == 'Single color'", ns = ns, 
                     { 
                       colourpicker::colourInput(ns("single_color"), 
                                                 "Choose color:",
                                                 default_color)
                     }
    )
  )
}

color_module_server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      reactive({
        list(
          color_style  = input$color_style,
          single_color = input$single_color
        )
      })
      }
    ) 
}



display_plot_code_module_ui <- function(id, width = "600px", height = "400px"){
  ns <- NS(id)

  tagList(
    fluidRow(
      column(1,shinyWidgets::dropdownButton(
        h3("Code:"),
        verbatimTextOutput(ns("plot_code")),
        circle = FALSE, status = "warning",
        icon = icon("gear"), width = "600px"
      )),
      column(11, plotOutput(ns("plot"), width = width, height = height))
    ), # fluidRow
    br()
  )
}
display_plot_code_module_server <- function(id, plot_string)
{
  ## MUST REFER TO plot_string as plot_string() (not in function definition, but in body)
  # Otherwise module won't be reactive.
  moduleServer(
    id,
    function(input, output, session) {
      output$plot <- renderPlot({
        eval(parse(text = plot_string()))
      })
      output$plot_code <- renderText({plot_string()})

    }
  )
}
