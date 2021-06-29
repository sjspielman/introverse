#' Description for utils::nrow() and utils::ncol()
#' @noRd
description_nrow <- function()
{
  "The `nrow()` and ncol() functions come with R and are part of the {base} package.
  
  We use these functions to get the number of rows (`nrow()`) or columns (`ncol()`) of an object, commonyl a data frame."
}

#' Description for utils::ncol()
#' @noRd
description_ncol <- function()
{
  description_nrow()
}

#' Conceptual usage for utils::nrow() and utils::ncol()
#' @noRd
conceptual_usage_nrow <- function()
{
  c("nrow(tibble)",
    "ncol(tibble)"
  )
}

#' Conceptual usage for utils::ncol()
#' @noRd
conceptual_usage_ncol <- function()
{
  conceptual_usage_nrow()
}

#' Examples for utils::ncol()
#' @noRd
examples_ncol <- function()
{
  examples_nrow()
}

#' Examples for utils::nrow and utils::ncol()
#' @noRd
examples_nrow <- function()
{
  list(
    c(
    "Get the number of rows in penguins",
    "nrow(penguins)"
    ),
    c(
      "Get the number of columns in penguins",
      "ncol(penguins)"
    )
  )
}
