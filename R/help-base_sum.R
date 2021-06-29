#' Description for base::sum()
#' @noRd
description_sum <- function()
{
  "The `sum() function comes with R and is part of the {base} package.
  
  We use this function to calculate the sum of all values in a numeric value of an array or data frame (tibble) column. By default, `sum()` will not perform calculations if there are NAs in the data. To get around this, use the *second argument* `na.rm = TRUE` when using these functions."
}

#' Conceptual usage for base::sum()
#' @noRd
conceptual_usage_sum <- function()
{
  c("sum(an array you want to know the sum value of)",
    "sum(an array with NAs you want to know the sum value of, na.rm = TRUE)")
}


#' Examples for base::sum()
#' @noRd
examples_sum <- function()
{
  list(
    c(
    "Find the sum of an array directly",
    "sum( c(44, 55, 66) )"
    ),
    c(
      "Find the sum value of an array which has been defined as a variable",
      "my_array <- c(44, 55, 66); sum(my_array)"
    ),
    c(
      "Find the sum value of an array with NAs",
      "sum(c(44, 55, NA, 66), na.rm = TRUE)"
    )
  )
}
