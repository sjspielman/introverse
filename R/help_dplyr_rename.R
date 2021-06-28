
#' Description for dplyr::rename
#' @noRd
description_rename <- function()
{
  "The `rename()` function is part of the {dplyr} package.
  It is useful for quickly renaming columns in tibbles (data frames). No quotes are needed."
}


#' Conceptual usage for dplyr::rename
#' @noRd
conceptual_usage_rename  <- function()
{
  c("tibble %>% rename(new column name = old colunm name)")
}


#' Examples for dplyr::rename
#' @noRd
examples_rename <- function()
{
  list(
    c(
      "Rename the `species` column to the new name `penguin_species`", 
      "penguins %>%
      rename(penguin_species = species)"
    ),
    c(
      "Rename the `species` column to `penguin_species`, and rename the `flipper_length_mm` column to `flipper`", 
      "penguins %>%
      rename(penguin_species = species,
        flipper = flipper_length_mm)"
    )
  ) 
}