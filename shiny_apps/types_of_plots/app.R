library(shiny)
library(shinythemes)
library(tidyverse)
library(palmerpenguins)
library(DT)
library(ggtext)
theme_set(theme_light() + theme(axis.text = element_text(size = rel(1.5)),
                                axis.title = element_text(size = rel(1.5)),
                                strip.text = element_text(size = rel(1.5)),
                                strip.background = element_rect(fill = "grey30"),
                                plot.title = element_text(size = rel(1.5)),
                                legend.key.size = unit(1, "cm"),
                                legend.text = element_text(size = rel(1.5)),
                                legend.title = element_text(size = rel(1.5)),
                                legend.position = "bottom"))
source("utils.R")
source("descriptions.R")
source("modules.R")


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
    p("Written by ", a("Stephanie J. Spielman.", href = "https://spielmanlab.github.io"), "The", a("source code", href = "https://github.com/spielmanlab/intro_ds_in_r"), "is released under a CC-BY 4.0 license."),
    br(),br(),
    

    tabsetPanel(
        tabPanel("Overview",
                 br(),
                 penguins_text,
                 DTOutput("penguin_table")
                 ),
        ## UI: Histogram tabPanel -------------------------------------------------
        tabPanel("Histograms",
                 sidebarLayout(
                     sidebarPanel(
                         selectInput("histogram_variable", "Numeric variable to visualize:",
                                     choices = numeric_choices),
                         numericInput("binwidth", "How wide (along the X-axis) should the histogram bins be?",
                                      value = 1, min = 0.1, max = 20, step = 0.5),
                         selectInput("histogram_facet_variable", "Second variable to visualize numeric distributions across:",
                                     choices = discrete_choices),
                         color_module_ui("histogram_color")
                     ),
                     
                     mainPanel(
                         br(),
                         plotOutput("histogram", width = "600px", height = "400px"),
                         br(),
                         plotOutput("faceted_histogram", width = "700px", height = "400px"),
                         histogram_text
                     )
                 ) # sidePanelLayout
        ), # tabpanel histograms
        
        ## UI: Boxplot tabPanel -------------------------------------------------
        tabPanel("Boxplots",
            sidebarLayout(
                sidebarPanel(
                    selectInput("boxplot_y_variable", "y variable? This is the numeric variable whose distribution you want to see",
                                choices = numeric_choices,
                                selected = "bill_length_mm"),
                    selectInput("boxplot_x_variable", "x variable? There will be a separate boxplot for each category.",
                                choices = discrete_choices,
                                selected = "species"),   
                    color_module_ui("boxplot_color")
                ),
                mainPanel(
                  br(),
                  plotOutput("boxplot", width = "700px", height = "400px"),
                  boxplot_text
                )
            ) # sidePanelLayout
        ),#boxplot
        
        ## UI: Density tabPanel -------------------------------------------------
        tabPanel("Density plots",
                 h4("Density plots display numeric distributions."),
                 br(),
                 sidebarLayout(
                     sidebarPanel(
                         
                         selectInput("density_variable", "Variable?",
                                     choices = numeric_choices),
                         
                         selectInput("density_fill_variable", "Should we show multiple across?",
                                     choices = discrete_choices),
                         colourpicker::colourInput("density_single_fill", "Color of the single density plot?", value = default_color)
                     ),
                     mainPanel(
                         br(),
                         plotOutput("density", width = "500px", height = "350px"),
                         br(),
                         plotOutput("overlapping_density", width = "750px", height = "350px"),
                         br(),
                         plotOutput("faceted_density", width = "750px", height = "350px"),
                         br(),
                         density_text
                     )
                 ) # sidePanelLayout                
                 
                 
                 
                 
                 
        ), # density
        ## UI: Violin tabPanel -------------------------------------------------
        tabPanel("Violin plots",
                 h4("Violin display numeric distributions, usually for comparative purposes. "),
                 br(),
                 sidebarLayout(
                     sidebarPanel(
                         selectInput("violin_y_variable", "y variable? This is the variable whose distribution you want to see",
                                     choices = numeric_choices),
                         selectInput("violin_x_variable", "x variable? There will be a separate violin plot for each category.",
                                     choices = discrete_choices),                         
                         color_module_ui("violin_color")
                     ),
                     mainPanel(
                         br(),
                         plotOutput("violin"),
                         br(),
                         violin_text
                     )
                 ) # sidePanelLayout
        ),#violin
        ## UI: Jitter tabPanel -------------------------------------------------
        tabPanel("Strip (jitter) plots",
                 sidebarLayout(
                     sidebarPanel(
                         
                         selectInput("jitter_y_variable", "Variable?",
                                     choices = numeric_choices
                         ),
                         selectInput("jitter_x_variable", "xvariable? Separate strip per category.", 
                                     choices = discrete_choices),    
                         color_module_ui("jitter_color"),
                         radioButtons("jitter_setting", "Turn off the 'jittering' to see plain points",
                                      choices = jitter_choices),
                     ),
                     mainPanel(
                         br(),
                         plotOutput("jitter"),
                         br(),
                         jitter_text
                     )
                 ) # sidePanelLayout
        ), # tabpanel jitter
        
        ## UI: Barplot tabPanel ----------------------------------------
        tabPanel("Barplots",
                 sidebarLayout(
                   sidebarPanel(
                     # TODO color choice for single variable barplot
                     selectInput("barplot_variable", "Variable?",
                                 choices = discrete_choices
                     ), 
                     selectInput("barplot_second_variable", "Compare against a second variable in second plot",
                                 choices = discrete_choices,
                                 selected = discrete_choices[2]
                     ),
                     selectInput("barplot_position", "Bar style in grouped barplot?", 
                                 choices = position_choices
                     )
                   ),
                   mainPanel(
                     br(),
                     plotOutput("barplot_single", width = "500px", height = "300px"),
                     plotOutput("barplot_double", width = "500px", height = "300px"),
                     br(),
                     barplot_text,
                     # demonstrates the concept, but is not interactive.
                     plotOutput("barplot_error", width = "500px", height = "300px")
                   )
                 ) # sidePanelLayout
        ), # tabpanel barplot
        
        
        
        
        
        ## UI: Scatterplot tabPanel ------------------------------------
        tabPanel("Scatterplots",
                 br(),
                 sidebarLayout(
                     sidebarPanel(
                         selectInput("scatter_x_variable", "X variable?",
                                     choices =numeric_choices),

                         selectInput("scatter_y_variable", "Y variable?",
                                     choices =numeric_choices,
                                     selected = numeric_choices[2]),
                         
                         ## The module is not well-suited here. it's ok.
                         selectInput("scatter_color_style", "Color the points?",
                                     choices = color_choices),
                         conditionalPanel("input.scatter_color_style == 'Single color'",
                                          { 
                                            colourpicker::colourInput("scatter_single_color", "What color?",
                                                                      value = default_color)
                                          }),
                        conditionalPanel("input.scatter_color_style != 'Single color'",
                                          { 
                                              selectInput("scatter_color_variable", "what variable?",
                                                          choices = c(numeric_choices, discrete_choices)
                                              )
                                          }
                         ) # conditionalpanel
                     ), #sidebarpanel
                     mainPanel(
                        
                         br(),
                         plotOutput("scatter"),
                         br(),
                         scatter_text
                     )
                 ) #sidebarlayout
    ) #tabpanelscatterplots
)) # end with tabsetpanl, ui
    

server <- function(input, output) {

    ## Server: Overview Panel------------------------------------ 
    output$penguin_table <- renderDT({
        datatable(palmerpenguins::penguins, 
                  options = list(rowCallback = JS(rowCallback)))
        
    })
    
    ## Server: Histograms Panel ---------------------------------
    histogram_color <- color_module_server("histogram_color")
    output$histogram <- renderPlot({
      
        hist_fill <- ifelse(is.null(histogram_color()$single_color), default_color, histogram_color()$single_color)
        ggplot(penguins, aes(x = !!(sym(input$histogram_variable)))) + 
            geom_histogram(binwidth = input$binwidth, fill = hist_fill, color = "black") + 
            labs(title = paste0("Histogram of all `", input$histogram_variable, "` values"),
                 subtitle = paste0("All values of `", input$histogram_variable, "` are shown in this figure.")
                 )
    })

    output$faceted_histogram <- renderPlot({
        
        penguins %>%
            drop_na(!!(sym(input$histogram_facet_variable))) %>%
        ggplot(aes(x = !!(sym(input$histogram_variable)))) +
            facet_wrap(vars(!!(sym(input$histogram_facet_variable)))) +
            labs(title = paste0("Faceted histogram of `", input$histogram_variable, "` values across `", input$histogram_facet_variable, "` values"),
                 subtitle = paste0("A subset of values `", input$histogram_variable, "` is shown in each panel, also known as a 'facet.'")
            ) -> p
            
        if (histogram_color()$color_style == color_choices[1])
        {
          p + geom_histogram(binwidth = input$binwidth, 
                             fill = histogram_color()$single_color,
                             color = "black") -> p
        } else {
          p + geom_histogram(binwidth = input$binwidth, 
                             fill = aes(!!(sym(input$histogram_facet_variable))), 
                             color = "black") +
                             scale_fill_brewer(palette = "Set2") -> p
        }
        p
    })    

    ## Server: Boxplots Panel ---------------------------------
    boxplot_color <- color_module_server("boxplot_color")
    output$boxplot <- renderPlot({
      penguins %>%
        drop_na(!!(sym(input$boxplot_x_variable))) %>%
      ggplot(aes(x = !!(sym(input$boxplot_x_variable)),
                 y = !!(sym(input$boxplot_y_variable)))) +
        labs(title = paste0("Boxplot of `", input$boxplot_y_variable, "` values across `", input$boxplot_x_variable, "` values"))-> p
        
      if (boxplot_color()$color_style == color_choices[1])
      {
        p + geom_boxplot(fill = boxplot_color()$single_color) -> p
      } else {
        p <- p + geom_boxplot(aes(fill = !!(sym(input$boxplot_x_variable)))) +
          theme(legend.position = "none") +
          scale_fill_brewer(palette = "Set2") 
      }
      p 
    })
    
    ## Server: Density Panel ---------------------------------
    output$density <- renderPlot({
        ggplot(penguins, aes(x = !!(sym(input$density_variable)))) +
            geom_density(fill = input$density_single_fill) +
            labs(title = paste0("Density plot of all `", input$density_variable, "` values"),
                subtitle = paste0("All values of `", input$density_variable, "` are shown in this figure.")
            )
    })
    
    output$overlapping_density <- renderPlot({
        penguins %>%
            drop_na(!!(sym(input$density_fill_variable))) %>%
            ggplot(aes(x   = !!(sym(input$density_variable)),
                      fill = !!(sym(input$density_fill_variable)) )) +
            geom_density(alpha = 0.8) + 
            scale_fill_brewer(palette = "Set2") +
            labs(
              title = paste0("Overlapping density plot of `", input$density_variable, "` values across `", input$density_fill_variable, "` values"),
              subtitle = "This plot has a single x-axis for all categories, and categories are distinguished by color. Without colors, we could not interpret this plot."
              )
    })
    
    output$faceted_density <- renderPlot({
        penguins %>%
            drop_na(!!(sym(input$density_fill_variable))) %>%
            ggplot(aes(x   = !!(sym(input$density_variable)),
                       fill = !!(sym(input$density_fill_variable)) )) +
            geom_density() + 
            facet_wrap(vars(!!(sym(input$density_fill_variable)))) +
            scale_fill_brewer(palette = "Set2") +
            labs(
              title = (paste0("Faceted density plot of `", input$density_variable, "` values across `", input$density_fill_variable, "` values")),
              subtitle = "This plot has a separate x-axis for each category. Colors also distinguish categories, but they are not necessary to interpret the plot."       
            )
    })
    
    ## Server: Violin Panel ---------------------------------
    violin_color <- color_module_server("violin_color")
    output$violin <- renderPlot({
        penguins %>%
          drop_na(!!(sym(input$violin_x_variable))) %>%
          ggplot(aes(x = !!(sym(input$violin_x_variable)),
                     y = !!(sym(input$violin_y_variable)))) +
                labs(
                  title = paste0("Violin plot of `", input$violin_y_variable, "` values across `", input$violin_x_variable, "` values"))-> p
        
        if (violin_color()$color_style == color_choices[1])
        {
          p <- p + geom_violin(fill = violin_color()$single_color)
        } else {
          p <- p + geom_violin(aes(fill = !!(sym(input$violin_x_variable)))) +
                theme(legend.position = "none") +
                scale_fill_brewer(palette = "Set2") 
        } 
        p 
    })
    
    ## Server: Strip (jitter) Panel ---------------------------------
    jitter_color <- color_module_server("jitter_color")
    output$jitter <- renderPlot({
        penguins %>%
            drop_na(!!(sym(input$jitter_x_variable))) %>%
            ggplot(aes(x = !!(sym(input$jitter_x_variable)),
                       y = !!(sym(input$jitter_y_variable)))) +
              labs(title = paste0("Strip/jitter plot of `", input$jitter_y_variable, "` values across `", input$jitter_x_variable, "` values")) -> p
 
      
      
      
      if (jitter_color()$color_style == color_choices[1])
      {
        if (input$jitter_setting == jitter_choices[1])
        {
          p <- p + geom_jitter(width = 0.2, size=2, color = jitter_color()$single_color)
        } else {
          p <- p + geom_point(size=2, color = jitter_color()$single_color)
        }
      } else {
        if (input$jitter_setting == jitter_choices[1])
        {
          p <- p + geom_jitter(width = 0.2, size=2, 
                               aes(color = !!(sym(input$jitter_x_variable))))
        } else {
          p <- p + geom_point(size=2, aes(color = !!(sym(input$jitter_x_variable))))
        }
         p <- p + scale_color_brewer(palette = "Set2") + theme(legend.position = "none")
      } 
      p               
    })    
    
    
    ## Server: Barplot ----------------------------------
    output$barplot_single <- renderPlot({ 
      penguins %>%
        drop_na(!!(sym(input$barplot_variable))) %>%
        ggplot(aes(x = !!(sym(input$barplot_variable)))) + 
          geom_bar(color = "black", fill = default_color) + 
          labs(
            title("The number of penguin observations in each category.")
          )
      
      })
    
    output$barplot_double <- renderPlot({ 
      penguins %>%
        drop_na(!!(sym(input$barplot_variable)),
                !!(sym(input$barplot_second_variable))) %>%
        ggplot(aes(x = !!(sym(input$barplot_variable)),
                   fill = !!(sym(input$barplot_second_variable))))  + 
        labs(
          title("The number of penguin observations in each combination of categories.")
        ) -> p
      
      if (input$barplot_position == position_choices[1])
      {
        p <- p + geom_bar(color = "black", position = position_dodge(preserve = "single"))
      } else {
        p <- p + geom_bar(color = "black")
      }
      p + scale_fill_brewer(palette = "Set2")
      
    })
    
    output$barplot_error <- renderPlot({
      penguins %>%
        drop_na(flipper_length_mm, species) %>%
        group_by(species) %>%
        summarize(mean_flipper = mean(flipper_length_mm), sd_flipper = sd(flipper_length_mm)) %>%
        ggplot(aes(x = species, y = mean_flipper, fill = species)) + 
          geom_col(color = "black") + 
          geom_errorbar(aes(ymax = mean_flipper + sd_flipper/2, ymin =  mean_flipper - sd_flipper/2), width = 0.05, size=1) + 
        scale_fill_brewer(palette = "Set2") + 
        ylab("Mean +/- SD of flipper length (mm)") + 
        theme(axis.title.y = element_text(size=12))
    })
    
  
    
    ## Server: Scatterplot ----------------------------------
    output$scatter <- renderPlot({
        penguins %>%
            # just drop it all BURN IT ALL DOWN
            drop_na() %>%
            ggplot(aes(x = !!(sym(input$scatter_x_variable)),
                       y = !!(sym(input$scatter_y_variable)))) -> p
        
        if (input$scatter_color_style == color_choices[1])
        {
            p <- p + geom_point(size = 2, color = input$scatter_single_color) 
        } else {
            p <- p + geom_point(size = 2,
                                aes(color = !!(sym(input$scatter_color_variable))))
            if (!(input$scatter_color_variable %in% numeric_choices)) 
            {
              p <- p + scale_color_brewer(palette = "Set2") 
            } else {
              p <- p + theme(legend.text = element_text(size = 10))
            }
        }
        p + ggtitle(paste0("Scatter plot of `", input$scatter_y_variable, "` across `", input$scatter_x_variable, "`"))
    })                           
        
}


# Run the application 
shinyApp(ui = ui, server = server)
