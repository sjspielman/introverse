library(shiny)
library(shinyWidgets)
library(DT)
library(palmerpenguins)
library(ggplot2)
library(ggforce)
library(tidyr)
library(dplyr)
library(glue)

source("utils.R")
source("descriptions.R")
source("modules.R")
source("build_plot_strings.R")
# Sets the theme (yes, we set. sorry/notsorry?)
eval(parse(text =theme_custom_string))


# Thanks, stackoverflow!
# https://stackoverflow.com/questions/58526047/customizing-how-datatables-displays-missing-values-in-shiny
rowCallback <- c(
    "function(row, data){",
    "  for(var i=0; i<data.length; i++){",
    "    if(data[i] === null){",
    "      $('td:eq('+i+')', row).html('NA')",
    "        .css({'color': 'rgb(151,151,151)', 'font-style': 'italic'});",
    "    }",
    "  }",
    "}"  
)


ui <- fluidPage(theme = "my_united.css",
 
    # Application title
    titlePanel("Common types of data visualizations"),
    p("Written by ", a("Stephanie J. Spielman.", href = "https://spielmanlab.github.io"), "The", a("source code", href = "https://github.com/sjspielman/datascience_for_biologists/tree/master/interactive_apps/types_of_plots"), "is released under a CC-BY 4.0 license."),
    br(),br(),
    

    tabsetPanel(
        ## UI: Overview tabPanel --------------------------------------------------
        tabPanel("Overview",
                 br(),
                 prettyCheckbox(
                   inputId = "hide_penguins",
                   label = "Click to hide the penguins", 
                   value = FALSE,
                   status = "warning",
                   shape = "curve"
                 ),
                 uiOutput("penguin_image"),
                 penguins_text,
                 DTOutput("penguin_table"),
                 br(),
                 overview_technical
                 ),
            
        ## UI: Histogram tabPanel -------------------------------------------------
        tabPanel("Histograms",
          tabsetPanel(
            tabPanel("Description", 
              histogram_dataviz,
              histogram_text
            ),
            tabPanel("In action!",
              sidebarLayout(
                sidebarPanel(
                  selectInput("histogram_variable", 
                              "Select a numeric continuous variable to visualize. This variable will be placed along the x-axis.", 
                              choices = numeric_choices),
                  sliderInput("binwidth", "How wide (along the x-axis) should the histogram bins be?",
                              value = 1, min = 0.1, max = 100, step = 0.5),
                  selectInput("histogram_facet_variable", "Select a discrete variable to visualize numeric distributions across:",
                              choices = discrete_choices),
                  color_module_ui("histogram_color", 
                                         label = "Should the faceted histograms be filled with the same color, or filled with a separate color for each category?")
                ), # sidebarPanel
                mainPanel(
                  histogram_dataviz, 
                  br(),
                  display_plot_code_module_ui("single_histogram", width = "700px"),
                  display_plot_code_module_ui("faceted_histogram", width = "700px")
                ) # mainPanel
              )))
        ), # tabpanel histograms
        
        ## UI: Boxplot tabPanel -------------------------------------------------
        tabPanel("Boxplots",
                 tabsetPanel(
                   tabPanel("Description", 
                            boxplot_dataviz,
                            boxplot_text
                   ),
                   tabPanel("In action!",
                      sidebarLayout(
                        sidebarPanel(
                            selectInput("boxplot_y_variable", "Select a numeric continuous variable to visualize. This variable will be placed along the y-axis.",
                                        choices = numeric_choices,
                                        selected = "bill_length_mm"),
                            selectInput("boxplot_x_variable", "Select a discrete variable to visualize numeric distributions across. This variable will be placed along the x-axis. There will be a separate boxplot for each category.",
                                        choices = discrete_choices,
                                        selected = "species"),   
                            color_module_ui("boxplot_color", 
                                            label = "Should the boxplots be filled with the same color, or filled with a separate color for each category?")
                        ),
                        mainPanel(
                          boxplot_dataviz,                          
                          display_plot_code_module_ui("boxplot")
                        )
                      )))
        ), #tabpanel #boxplot
        
        ## UI: Density tabPanel -------------------------------------------------
        tabPanel("Density plots",
                 tabsetPanel(
                   tabPanel("Description", 
                            density_dataviz,
                            density_text
                   ),
                   tabPanel("In action!",
                            sidebarLayout(
                              sidebarPanel(
                                selectInput("density_variable", "Select a numeric continuous variable to visualize. This variable will be placed along the x-axis.",
                                     choices = numeric_choices),

                                selectInput("density_fill_variable", "Select a discrete variable to visualize numeric distributions across. There will be a separate density plot for each category.",
                                     choices = discrete_choices),
                                colourpicker::colourInput("density_single_fill", "Color of the single density plot?", value = default_color)
                              ),
                              mainPanel(
                                density_dataviz,   
                                display_plot_code_module_ui("single_density", width = "500px", height = "350px"),
                                display_plot_code_module_ui("overlapping_density", width = "750px", height = "400px"),
                                display_plot_code_module_ui("faceted_density", width = "750px", height = "400px"),
                              )
                            )))
        ),# tab

        ## UI: Violin tabPanel -------------------------------------------------
        tabPanel("Violin plots",
                 tabsetPanel(
                   tabPanel("Description", 
                            violin_dataviz,
                            violin_text
                   ),
                   tabPanel("In action!",
                            sidebarLayout(
                              sidebarPanel(
                                selectInput("violin_y_variable", "Select a numeric continuous variable to visualize. This variable will be placed along the y-axis.",
                                       choices = numeric_choices),
                                selectInput("violin_x_variable", "Select a discrete variable to visualize numeric distributions across. This variable will be placed along the x-axis. There will be a separate violin plot for each category.",
                                       choices = discrete_choices),
                                color_module_ui("violin_color", 
                                           label = "Should the violin plots be filled with the same color, or filled with a separate color for each category?")
                                ),
                              mainPanel(
                                violin_dataviz,
                                display_plot_code_module_ui("violin")
                                )
                            )))
        ),#violin
        
        ## UI: Jitter tabPanel -------------------------------------------------
        tabPanel("Strip (jitter) plots",
                 tabsetPanel(
                   tabPanel("Description", 
                            jitter_dataviz,
                            jitter_text
                   ),
                   tabPanel("In action!",
                            sidebarLayout(
                              sidebarPanel(
                                selectInput("jitter_y_variable", "Select a numeric continuous variable to visualize. This variable will be placed along the y-axis.",
                                     choices = numeric_choices
                         ),
                         selectInput("jitter_x_variable", "Select a discrete variable to visualize numeric distributions across. This variable will be plced along the x-axis. There will be a separate strip/jitter plot for each category.", 
                                     choices = discrete_choices),    
                         color_module_ui("jitter_color",
                                         label = "Should the points all have the same color, or be colored separately for each category?"),
                         radioButtons("jitter_setting", "Turn off the 'jittering' to see regular points and discover the importance of 'jittering.'", 
                                      choices = jitter_choices)
                         ),
                         mainPanel(
                           jitter_dataviz,
                           display_plot_code_module_ui("jitter")
                           )
                        )))
        ), # tabpanel jitter
        
        ## UI: Sina tabPanel -------------------------------------------------
        tabPanel("Sina plots",
                 tabsetPanel(
                   tabPanel("Description", 
                            sina_dataviz,
                            sina_text
                   ),
                   tabPanel("In action!",
                            sidebarLayout(
                              sidebarPanel(
                                selectInput("sina_y_variable", "Select a numeric continuous variable to visualize. This variable will be placed along the y-axis.",
                                 choices = numeric_choices
                     ),
                     selectInput("sina_x_variable", "Select a discrete variable to visualize numeric distributions across. This variable will be plced along the x-axis. There will be a separate sina plot for each category.", 
                                 choices = discrete_choices),    
                     color_module_ui("sina_color",
                                     label = "Should the points all have the same color, or be colored separately for each category?")
                   ),
                   mainPanel(
                     sina_dataviz,                          
                     display_plot_code_module_ui("sina")
                   )
                 )))
        ), # tabpanel sina
      
        ## UI: Barplot tabPanel ----------------------------------------
        tabPanel("Barplots",
                 tabsetPanel(
                   tabPanel("Description", 
                            barplot_dataviz,
                            barplot_text,
                            # demonstrates the concept, but is not interactive.
                            display_plot_code_module_ui("barplot_errorbar", width = "500px", height = "300px")
                   ),
                   tabPanel("In action!",
                            sidebarLayout(
                              sidebarPanel(
                                selectInput("barplot_variable", "Select a discrete variable to visualize. This variable will be placed along the x-axis.",
                                            choices = discrete_choices
                                ), 
                                colourpicker::colourInput("barplot_single_fill", 
                                                          "What color should the single barplot's bars be filled with?", value = default_color),
                                
                                selectInput("barplot_second_variable", "Select a second discrete variable to visualize in comparison with the first discrete variable in a 'grouped barplot.'",
                                            choices = discrete_choices,
                                            selected = discrete_choices[2]
                                ),
                                selectInput("barplot_position", "How should the grouped barplot bars be styled?", 
                                            choices = position_choices
                                )
                              ),
                              mainPanel(
                                barplot_dataviz,   
                                display_plot_code_module_ui("barplot_single", width = "600px", height = "400px"),
                                display_plot_code_module_ui("barplot_double", width = "700px", height = "400px")
                              )
                            ))) 
        ), # tabpanel barplot
      
        ## UI: Scatterplot tabPanel ------------------------------------
        tabPanel("Scatterplots",
                 tabsetPanel(
                   tabPanel("Description", 
                            scatter_dataviz,
                            scatter_text
                   ),
                   tabPanel("In action!",
                            sidebarLayout(
                              sidebarPanel(
                         selectInput("scatter_x_variable", "Select a numeric variable to place along the x-axis. This is sometimes called the 'independent' or 'predictor' variable.",
                                     choices =numeric_choices),

                         selectInput("scatter_y_variable", "Select a numeric variable to place along the y-axis.  This is sometimes called the 'response' variable.",
                                     choices =numeric_choices,
                                     selected = numeric_choices[2]),
                         radioButtons("regression", "Display linear regression line ('line-of-best-fit')",
                                      choices = regression_choices),
                         
                         ## The module is not well-suited here. it's ok.
                         selectInput("scatter_color_style", "Should all points be the same color, or colored based on their value of another given variable?",
                                     choices = color_choices_scatter),
                         conditionalPanel("input.scatter_color_style == 'Single color'",
                                          { 
                                            colourpicker::colourInput("scatter_single_color", "What single color should all points be?",
                                                                      value = default_color)
                                          }),
                        conditionalPanel("input.scatter_color_style != 'Single color'",
                                          { 
                                              selectInput("scatter_color_variable", "What variable should determine point colors?",
                                                          choices = list("Numeric variables" = numeric_choices, "Discrete variables" = discrete_choices)
                                              )
                                          }
                         ) # conditionalpanel
                     ), #sidebarpanel
                     mainPanel(
                       scatter_dataviz,                          
                       display_plot_code_module_ui("scatter")
                    )
                 )))
)))
 # end with tabsetpanl, ui
    

server <- function(input, output) {
  
    ## Server: Overview Panel------------------------------------ 
    output$penguin_table <- renderDT({
        datatable(palmerpenguins::penguins, 
                  options = list(rowCallback = JS(rowCallback)))
        
    })
    output$penguin_image <- renderUI({
      if (input$hide_penguins)
      {
        tagList()
      } else {
        tagList(
          tags$img(src = "img/lter_penguins.png", width = "35%"),
          div(style = "font-size:0.8em;", 
              p("Artwork by", a("@allison_horst", href="https://github.com/allisonhorst/palmerpenguins"))
          )
        )
      }
    })
    
    output$penguins_year_factor <- renderText({
      glue::glue(
        "penguins <- palmerpenguins::penguins %>% 
              dplyr::mutate(year = as.factor(year))
        "
      )
    })
    output$theme_custom_string <- renderText({
        theme_custom_string
    })

    
    
    ## Server: Histograms Panel ---------------------------------
    histogram_color <- color_module_server("histogram_color")
    display_plot_code_module_server("single_histogram", plot_string = reactive(histogram_plot()$single))
    display_plot_code_module_server("faceted_histogram", plot_string = reactive(histogram_plot()$faceted))
    
    
    histogram_plot <- reactive({
      build_histogram_string(
        list(color_style   = histogram_color()$color_style,
             x             = input$histogram_variable,
             binwidth      = input$binwidth,
             fill          = paste0('"', histogram_color()$single_color, '"'),
             facet         = input$histogram_facet_variable,
             title_single  = glue::glue('"Histogram of all `{input$histogram_variable}` values"'),
             sub_single    = glue::glue('"All values in `{input$histogram_variable}` are shown in this histogram."'),
             title_faceted = glue::glue('"Faceted histogram of `{input$histogram_variable}` values across `{input$histogram_facet_variable}` values"'),
             sub_faceted   = glue::glue('"A subset of values `{input$histogram_variable}` is shown in each panel, also known as a facet."')
            )
      )
    })

    
  
    ## Server: Boxplots Panel ---------------------------------
    boxplot_color <- color_module_server("boxplot_color")
    display_plot_code_module_server("boxplot", plot_string = reactive(boxplot_string()))
    
    boxplot_string <- reactive({
      build_boxplot_violin_string(
        list(x = input$boxplot_x_variable,
             y = input$boxplot_y_variable,
             fill = paste0('"',boxplot_color()$single_color,'"'),
             color_style = boxplot_color()$color_style,
             title = glue::glue('"Boxplot of `{input$boxplot_y_variable}` values across `{input$boxplot_x_variable}` values"')
        ),
        geom = "geom_boxplot"
      )
    })
    
    ## Server: Density Panel ---------------------------------
    display_plot_code_module_server("single_density", plot_string = reactive(density_string()$single))
    display_plot_code_module_server("overlapping_density", plot_string = reactive(density_string()$overlapping))
    display_plot_code_module_server("faceted_density", plot_string = reactive(density_string()$faceted))
    
    density_string <- reactive({
      build_density_string(
        list(
          x = input$density_variable,
          fill = paste0('"',input$density_single_fill,'"'),
          fillby = input$density_fill_variable,
          title_single = glue::glue('"Density plot of all `{input$density_variable}` values"'),
          sub_single   = glue::glue('"All values of `{input$density_variable}` are shown in this plot."'),
          title_overlapping = glue::glue('"Overlapping density plot of `{input$density_variable}` values across `{input$density_fill_variable}` values"'),
          sub_overlapping = '"This plot has a single x-axis for all categories, and categories are distinguished by color. Without colors, we could not interpret this plot."',
          title_faceted = glue::glue('"Faceted density plot of `{input$density_variable}` values across `{input$density_fill_variable}` values"'),
          sub_faceted = '"This plot has a separate x-axis for each category. Colors also distinguish categories, but they are not necessary to interpret the plot."'       
          )
      )
    })

    
    ## Server: Violin Panel ---------------------------------
    violin_color <- color_module_server("violin_color")
    display_plot_code_module_server("violin", plot_string = reactive(violin_string()))
    
    violin_string <- reactive({
      build_boxplot_violin_string(
        list(x = input$violin_x_variable,
             y = input$violin_y_variable,
             fill = paste0('"',violin_color()$single_color,'"'),
             color_style = violin_color()$color_style,
             title = glue::glue('"Violin plot of `{input$violin_y_variable}` values across `{input$violin_x_variable}` values"')
        ),
        geom = "geom_violin"
      )
    })
    
    
    ## Server: Strip (jitter) Panel ---------------------------------
    jitter_color <- color_module_server("jitter_color")
    display_plot_code_module_server("jitter", plot_string = reactive(jitter_string()))
    
    jitter_string <- reactive({
      build_jitter_string(
        list(x = input$jitter_x_variable,
             y = input$jitter_y_variable,
             color = paste0('"',jitter_color()$single_color,'"'),
             color_style = jitter_color()$color_style,
             jitter_setting = input$jitter_setting,
             title = glue::glue('"Strip/jitter plot of `{input$jitter_y_variable}` values across `{input$jitter_x_variable}` values"')
        )
      )
    })
    
 
      ## Server: Sina Panel ---------------------------------
      sina_color <- color_module_server("sina_color")
      display_plot_code_module_server("sina", plot_string = reactive(sina_string()))
      
      sina_string <- reactive({
        build_sina_string(
          list(x = input$sina_x_variable,
               y = input$sina_y_variable,
               color = paste0('"',sina_color()$single_color,'"'),
               color_style = sina_color()$color_style,
               title = glue::glue('"Sina plot of `{input$sina_y_variable}` values across `{input$sina_x_variable}` values"')
          )
        )   
      })
         
    ## Server: Barplot ----------------------------------
    display_plot_code_module_server("barplot_single", plot_string = reactive(barplot_string()$single))
    display_plot_code_module_server("barplot_double", plot_string = reactive(barplot_string()$double))
    display_plot_code_module_server("barplot_errorbar", plot_string = reactive(barplot_string()$errorbar))
      
    barplot_string <- reactive({
      build_barplot_string(
        list(x = input$barplot_variable,
             fill = paste0('"',input$barplot_single_fill,'"'),
             fillby = input$barplot_second_variable, 
             y = input$sina_y_variable,
             position = input$barplot_position,
             title_single = '"The number of penguin observations in each category."',
             title_double = '"Grouped barplot of the number of penguins in each combination of categories."'
        )
      )   
    })
      
  
    
    ## Server: Scatterplot ----------------------------------
    display_plot_code_module_server("scatter", plot_string = reactive(scatter_string()))
    
     scatter_string <- reactive({
      build_scatter_string(
        list(x = input$scatter_x_variable,
             y = input$scatter_y_variable,
             color = paste0('"',input$scatter_single_color,'"'),
             colorby = input$scatter_color_variable,
             color_style = input$scatter_color_style,
             regression = input$regression,
             title = glue::glue('"Scatter plot of `{input$scatter_y_variable}` across `{input$scatter_x_variable}` values"'),
             subtitle = glue::glue('"Notice how the regression line sometimes changes direction when you color by a discrete variable - read on!"')
        )
      )   
    })                   
        
}


# Run the application 
shinyApp(ui = ui, server = server)
