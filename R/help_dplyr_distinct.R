#' Description for dplyr::distinct
#' @noRd
description_distinct <- function()
{
  "The `distinct()` function is part of the {dplyr} package.
  It is used to remove duplicate rows from tibbles (data frames). Only distinct rows are retained. No arguments needed!"
}


#' Conceptual usage for dplyr::distinct
#' @noRd
conceptual_usage_distinct <- function()
{
  c("tibble %>% distinct()")
}

#' Examples for dplyr::distinct
#' @noRd
examples_distinct <- function()
{
  list(
    c(
      "Remove duplicate rows from penguins", 
      "penguins %>%
      distinct()"
    )
  )
}