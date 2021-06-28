#' Description for dplyr::select
#' @noRd
description_select <- function()
{
  head_space %+%
    "The `select()` function is part of the {dplyr} package.
    It is used to keep, remove, and/or reorder columns in tibbles (data frames). No quotes are needed." 
}


#' Conceptual usage for dplyr::select
#' @noRd
conceptual_usage_select <- function()
{
  c(
    "tibble %>% select(columns, you, want, to, keep)",
    "tibble %>% select(-columns, -you, -want, -to, -remove)"
  )
}


#' Examples for dplyr::select
#' @noRd
examples_select <- function()
{
  list(
    c(
      "Keep only the column `species` from penguins", 
      "penguins %>%
    select(species)"
    ),
    c(
      "Keep only the columns `species` and `bill_depth_mm` (in that order!) from penguins",
      "penguins %>%
    select(species, bill_depth_mm)"
    ),
    c(
      "Remove only the column `species` from penguins",
      "penguins %>%
     select(-species)"
    ),
    c(
      "Remove only the columns `species` and `bill_depth_mm` from penguins",
      "penguins %>%
    select(-species, -bill_depth_mm)"  
    ), 
    c(
      "Reorder the columns so `sex` comes first, followed by everything else, using the helper {tidyselect} function `everything()`",
      "penguins %>%
     select(sex, everything())"
    )    
  )
}