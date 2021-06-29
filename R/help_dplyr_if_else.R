#' Description for dplyr::if_else()
#' @noRd
description_if_else <- function()
{
  "The `if_else()` function is part of the {dplyr} package.
  
  We use this function to assign a value based on whether a logical statement is TRUE or FALSE. The provided values must be of the same type! Note that there is a {base} version of this function `dplyr::ifelse()` (without an underscore!) that can be used in exactly the same way, but the {base} version does not enforce that the result is always the same type."
}

#' Conceptual usage for dplyr::if_else()
#' @noRd
conceptual_usage_if_else <- function()
{
  c("if_else(logical statement, value if statement is `TRUE`, value if statement is `FALSE`)")
}


#' Examples for base::if_else()
#' @noRd
examples_if_else <- function()
{
  list(
    c(
    "Return the value 5 if it is TRUE that 10 < 4. Otherwise, return the value 7.",
    "if_else(10 < 4, 5, 7)"
    ),
    c(
      "Return the value 5 if it is TRUE that 10 < 100. Otherwise, return the value 'string'. This code will result in an ERROR since 5 is a number but 'string' is character (different types!)",
      "if_else(10 < 100, 5, 'string')"
    ), 
    c(
      "Use if_else to create a new column `penguin_size` that will be 'large' if the body mass is greater than 2500, and 'small' if body mass is less than or equal to 2500.",
      "penguins %>%
      mutate(penguin_size = if_else(body_mass_g > 2500, 'large', 'small'))"
    )
  )
}
