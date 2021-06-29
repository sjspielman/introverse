#' Description for dplyr::pull
#' @noRd
description_pull <- function()
{
  "The `pull()` function is part of the {dplyr} package.
  It is used to 'pull out' a given column into its own array. It's like using the `$` to access a column except with some {tidyverse} style for use with piping."
}


#' Conceptual usage for dplyr::pull
#' @noRd
conceptual_usage_pull <- function()
{
  c("tibble %>% pull(column you want to pull out as array)")
}

#' Examples for dplyr::pull
#' @noRd
examples_pull <- function()
{
  list(
    c(
      "Pull out the species column from penguins as its own array", 
      "penguins %>%
      pull(species)"
    )
  )
}