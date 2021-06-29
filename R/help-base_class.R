#' Description for base::class()
#' @noRd
description_class <- function()
{
  "The `class()` function comes with R and is part of the {base} package.
  
  We use this function to what type of values are in an object, i.e. is the value a numeric, logical, character, etc."
}

#' Conceptual usage for base::class()
#' @noRd
conceptual_usage_class <- function()
{
  c("class(variable or value)")
}


#' Examples for base::class()
#' @noRd
examples_class <- function()
{
  list(
    c(
    "Find the type of the value 5",
    "class(5)"
    ),
    c(
      "Find the type of the value 'this is a string'",
      "class('this is a string')"
    ),
    c(
      "Find the type of a previously defined variable",
      "x <- 75.5; class(x)"
    )
  )
}
