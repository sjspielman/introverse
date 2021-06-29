#' Description for utils::head() and utils::tail()
#' @noRd
description_head <- function()
{
  "The `head()` and tail() functions come with R and are part of the {utils} package.
  
  We use these functions quickly to obtain the first (`head()`) or last (`tail()`) 6 rows of a given tibble (data frame), or more generally the first/last 6 entries in any array or list. With a second argument, you can change the default from 6 to a different value."
}

#' Description for utils::tail()
#' @noRd
description_tail <- function()
{
  description_head()
}

#' Conceptual usage for utils::head() and utils::tail()
#' @noRd
conceptual_usage_head <- function()
{
  c("head(tibble)",
    "tail(tibble)"
  )
}

#' Conceptual usage for utils::tail()
#' @noRd
conceptual_usage_tail <- function()
{
  conceptual_usage_head()
}

#' Examples for utils::tail()
#' @noRd
examples_tail <- function()
{
  examples_head()
}

#' Examples for utils::head and utils::tail()
#' @noRd
examples_head <- function()
{
  list(
    c(
    "Get the first 6 rows from penguins",
    "head(penguins)"
    ),
    c(
      "Get the last 6 rows from penguins",
      "tail(penguins)"
    ),
    c(
      "Get the first 3 rows from penguins",
      "head(penguins, 3)"
    )
  )
}
