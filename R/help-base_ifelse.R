#' Description for base::ifelse()
#' @noRd
description_ifelse <- function()
{
  "The `ifelse()` function comes with R and is part of the {base} package.
  
  We use this function to assign a value based on whether a logical statement is TRUE or FALSE. Note that there is a {dplyr} version of this function `dplyr::if_else()` (with an underscore!) that can be used in exactly the same way, but the {dplyr} version enforces that the result is always the same type."
}

#' Conceptual usage for base::ifelse()
#' @noRd
conceptual_usage_ifelse <- function()
{
  c("ifelse(logical statement, value if statement is `TRUE`, value if statement is `FALSE`)")
}


#' Examples for base::ifelse()
#' @noRd
examples_ifelse <- function()
{
  list(
    c(
    "Return the value 5 if it is TRUE that 10 < 4. Otherwise, return the value 7.",
    "ifelse(10 < 4, 5, 7)"
    ),
    c(
      "Return the value 5 if it is TRUE that 10 < 100. Otherwise, return the value 'string'. This will *not work* with the {dplyr} version `if_else()` since 5 is a number but 'string' is character (different types!)",
      "ifelse(10 < 100, 5, 'string')"
    ), 
    c(
      "Use ifelse to create a new column `penguin_size` that will be 'large' if the body mass is greater than 2500, and 'small' if body mass is less than or equal to 2500.",
      "penguins %>%
      mutate(penguin_size = ifelse(body_mass_g > 2500, 'large', 'small'))"
    )
  )
}
