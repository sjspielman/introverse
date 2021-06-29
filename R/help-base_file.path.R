#' Description for base::file.path()
#' @noRd
description_file.path <- function()
{
  "The `file.path()` function comes with R and is part of the {base} package.
  
  We use this function to write paths to files or directories (even though it's called `file.path()`!), in a way where the path is guaranteed to work on any type of computer."
}

#' Conceptual usage for base::file.path()
#' @noRd
conceptual_usage_file.path <- function()
{
  c("file.path('component', 'of', 'path', 'to', 'thing', 'of', 'interest')")
}


#' Examples for base::file.path()
#' @noRd
examples_file.path <- function()
{
  list(
    c(
    "Format path to a file that lives in the relative path 'path/to/data/file.txt'",
    "file.path('path', 'to', 'data', 'file.txt')"
    ),
    c(
      "Format path to a file that lives in the relative path '../path/to/data/file.txt'",
      "file.path('..', 'path', 'to', 'data', 'file.txt')"
    ),
    c(
      "Format path to directory at the relative path '../../path/to/data/'",
      "file.path('..', '..', 'path', 'to', 'data')"
    )
  )
}
