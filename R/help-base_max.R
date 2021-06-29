#' Description for base::max()
#' @noRd
description_max <- function()
{
  "The `max() function comes with R and is part of the {base} package.
  
  We use this function to calculate the maximum value of an array or data frame (tibble) columns. By default, `max()` will not perform calculations if there are NAs in the data. To get around this, use the *second argument* `na.rm = TRUE` when using these functions."
}

#' Conceptual usage for base::max()
#' @noRd
conceptual_usage_max <- function()
{
  c("max(an array you want to know the maximum value of)",
    "max(an array with NAs you want to know the maximum value of, na.rm = TRUE)")
}


#' Examples for base::max()
#' @noRd
examples_max <- function()
{
  list(
    c(
    "Find the maximum value of an array directly",
    "max( c(44, 55, 66) )"
    ),
    c(
      "Find the maximum value of an array which has been defined as a variable",
      "my_array <- c(44, 55, 66); max(my_array)"
    ),
    c(
      "Find the maximum value of an array with NAs",
      "max(c(44, 55, NA, 66), na.rm = TRUE )"
    )
  )
}
