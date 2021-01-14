

counterButton <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    actionButton(ns("button"), label = label),
    verbatimTextOutput(ns("out"))
  )
}

color_module_ui <- function(id) {
  ns <- NS(id)
  tagList(
    selectInput(ns("color_style"), "Color all by same color or based on category?",
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