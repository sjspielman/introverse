#' Description for dplyr::glimpse
#' @noRd
description_glimpse <- function()
{
  "The `glimpse()` function is part of the {dplyr} package.
  It is used to view a content overview of a tibble (data frames)."
}


#' Conceptual usage for dplyr::glimpse
#' @noRd
conceptual_usage_glimpse <- function()
{
  c("glimpse(tibble)")
}

#' Examples for dplyr::glimpse
#' @noRd
examples_glimpse <- function()
{
  list(
    c(
      "glimpse at the penguins dataset", 
      "glimpse(penguins)"
    )
  )
}