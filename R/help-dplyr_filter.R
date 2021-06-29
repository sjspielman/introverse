#' Description for dplyr::filter
#' @noRd
description_filter <- function()
{
  head_space %+%
    "The `filter()` function is part of the {dplyr} package.
  
  It is used to subset rows from tibbles (data frames). Rows are kept if the given logical statement (code that gives `TRUE` or `FALSE`) is `TRUE`. Use this function if you only want to keep certain rows, aka certain observations."
}

#' Conceptual usage for dplyr::filter
#' @noRd
conceptual_usage_filter <- function()
{
  c(
    "tibble %>% filter(logical statement)",
    "tibble %>% filter(logical statement, another logical statement)"
  )
}



#' Examples for dplyr::filter
#' @noRd
examples_filter <- function()
{
  list(
    c(
      "Subset to only 'Gentoo' Species (rows where it is TRUE that species == 'Gentoo')", 
      "penguins %>%
      filter(species == 'Gentoo')"
    ),
    c(
      "Subset to penguins whose bill lengths are greater than 45 mm",
      "penguins %>%
      filter(bill_length_mm > 45)"
    ),
    c(
      "Subset to Gentoo penguins from the island Biscoe",
      "penguins %>%
      filter(species == 'Gentoo', island == 'Biscoe')"
    )
  )
}