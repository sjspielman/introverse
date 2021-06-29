#' Description for base::c()
#' @noRd
description_c <- function()
{
  "The `c()` function comes with R and is part of the {base} package.
  
  We use this function to create arrays. Recall that all values in arrays must have the same type. If you are using colon syntax to create an array (e.g. `1:5` to create an array with values 1,2,3,4,5, you do NOT need to use `c()`."
}

#' Conceptual usage for base::c()
#' @noRd
conceptual_usage_c <- function()
{
  c("c(first value in array, second value in array, etc.)")
}


#' Examples for base::c()
#' @noRd
examples_c <- function()
{
  list(
    c(
    "Define an array with all numeric values as shown",
    "new_array <- c(8, 5, 3, 6, 1, 2, 7, 88)"
    ),
    c(
      "Define an array with all character values as shown",
      "new_array <- c('a', 'e', 'i', 'o', 'u', 'y')"
    )
  )
}
