#' Description for base::sqrt()
#' @noRd
description_sqrt <- function()
{
  "The `sqrt()` functions comes with R and is part of the {base} package.
  
  We use this function to calculate the square root of a number or numeric array."
}

#' Conceptual usage for base::sqrt()
#' @noRd
conceptual_usage_sqrt <- function()
{
  c("sqrt(number to get the square root of)",
    "sqrt(numeric array to get square root of all its values)")
}


#' Examples for base::sqrt()
#' @noRd
examples_sqrt <- function()
{
  list(
    c(
    "Find the square root of 107",
    "sqrt(107)"
    ),
    c(
      "Find the square root of all values in an array",
      "sqrt( c(100, 110, 120) )"
    ),
    c(
      "Find the square root of a previously defined variable",
      "x <- 50; sqrt(x)"
    )
  )
}
