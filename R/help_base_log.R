#' Description for base::log()
#' @noRd
description_log <- function()
{
  "The `log()` function comes with R and is part of the {base} package.
  
  We use this function to calculate the log of a number or numeric array. By default, the function calculates the natural log (base e). Provide a second argument to change the base."
}

#' Conceptual usage for base::log()
#' @noRd
conceptual_usage_log <- function()
{
  c("log(number to get the natural log of)",
    "log(number to get the base x log of, x)",
    "log(numeric array to get natural log of all its values)")
}


#' Examples for base::log()
#' @noRd
examples_log <- function()
{
  list(
    c(
    "Find the natural log of 107",
    "log(107)"
    ),
    c(
      "Find the log of 107 in base 5",
      "log(107, 5)"
    ), 
    c(
      "Find the natural log of all values in an array",
      "log( c(100, 110, 120) )"
    ), 
    c(
      "Find the log in base 2 of all values in an array",
      "log( c(100, 110, 120), 2 )"
    )
  )
}
