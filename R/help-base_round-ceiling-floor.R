# Floor and ceiling --------------------------------------


#' Description for base::ceiling() and base::floor()
#' @noRd
description_ceiling <- function()
{
  "The `ceiling()` and `floor()` functions come with R and is part of the {base} package.
  
  We use these functions to round decimals up (`ceiling()`) or down (`floor()`) to the closest integer."
}


#' Conceptual usage for base::ceiling() and base::floor()
#' @noRd
conceptual_usage_ceiling <- function()
{
  c("ceiling(a decimal number to round up)",
    "floor(a decimal number to round down)"
  )
}



#' Examples for base::ceiling() and base::floor()
#' @noRd
examples_ceiling <- function()
{
  list(
    c(
    "Round up the number 5.35 to the nearest integer, 6",
    "ceiling(5.35)"
    ),
    c(
      "Round down the number 5.35 to the nearest integer, 5",
      "floor(5.35)"
    )
  )
}


#' Conceptual usage for base::floor()
#' @noRd
conceptual_usage_floor <- function()
{
  conceptual_usage_ceiling()
}

#' Description for base::floor()
#' @noRd
description_floor <- function()
{
  description_ceiling()
}

#' Examples for base::floor()
#' @noRd
examples_floor<- function()
{
  examples_ceiling()
}



# Round --------------------------------------


#' Description for base::round()
#' @noRd
description_round <- function()
{
  "The `round()` function comes with R and is part of the {base} package.
  
  We use this function round numbers to a certain number of decimal places. Recall that all values in arrays must have the same type. If you are using colon syntax to create an array (e.g. `1:5` to create an array with values 1,2,3,4,5, you do NOT need to use `round()`."
}

#' Conceptual usage for base::round()
#' @noRd
conceptual_usage_round <- function()
{
  c("round(a number to round, number of digits to round to)",
    "round(c(a, numeric, array, to, round), number of digits to round to)"
  )
}


#' Examples for base::round()
#' @noRd
examples_round <- function()
{
  list(
    c(
      "Round the number 5.355266335 to 2 digits",
      "round(5.355266335, 2)"
    ),
    c(
      "Round all values in the array to 3 digits",
      "round(c(3.55511, 6.2351, 7.29313515327, 34.25362651347320), 3)"
    )
  )
}

