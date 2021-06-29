#' Description for base::getwd() and base::setwd()
#' @noRd
description_getwd <- function()
{
  "The `getwd()` and `setwd()` functions come with R and are part of the {base} package.
  
  We use these functions to retrieve (`getwd()`) or set (`setwd()`) the working directory for an R session. The `getwd()` function does not take arguments (it just tells you the working directory), and the `setwd()` function takes one argument: A path to a directory you want to set as the working directory."
}

#' Conceptual usage for base::getwd() and base::setwd()
#' @noRd
conceptual_usage_getwd <- function()
{
  c("getwd()",
    "setwd('path/to/my/desired/working/directory')")
}


#' Examples for base::getwd() and base::setwd()
#' @noRd
examples_getwd <- function()
{
  list(
    c(
    "Determine the directory you are working in",
    "getwd()"
    ),
    c(
      "Change the working directory to a defined path, using `file.path()` first to construct the path",
      "my_dir <- file.path('path', 'to', 'my', 'preferred', 'working', 'directory') ;   setwd(my_dir)"
    )
  )
}


#' Description for base::setwd()
#' @noRd
description_setwd <- function()
{
  description_getwd()
}


#' Conceptual usage for base::setwd()
#' @noRd
conceptual_usage_setwd <- function()
{
  conceptual_usage_getwd()
}


#' Examples for base::setwd()
#' @noRd
examples_setwd <- function()
{
  examples_getwd()
}

