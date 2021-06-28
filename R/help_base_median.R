#' Description for base::median()
#' @noRd
description_median <- function()
{
  "The `median() function comes with R and is part of the {base} package.
  
  We use this function to calculate the arthimetic median on arrays or data frame (tibble) columns. By default, `median()` will not perform calculations if there are NAs in the data. To get around this, use the *second argument* `na.rm = TRUE` when using these functions."
}

#' Conceptual usage for base::median()
#' @noRd
conceptual_usage_median <- function()
{
  c("median(an array you want to know the median of)",
    "median(an array with NAs you want to know the median of, na.rm = TRUE)")
}


#' Examples for base::median()
#' @noRd
examples_median <- function()
{
  list(
    c(
    "Find the median of an array directly",
    "median( c(44, 55, 66) )"
    ),
    c(
      "Find the median of an array which has been defined as a variable",
      "my_array <- c(44, 55, 66); median(my_array)"
    ),
    c(
      "Find the median of an array with NAs",
      "median(c(44, 55, NA, 66), na.rm = TRUE )"
    )
  )
}
