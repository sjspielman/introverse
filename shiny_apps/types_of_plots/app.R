library(shiny)
library(shinythemes)
library(tidyverse)
library(palmerpenguins)
library(DT)
theme_set(theme_light() + theme(axis.text = element_text(size = rel(1.5)),
                                axis.title = element_text(size = rel(1.5)),
                                strip.text = element_text(size = rel(1.5)),
                                strip.background = element_rect(fill = "grey30"),
                                plot.title = element_text(size = rel(1.5)),
                                legend.key.size = unit(1, "cm"),
                                legend.text = element_text(size = rel(1.5)),
                                legend.title = element_text(size = rel(1.5)),
                                legend.position = "bottom"))
# TODO: WHY DOESN'T THIS WORK!!!!!!!!!!!!!!!!!!
pengiuns <- penguins %>% mutate(year = as.character(year))


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


ui <- fluidPage(theme = shinytheme("sandstone"),

    # Application title
    titlePanel("Common types of data visualizations"),
    p("Written by ", a("Stephanie J. Spielman", href = "https://spielmanlab.github.io"), "and released under a CC-BY license."),
    br(),br(),
    

    tabsetPanel(
        tabPanel("Overview",
                 h4("Penguins!!"),
                 DTOutput("penguin_table")
                 ),
        ## UI: Histogram tabPanel -------------------------------------------------
        tabPanel("Histograms",
                 h4("Histograms display numeric distributions."),
                 br(),
                 sidebarLayout(
                     sidebarPanel(

                         selectInput("histogram_variable", "Variable?",
                                     choices = c("bill_length_mm",
                                                 "bill_depth_mm",
                                                 "flipper_length_mm",
                                                 "body_mass_g"),
                                     selected = "bill_length_mm"),
                         
                         numericInput("binwidth", "Binwidth?",
                                      value = 1, min = 0.1, max = 20, step = 0.5),
                         
                         selectInput("histogram_facet_variable", "Should we show multiple across?",
                                     choices = c("species",
                                                 "island",
                                                 "sex"),
                                     selected = "species"),
                     ),
                     mainPanel(
                         p("Paragraph of text about what histograms are."),
                         br(),br(),
                         plotOutput("histogram"),
                         br(),
                         plotOutput("faceted_histogram")
                     )
                 ) # sidePanelLayout
        ), # tabpanel histograms
        
        ## UI: Boxplot tabPanel -------------------------------------------------
        tabPanel("Boxplots",
            br(),
            h4("Boxplots display numeric distributions, usually for comparative purposes."),
            sidebarLayout(
                sidebarPanel(
                    selectInput("boxplot_y_variable", "y variable? This is the variable whose distribution you want to see",
                                choices = c("bill_length_mm",
                                             "bill_depth_mm",
                                             "flipper_length_mm",
                                             "body_mass_g"),
                                selected = "bill_length_mm"),
                    selectInput("boxplot_x_variable", "x variable? There will be a separate boxplot for each category.",
                                choices = c("species",
                                            "island",
                                             "sex"),
                                selected = "species"),                         
                         
                         selectInput("boxplot_color_style", "Color based on categories, or all same color?",
                                    choices = c("Color each category separately",
                                                  "Single color")
                                     ),
                         conditionalPanel("input.boxplot_color_style == 'Single color'",
                                          { 
                                              colourpicker::colourInput("boxplot_color", 
                                                                        "Choose boxplot color","purple")
                                              
                                          }
                         )#, #TODO: show across years?
                         
                         
                     ),
                     mainPanel(
                         p("Paragraph of text about what boxplots are. They are sort of silly, and the real takehomes are the range and median and outliers. They were invented to draw by hand and maybe figure out a way to identify outliers."),
                         br(),br(),
                         plotOutput("boxplot")
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
                                     choices = c("bill_length_mm",
                                                 "bill_depth_mm",
                                                 "flipper_length_mm",
                                                 "body_mass_g"),
                                     selected = "bill_length_mm"),
                         
                         selectInput("density_fill_variable", "Should we show multiple across?",
                                     choices = c("species",
                                                 "island",
                                                 "sex"),
                                     selected = "species"),
                     ),
                     mainPanel(
                         p("Paragraph of text about what density plots are."),
                         br(),br(),
                         plotOutput("density"),
                         br(),
                         plotOutput("overlapping_density"),
                         br(),
                         plotOutput("faceted_density")                      
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
                                     choices = c("bill_length_mm",
                                                 "bill_depth_mm",
                                                 "flipper_length_mm",
                                                 "body_mass_g"),
                                     selected = "bill_length_mm"),
                         selectInput("violin_x_variable", "x variable? There will be a separate violin plot for each category.",
                                     choices = c("species",
                                                 "island",
                                                 "sex"),
                                     selected = "species"),                         
                         
                         selectInput("violin_color_style", "Color based on categories, or all same color?",
                                     choices = c("Color each category separately",
                                                 "Single color")
                         ),
                         conditionalPanel("input.violin_color_style == 'Single color'",
                                          { 
                                              colourpicker::colourInput("violin_color", 
                                                                        "Choose violin color","firebrick3")
                                              
                                          }
                         )#, #TODO: show across years?
                         
                         
                     ),
                     mainPanel(
                         p("Paragraph of text about what violin are. They are the ill-fated lovechild of density plots and boxplots."),
                         br(),br(),
                         plotOutput("violin")
                     )
                 ) # sidePanelLayout
        ),#violin
        ## UI: Jitter tabPanel -------------------------------------------------
        tabPanel("Strip (jitter) plots",
                 h4("Strip plots display numeric distributions usually for comparative purposes."),
                 br(),
                 sidebarLayout(
                     sidebarPanel(
                         
                         selectInput("jitter_variable", "Variable?",
                                     choices = c("bill_length_mm",
                                                 "bill_depth_mm",
                                                 "flipper_length_mm",
                                                 "body_mass_g"),
                                     selected = "bill_length_mm"),
                         
                         selectInput("jitter_color_variable", "Should we show multiple across?",
                                     choices = c("species",
                                                 "island",
                                                 "sex"),
                                     selected = "species"),
                     ),
                     mainPanel(
                         p("Paragraph of text about what strip/jitter plots are. I love them."),
                         br(),br(),
                         plotOutput("jitter"),
                     )
                 ) # sidePanelLayout
        ), # tabpanel jitter
        
        ## UI: Barplot tabPanel ----------------------------------------
        tabPanel("Barplots",
                 h4("Great for categorical, but evil for numeric.")
                 ),
        
        ## UI: Scatterplot tabPanel
        tabPanel("Scatterplots",
                 h4("Looking at the relationship between two numeric values. Each point is a single individual penguin."),
                 br(),
                 sidebarLayout(
                     sidebarPanel(
                         selectInput("scatter_x_variable", "X variable?",
                                     choices = c("bill_length_mm",
                                                 "bill_depth_mm",
                                                 "flipper_length_mm",
                                                 "body_mass_g"),
                                     selected = "bill_length_mm"),
                         
                         selectInput("scatter_y_variable", "Y variable?",
                                     choices = c("bill_length_mm",
                                                 "bill_depth_mm",
                                                 "flipper_length_mm",
                                                 "body_mass_g"),
                                     selected = "bill_depth_mm"),
                         
                         selectInput("scatter_color_style", "Color the points?",
                                     choices = c("Single color",
                                                 "Color based on another variable"),
                                     selected = "Single color"
                                     ),
                         conditionalPanel("input.scatter_color_style != 'Single color'",
                                          { 
                                              selectInput("scatter_color_variable", "what variable?",
                                                          choices = c("bill_length_mm",
                                                                      "bill_depth_mm",
                                                                      "flipper_length_mm",
                                                                      "body_mass_g",
                                                                      "species",
                                                                      "island",
                                                                      "sex",
                                                                      "year"),
                                                          selected = "bill_length_mm"
                                              )
                                          }
                         ) # conditionalpanel
                     ), #sidebarpanel
                     mainPanel(
                         p("scatterplots are not strip plots."),
                         br(),br(),
                         plotOutput("scatter")
                         
                     )
                 ) #sidebarlayout
    )
    
    
    
    
    # Sidebar with a slider input for number of bins 
    #sidebarLayout(
    #    sidebarPanel()
    #    mainPanel()
    
))

server <- function(input, output) {

    ## Server: Overview Panel------------------------------------ 
    output$penguin_table <- renderDT({
        datatable(palmerpenguins::penguins, 
                  options = list(rowCallback = JS(rowCallback)))
        
    })
    
    ## Server: Histograms Panel ---------------------------------
    output$histogram <- renderPlot({
        
        ggplot(penguins, aes(x = !!(sym(input$histogram_variable)))) + 
            geom_histogram(binwidth = input$binwidth, fill = "cadetblue", color = "black") + 
            ggtitle(paste0("Histogram of all `", input$histogram_variable, "` values"))
    })

    output$faceted_histogram <- renderPlot({
        
        penguins %>%
            drop_na(!!(sym(input$histogram_facet_variable))) %>%
        ggplot(aes(x = !!(sym(input$histogram_variable)),
                   fill = !!(sym(input$histogram_facet_variable)))) + 
            geom_histogram(binwidth = input$binwidth, color = "black") +
            facet_wrap(vars(!!(sym(input$histogram_facet_variable)))) +
            ggtitle(paste0("Faceted histogram of `", input$histogram_variable, "` values across `", input$histogram_facet_variable, "` values")) +
            scale_fill_brewer(palette = "Set2")
        
        
    })    

    ## Server: Boxplots Panel ---------------------------------
    output$boxplot <- renderPlot({

        ggplot(penguins, aes(x = !!(sym(input$boxplot_x_variable)),
                             y = !!(sym(input$boxplot_y_variable)))) -> p
        
        if (input$boxplot_color_style == "Color each category separately")
        {
            p <- p + geom_boxplot(aes(fill = !!(sym(input$boxplot_x_variable)))) +
                        theme(legend.position = "none") +
                        scale_fill_brewer(palette = "Set2") 
        } else {
            p <- p + geom_boxplot(fill = input$boxplot_color)
        }
        p + ggtitle(paste0("Boxplot of `", input$boxplot_y_variable, "` values across `", input$boxplot_x_variable, "` values"))
    })
    
    ## Server: Density Panel ---------------------------------
    output$density <- renderPlot({
        ggplot(penguins, aes(x = !!(sym(input$density_variable)))) +
            geom_density(fill = "cadetblue") +
            ggtitle(paste0("Density plot of `", input$density_variable, "` values"))
    })
    
    output$overlapping_density <- renderPlot({
        penguins %>%
            drop_na(!!(sym(input$density_fill_variable))) %>%
            ggplot(aes(x   = !!(sym(input$density_variable)),
                      fill = !!(sym(input$density_fill_variable)) )) +
            geom_density(alpha = 0.8) + 
            scale_fill_brewer(palette = "Set2") +
            ggtitle(paste0("Overlapping density plot of `", input$density_variable, "` values across `", input$density_fill_variable, "` values"))
    })
    
    output$faceted_density <- renderPlot({
        penguins %>%
            drop_na(!!(sym(input$density_fill_variable))) %>%
            ggplot(aes(x   = !!(sym(input$density_variable)),
                       fill = !!(sym(input$density_fill_variable)) )) +
            geom_density() + 
            facet_wrap(vars(!!(sym(input$density_fill_variable)))) +
            scale_fill_brewer(palette = "Set2") +
            ggtitle(paste0("Faceted density plot of `", input$density_variable, "` values across `", input$density_fill_variable, "` values"))
    })
    
    ## Server: Violin Panel ---------------------------------
    output$violin <- renderPlot({
        
        ggplot(penguins, aes(x = !!(sym(input$violin_x_variable)),
                             y = !!(sym(input$violin_y_variable)))) -> p
        
        if (input$violin_color_style == "Color each category separately")
        {
            p <- p + geom_violin(aes(fill = !!(sym(input$violin_x_variable)))) +
                theme(legend.position = "none") +
                scale_fill_brewer(palette = "Set2") 
        } else {
            p <- p + geom_violin(fill = input$violin_color)
        }
        p + ggtitle(paste0("Violin plot of `", input$violin_y_variable, "` values across `", input$violin_x_variable, "` values"))
    })
    
    ## Server: Strip (jitter) Panel ---------------------------------
    output$jitter <- renderPlot({
        penguins %>%
            drop_na(!!(sym(input$jitter_color_variable))) %>%
            ggplot(aes(x = !!(sym(input$jitter_color_variable)),
                       y = !!(sym(input$jitter_variable)),
                       color = !!(sym(input$jitter_color_variable)))) + 
            geom_jitter(width = 0.2, size=2) +
            ggtitle(paste0("Strip/jitter plot of `", input$jitter_variable, "` values across `", input$jitter_color_variable, "` values")) +
            scale_color_brewer(palette = "Set2")
    })    
    
    
    ## Server: Scatterplot ----------------------------------
    output$scatter <- renderPlot({
        penguins %>%
            # just drop it all.....
            drop_na() %>%
            ggplot(aes(x = !!(sym(input$scatter_x_variable)),
                       y = !!(sym(input$scatter_y_variable)))) -> p
        
        if (input$scatter_color_style == "Single color")
        {
            p <- p + geom_point(size = 2, color = "hotpink") 
        } else {
            p <- p + geom_point(size = 2,
                                aes(color = !!(sym(input$scatter_color_variable)))) +
                    theme(legend.text = element_text(angle = 30))
            if (!(input$scatter_color_variable %in% c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"))) p <- p + scale_color_brewer(palette = "Set2") 
        }
        p + ggtitle(paste0("Scatter plot of `", input$scatter_y_variable, "` across `", input$scatter_x_variable, "`"))
    })                           
        
}
  



# Run the application 
shinyApp(ui = ui, server = server)
