#' Description for dplyr::case_when()
#' @noRd
description_case_when <- function()
{
  "The `case_when()` function is part of the {dplyr} package.
  
  We use this function to *recode* a variable to different values. The `case_when()` function can be used when there are more than two conditions for recoding, in which case `if_else()` will be appropriate. Be patient with the `case_when()` syntax: It is tricky! We often use `case_when()` along with `mutate()` to create new data frame columns."
}

#' Conceptual usage for dplyr::case_when()
#' @noRd
conceptual_usage_case_when <- function()
{
  c("case_when(logical statement ~ return this if this statement is TRUE,
              a different logical statement ~ return this if this statement is TRUE,
              yet another logical statement ~ return this if this statement is TRUE,
              (...as many as you need...)
              # optional
              TRUE ~ value to return if condition was not ever met)"
    )
}


#' Examples for base::case_when()
#' @noRd
examples_case_when <- function()
{
  list(
    c(
    "Use case_when to create a new column `penguin_size` that will be 'large' if the body mass is greater or equal to than 4000, 'medium' if body mass is between 3000-4000, and 'small' if body mass is less than or equal to 3000.",
    "penguins %>%
    mutate(penguin_size = case_when(
            body_mass_g >= 4000 ~ 'large',
            body_mass_g > 3000 & body_mass_g < 4000 ~ 'medium',
            body_mass_g <= 3000 ~ 'small')
    )"
    )
  )
}
