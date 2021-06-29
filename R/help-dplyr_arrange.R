
#' Description for dplyr::arrange
#' @noRd
description_arrange <- function()
{
  head_space %+%
    "The `arrange()` function is part of the {dplyr} package.
    It is used to arrange tibble rows in ascending order of the given column. To arrange by descending order, you need to use `desc()` around your column argument."
}

#' Conceptual usage for dplyr::arrange
#' @noRd
conceptual_usage_arrange <- function()
{
  c(
    "tibble %>% arrange(column to sort by in ascending order)",
    "tibble %>% arrange( desc(column to sort by in descending order) )"
  )
}

#' Examples for dplyr::arrange
#' @noRd
examples_arrange <- function()
{
  list(
    c(
      "Arrange in ascending alphabetal order of island", 
      "penguins %>%
      arrange(island)"
    ),
    c(
      "Arrange in descending alphabetal order of island", 
      "penguins %>%
      arrange(desc(island))"
    ),
    c(
      "Arrange in ascending order of flipper length", 
      "penguins %>%
      arrange(flipper_length_mm)"
    ),
    c(
      "Arrange in descending order of flipper length", 
      "penguins %>%
      arrange(desc(flipper_length_mm))"
    )
  )
}
