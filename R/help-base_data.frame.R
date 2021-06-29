#' Description for base::data.frame()
#' @noRd
description_data.frame <- function()
{
  "The `data.frame()` function comes with R and is part of the {base} package.
  
  We use this function to create new data frames. Note that we can also directly create tibbles with the {tibble} functions `tibble()` or `tribble()` as different but related strategies."
}

#' Conceptual usage for base::data.frame()
#' @noRd
conceptual_usage_data.frame <- function()
{
  c("new_data_frame <- data.frame(first_column_name_no_quotes_needed  = values for first column,
                                  second_column_name_no_quotes_needed = values for second column,
                                  ...etc for more columns...)")
}


#' Examples for base::data.frame()
#' @noRd
examples_data.frame <- function()
{
  list(
    c(
    "Define a data frame with two columns `a` and `b`, making sure the values for a and b columns have the same length. ",
    "new_df <- data.frame(a = 1:6, b = c('a', 'e', 'i', 'o', 'u', 'y') )"
    )
  )
}
