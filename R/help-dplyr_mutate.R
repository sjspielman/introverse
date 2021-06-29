#' Description for dplyr::mutate
#' @noRd
description_mutate <- function()
{
  head_space %+%
    "The `mutate()` function is part of the {dplyr} package.
    It is used to create new columns in tibbles (data frames)."
}

#' Conceptual usage for dplyr::mutate
#' @noRd
conceptual_usage_mutate  <- function()
{
  c("tibble %>% mutate(name_of_new_column = what to put in new column)", 
    "tibble %>% mutate(new column 1 = what to put in new column, new column 2 = what to put in this new column)"
    )
}



#' Examples for dplyr::mutate
#' @noRd
examples_mutate <- function()
{
  list(
    c(
      "Create a new column called `my_new_column` that literally contains the value `5` at all rows", 
      "penguins %>%
      mutate(my_new_column = 5)"
    ),
    c(
      "Create a new column called `bill_length_cm` that contains bill lengths in cm (aka `bill_length_mm` values divided by 10)", 
      "penguins %>%
      mutate(bill_length_cm = bill_length_mm / 10)"
    ),
    c(
      "Create two new columns: `flipper_squared` containing the squared values of flipper lengths, and `island_lower` containing the island names all in lowercase", 
      "penguins %>%
      mutate(flipper_squared = flipper_length_mm**2,
        island_lower    =  tolower(island) )"
    ),
    c(
      "Change the `year` column into a factor column. `mutate()` will overwrite columns", 
      "penguins %>%
      mutate(year = as.factor(year))"
    )
  )
}