#' Description for base::nchar()
#' @noRd
description_nchar <- function()
{
  "The `nchar()` functions comes with R and is part of the {base} package.
  
  We use this function to determine the how many characters (Number of CHARacters) in a string."
}

#' Conceptual usage for base::nchar()
#' @noRd
conceptual_usage_nchar <- function()
{
  c("nchar(a string in which you want to know how many characters there are")
}


#' Examples for base::nchar()
#' @noRd
examples_nchar <- function()
{
  list(
    c(
    "Find the number of characters in a string directly",
    "nchar('word')"
    ),
    c(
      "Find the number of characters in a string with multiple words",
      "nchar('This is a whole sentence.')"
    ),
    c(
      "Find the number of characters in a string that was previously defined as a variable.",
      "my_string <- 'heyo!'; length(my_string)"
    )
  )
}
