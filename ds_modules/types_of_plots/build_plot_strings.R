# Functions to build plot strings


build_scatter_string <- function(args)
{

  if (args$color_style == color_choices[1])
  {
    glue::glue("ggplot(penguins, aes(x = {args$x},
                                     y = {args$y})) + 
    ") -> plot_string
  } else {
    glue::glue("ggplot(penguins, aes(x = {args$x},
                                     y = {args$y},
                                     color = {args$colorby})) + 
    ") -> plot_string
   
  }  

  
  
  if (args$color_style == color_choices[1])
  {
    glue::glue(
      plot_string,
      "
    geom_point(color = {args$color},
               size  = 2) + 
      ") -> plot_string    
  } else {
    glue::glue(
      plot_string,
      "
    geom_point(size  = 2) + 
    ") -> plot_string       
  }
  if (args$regression == regression_choices[1])
  {
    glue::glue(
      plot_string,
      "
      geom_smooth(method = 'lm') + 
      ") -> plot_string
  } 
  glue::glue(
    plot_string,
    "
      labs(title    = {args$title},
         subtitle = {args$subtitle}) + 
      theme(legend.text = element_text(size = rel(0.9)))") -> plot_string
  plot_string
}


build_barplot_string <- function(args)
{
  glue::glue(
    "penguins %>%
          # Remove potential NAs for demonstrating visualization
          drop_na({args$x}) %>%
          ggplot(aes(x = {args$x})) + 
              geom_bar(fill = {args$fill}, color = 'black') +
              labs(title = {args$title_single})") -> single


  glue::glue(
    "penguins %>%
          # Remove potential NAs for demonstrating visualization
          drop_na({args$x}, {args$fillby}) %>%
          ggplot(aes(x = {args$x},
                     fill = {args$fillby})) +
    ") -> double
  
  if (args$position == position_choices[1])
  {
    glue::glue(
      double, 
      "
        geom_bar(color = 'black',
                 position = position_dodge(preserve = 'single')) +
        labs(title = {args$title_double})"
    ) -> double
  } else {
    glue::glue(
      double, 
      "
        geom_bar(color = 'black') +
        labs(title = {args$title_double})"
    ) -> double   
  }
  glue::glue(
    "penguins %>%
     drop_na(flipper_length_mm, species) %>%
     group_by(species) %>%
     summarize(mean_flipper = mean(flipper_length_mm), 
               sd_flipper   = sd(flipper_length_mm)) %>%
     ggplot(aes(x    = species, 
                y    = mean_flipper, 
                fill = species)) + 
     geom_col(color = 'black') + 
     geom_errorbar(aes(ymax = mean_flipper + sd_flipper/2, 
                       ymin =  mean_flipper - sd_flipper/2), 
                   width = 0.05, size=1) + 
     ylab('Mean +/- SD of flipper length (mm)') + 
     theme(axis.title.y = element_text(size=12))") -> errorbar
  
  list("single" = single, 
       "double" = double,
       "errorbar" = errorbar)
}


build_sina_string <- function(args)
{
  plot_string <- glue::glue(
    "penguins %>%
            # Remove potential NAs for demonstrating visualization
            drop_na({args$x}) %>%
            ggplot(aes(x = {args$x},
                       y = {args$y})) +
    ") 
  
  if (args$color_style == color_choices[1])
  {
    plot_string <- glue::glue(
      plot_string, 
      "
          geom_sina(color = {args$color},
                    size  = 2) + 
      ")
  } else {
    plot_string <- glue::glue(
      plot_string, 
      "
          geom_sina(color = {args$x},
                    size  = 2) + 
      ")
  }
  plot_string <- glue::glue(
    plot_string, 
    "
    labs(title = {args$title})"
  )
  plot_string
}


build_jitter_string <- function(args)
{
  
  if (args$jitter_setting == jitter_choices[1])
  {
    geom <- "geom_jitter("
  } else {
    geom <- "geom_point("
    
  }
  plot_string <- glue::glue(
    "penguins %>%
            # Remove potential NAs for demonstrating visualization
            drop_na({args$x}) %>%
            ggplot(aes(x = {args$x},
                       y = {args$y})) +
    ") 
  
  if (args$color_style == color_choices[1])
  {
    plot_string <- glue::glue(
      plot_string, 
      "
          {geom}color = {args$color}, 
                      size  = 2, 
                      width = 0.2) + 
      ")
  } else {
    plot_string <- glue::glue(
      plot_string, 
      "
          {geom}aes(color = {args$x}),
                      size = 2,
                      width = 0.2) + 
      ")
  }
  plot_string <- glue::glue(
    plot_string, 
    "
    labs(title = {args$title})"
  )
  plot_string
}


build_boxplot_violin_string <- function(args, geom)
{
  plot_string <- glue::glue(
    "penguins %>%
            # Remove potential NAs for demonstrating visualization
            drop_na({args$x}) %>%
            ggplot(aes(x = {args$x},
                       y = {args$y})) +
    ") 

  if (args$color_style == color_choices[1])
  {
    plot_string <- glue::glue(
      plot_string, 
      "
          {geom}(fill = {args$fill}) + 
      ")
  } else {
    plot_string <- glue::glue(
      plot_string, 
      "
          {geom}(aes(fill = {args$x})) + 
      ")
  }
  plot_string <- glue::glue(
    plot_string, 
    "
    labs(title = {args$title})"
  )
  plot_string
}

build_histogram_string <- function(args)
{

  # single
  glue::glue("ggplot(penguins, aes(x = {args$x})) + 
                      geom_histogram(binwidth = {args$binwidth}, fill = {args$fill}, color = 'black') +
                      labs(title    = {args$title_single},
                           subtitle = {args$sub_single})") -> single
  
  # faceted
  faceted <- glue::glue(
    "penguins %>%
            # Remove potential NAs for demonstrating visualization
            drop_na({args$facet}) %>%
            ggplot(aes(x = {args$x})) +
          "
  )
  
  if (args$color_style == color_choices[1])
  {
    
    faceted <- glue::glue(
      faceted, 
      "
        geom_histogram(fill     = {args$fill},
                       color    = 'black',
                       binwidth = {args$binwidth}) + 
             ")
  } else {
    faceted <- glue::glue(
      faceted, 
      "
        geom_histogram(aes(fill = {args$facet}),
                       color    = 'black', 
                       binwidth = {args$binwidth}) +
            ")
  }
  
  faceted <- glue::glue(
    faceted, 
    "  
      facet_wrap(vars({args$facet})) +
      labs(title = {args$title_faceted},
           subtitle = {args$sub_faceted}) + 
      theme(axis.text.x = element_text(size = rel(0.8)))")
  
  list("single" = single,
       "faceted" = faceted)

}

build_density_string <- function(args)
{
  
 
  # single
  glue::glue("ggplot(penguins, aes(x = {args$x})) + 
                      geom_density(fill = {args$fill}) +
                      labs(title    = {args$title_single},
                           subtitle = {args$sub_single})") -> single

  # overlapping
  glue::glue(
    "penguins %>%
            # Remove potential NAs for demonstrating visualization
            drop_na({args$fillby}) %>%
            ggplot(aes(x    = {args$x},
                       fill = {args$fillby})) +
              geom_density(alpha = 0.7) +
              labs(title = {args$title_overlapping},
                   subtitle = {args$sub_overlapping})"
  ) -> overlapping  

  # faceted
  glue::glue(
    "penguins %>%
            # Remove potential NAs for demonstrating visualization
            drop_na({args$fillby}) %>%
            ggplot(aes(x    = {args$x},
                       fill = {args$fillby})) +
              geom_density() +
              facet_wrap(vars({args$fillby})) +
              labs(title = {args$title_faceted},
                 subtitle = {args$sub_faceted})"
  ) -> faceted  
  

  list("single" = single,
       "overlapping" = overlapping,
       "faceted" = faceted)
  
}