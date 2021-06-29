# NOTE: the function `as()` itself is not documented here!! ---------

# as.factor() -------------------------

#' Description for base::as.factor()
#' @noRd
description_as.factor <- function()
{
  "The `as.factor()` function comes with R and is part of the {base} package.
  
  This function is used to coerce a variable to be a factor, i.e. change the variable's type into a factor type."
}

#' Conceptual usage for base::as.factor()
#' @noRd
conceptual_usage_as.factor <- function()
{
  c("as.factor(variable or value you want to be a factor)")
}


#' Examples for base::as.factor()
#' @noRd
examples_as.factor <- function()
{
  list(
    c(
    "Convert the array to a factor array",
    'as.factor( c("a", "b", "b", "c", "c", "c") )'
    ),
    c(
      "Coerce the `year` column in penguins to be a factor",
      "penguins %>%
      mutate(year = as.factor(year))"
    )
  )
}


# as.numeric() -----------------------------------------

#' Description for base::as.numeric()
#' @noRd
description_as.numeric <- function()
{
  "The `as.numeric()` function comes with R and is part of the {base} package.
  
  This function is used to coerce a value or variable to be a numeric, i.e. change the variable's type into a numeric type. Not all values can be changed to numeric, and this function will return NA if the value could not be coerced"
}

#' Conceptual usage for base::as.numeric()
#' @noRd
conceptual_usage_as.numeric <- function()
{
  c("as.numeric(variable or value you want to be a numeric)")
}


#' Examples for base::as.numeric()
#' @noRd
examples_as.numeric <- function()
{
  list(
    c(
      "Convert the string '10' the a number 10",
      "as.numeric('10')"
    ),
    c(
      "This example will return NA since there is no natural way to convert the word 'string' into a number.",
      "as.numeric('string')"
    ),
    c(
      "The logical `TRUE` turns into 1 when coerced to be a number. This is consistent across all programming languages that allow coersion.",
      "as.numeric(TRUE)"
    ),
    c(
      "The logical `FALSE` turns into 0 when coerced to be a number. This is consistent across all programming languages that allow coersion)",
      "as.numeric(FALSE)"
    )
  )
}

# as.character() ----------------------------------

#' Description for base::as.character()
#' @noRd
description_as.character <- function()
{
  "The `as.character()` function comes with R and is part of the {base} package.
  
  This function is used to coerce a value or variable to be a character, i.e. change the variable's type into a character type. "
}

#' Conceptual usage for base::as.character()
#' @noRd
conceptual_usage_as.character <- function()
{
  c("as.character(variable or value you want to be a character)")
}


#' Examples for base::as.character()
#' @noRd
examples_as.character <- function()
{
  list(
    c(
      "Convert the number 10 into the string '10'",
      "as.character(10)"
    ),
    c(
      "Convert the logical value `TRUE` (no quotes!) into a string containing the literal letters (in quotes!) 'TRUE'.",
      "as.character(TRUE)"
    )
  )
}


