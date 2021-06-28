#' Description for base::length()
#' @noRd
description_length <- function()
{
  "The `length()` functions comes with R and is part of the {base} package.
  
  We use this function to determine the length of an object, most commonly of array or list objects. Note that this function WILL NOT tell you the length of a string."
}

#' Conceptual usage for base::length()
#' @noRd
conceptual_usage_length <- function()
{
  c("length(an array or variable you want to know the length of")
}


#' Examples for base::length()
#' @noRd
examples_length <- function()
{
  list(
    c(
    "Find the length of an array directly",
    "length( c(44, 55, 66) )"
    ),
    c(
      "Find the length of an array which has been defined as a variable",
      "my_array <- c(44, 55, 66); length(my_array)"
    )
  )
}
