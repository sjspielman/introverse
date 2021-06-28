#' Description for base::sd()
#' @noRd
description_sd <- function()
{
  "The `sd() function comes with R and is part of the {base} package.
  
  We use this function to calculate the sample standard deviation on arrays or data frame (tibble) columns. By default, `sd()` will not perform calculations if there are NAs in the data. To get around this, use the *second argument* `na.rm = TRUE` when using these functions."
}

#' Conceptual usage for base::sd()
#' @noRd
conceptual_usage_sd <- function()
{
  c("sd(an array you want to know the standard deviation of)",
    "sd(an array with NAs you want to know the standard deviation of, na.rm = TRUE)")
}


#' Examples for base::sd()
#' @noRd
examples_sd <- function()
{
  list(
    c(
    "Find the standard deviation of an array directly",
    "sd( c(44, 55, 66) )"
    ),
    c(
      "Find the standard deviation of an array which has been defined as a variable",
      "my_array <- c(44, 55, 66); sd(my_array)"
    ),
    c(
      "Find the standard deviation of an array with NAs",
      "sd(c(44, 55, NA, 66), na.rm = TRUE)"
    )
  )
}
