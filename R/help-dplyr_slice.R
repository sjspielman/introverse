#' Description for dplyr::slice
#' @noRd
description_slice <- function()
{
  head_space %+%
    "The `slice()` function is part of the {dplyr} package. 
    It is used to subset tibble rows based on indices, aka which row it is in the tibble (data frame)."
}

#' Conceptual usage for dplyr::slice
#' @noRd
conceptual_usage_slice <- function()
{
  c(
    "tibble %>% slice(range or index of row(s) to keep)",
    "tibble %>% slice(which, row, numbers, to, keep)",
    "tibble %>% slice(-which, -row, -numbers, -to, -remove)"
  )
}



#' Examples for dplyr::slice
#' @noRd
examples_slice <- function()
{
  list(
    c(
      "Keep only the 3rd row from penguins", 
      "penguins %>%
      slice(3)"
    ),
    c(
      "Keep only rows 1, 4, and 8 from penguins", 
      "penguins %>%
      slice(1, 4, 8)"
    ),
    c(
      "Keep only the first 15 rows from penguins", 
      "penguins %>%
      slice(1:15)"
    ),
    c(
      "Remove the first two rows from penguins", 
      "penguins %>%
      slice(-(1:2))"
    )
  )
}
