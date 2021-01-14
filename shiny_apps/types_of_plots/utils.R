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
default_color <- "dodgerblue"