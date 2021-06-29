# mean -------------------------------------

#' Description for base::mean()
#' @noRd
description_mean <- function()
{
  "The `mean() function comes with R and is part of the {base} package.
  
  We use this function to calculate the arthimetic mean on arrays or data frame (tibble) columns. By default, `mean()` will not perform calculations if there are NAs in the data. To get around this, use the *second argument* `na.rm = TRUE` when using these functions."
}

#' Conceptual usage for base::mean()
#' @noRd
conceptual_usage_mean <- function()
{
  c("mean(an array you want to know the mean of)",
    "mean(an array with NAs you want to know the mean of, na.rm = TRUE)")
}


#' Examples for base::mean()
#' @noRd
examples_mean <- function()
{
  list(
    c(
    "Find the mean of an array directly",
    "mean( c(44, 55, 66) )"
    ),
    c(
      "Find the mean of an array which has been defined as a variable",
      "my_array <- c(44, 55, 66); mean(my_array)"
    ),
    c(
      "Find the mean of an array with NAs",
      "mean(c(44, 55, NA, 66), na.rm = TRUE)"
    )
  )
}
