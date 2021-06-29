#' Description for base::library()
#' @noRd
description_library <- function()
{
  "The `library()` function comes with R and is part of the {base} package.
  
  We use this function to load libraries into the R session. This function will not install libraries for you, which is (usually) done with the {base} R function `install.packages()`."
}

#' Conceptual usage for base::library()
#' @noRd
conceptual_usage_library <- function()
{
  c("library(name of library to load with or without quotes)")
}


#' Examples for base::library()
#' @noRd
examples_library <- function()
{
  list(
    c(
    "Load the viridis library",
    "library(viridis)"
    ),
    c(
      "Load the viridis library, with quotes (equivalent behavior)",
      "library('viridis')"
    )
  )
}
