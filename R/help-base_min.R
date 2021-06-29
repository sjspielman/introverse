#' Description for base::min()
#' @noRd
description_min <- function()
{
  "The `min() function comes with R and is part of the {base} package.
  
  We use this function to calculate the minimum value in arrays or data frame (tibble) columns. By default, `min()` will not perform calculations if there are NAs in the data. To get around this, use the *second argument* `na.rm = TRUE` when using these functions."
}

#' Conceptual usage for base::min()
#' @noRd
conceptual_usage_min <- function()
{
  c("min(an array you want to know the minimum value of)",
    "min(an array with NAs you want to know the minimum value of, na.rm = TRUE)")
}


#' Examples for base::min()
#' @noRd
examples_min <- function()
{
  list(
    c(
    "Find the minimum value of an array directly",
    "min( c(44, 55, 66) )"
    ),
    c(
      "Find the minimum value of an array which has been defined as a variable",
      "my_array <- c(44, 55, 66); min(my_array)"
    ),
    c(
      "Find the minimum value of an array with NAs",
      "min(c(44, 55, NA, 66), na.rm = TRUE)"
    )
  )
}
