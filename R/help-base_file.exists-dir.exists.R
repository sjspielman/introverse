#' Description for base::file.exists() and base::dir.exists()
#' @noRd
description_file.exists <- function()
{
  "The `file.exists()` and `dir.exists()` functions come with R and are part of the {base} package.
  
  We use these functions to determine whether a given file (`file.exists()`) or directory aka folder (`dir.exists()`) exists. These functions return either TRUE or FALSE and are useful for double-checking if your paths are correct."
}

#' Conceptual usage for base::file.exists() and base::dir.exists()
#' @noRd
conceptual_usage_file.exists <- function()
{
  c("file.exists('path to file I want to know if exists')",
    "dir.exists('path to directory I want to know if exists')")
}


#' Examples for base::file.exists() and base::dir.exists()
#' @noRd
examples_file.exists <- function()
{
  list(
    c(
    "Define a file path and check if it exists",
    "my_file <- file.path('path', 'to', 'data', 'file.txt') ;    file.exists(my_file)"
    ),
    c(
      "Define a directory path and check if it exists",
      "my_dir <- file.path('..', 'path', 'to', 'directory') ;   dir.exists(my_dir)"
    )
  )
}


#' Description for base::dir.exists()
#' @noRd
description_dir.exists <- function()
{
  description_file.exists()
}


#' Conceptual usage for base::dir.exists()
#' @noRd
conceptual_usage_dir.exists <- function()
{
  conceptual_usage_file.exists()
}


#' Examples for base::dir.exists()
#' @noRd
examples_dir.exists <- function()
{
  examples_file.exists()
}

