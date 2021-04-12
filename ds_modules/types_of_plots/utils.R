penguins <- palmerpenguins::penguins %>% 
              dplyr::mutate(year = as.factor(year))

numeric_choices <- c("bill_length_mm",
                     "bill_depth_mm",
                     "flipper_length_mm",
                     "body_mass_g")
discrete_choices <- c("species",
                      "island", 
                      "sex", 
                      "year")

color_choices <- c("Single color", "Color each category separately")
color_choices_scatter <- c(color_choices[1], "Color points based on a varibble")
position_choices <- c("Side-by-side ('dodged')", "Stacked")
default_color <- "dodgerblue"
jitter_choices <- c("Jitter", "No jitter")
regression_choices <- c("Yes", "No")



# Not working for reasons I fail to understand today. Maybe another day I'll see the issue.
# theme_custom <- function()
# {
#   theme_light() %+replace% 
#   theme(
#     axis.text = element_text(size = rel(1.5)),
#     axis.title = element_text(size = rel(1.5)),
#     strip.text = element_text(size = rel(1.5)),
#     strip.background = element_rect(fill = "grey30"),
#     plot.title = element_text(size = rel(1.5)),
#     legend.key.size = unit(1, "cm"),
#     legend.text = element_text(size = rel(1.5)),
#     legend.title = element_text(size = rel(1.5)),
#     legend.position = "bottom"
#   )
# }

theme_custom_string <- glue::glue(
  'theme_set(
    theme_light() +
      theme(
        axis.text = element_text(size = rel(1.5)),
        axis.title = element_text(size = rel(1.5)),
        strip.text = element_text(size = rel(1.5)),
        strip.background = element_rect(fill = "grey30"),
        plot.title = element_text(size = rel(1.5)),
        legend.key.size = unit(1, "cm"),
        legend.text = element_text(size = rel(1.5)),
        legend.title = element_text(size = rel(1.5)),
        legend.position = "bottom"
    )
  )'
)
