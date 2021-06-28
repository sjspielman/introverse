#' Description for base::summary()
#' @noRd
description_summary <- function()
{
  "The `summary()` functions comes with R and is part of the {base} package.
  
  We use this function to generally summarize objects. Most commonly, we want to summarize objects like tibbles/data frames, arrays, and statistical model output."
}

#' Conceptual usage for base::summary()
#' @noRd
conceptual_usage_summary <- function()
{
  c("summary(an object to summarize")
}


#' Examples for base::summary()
#' @noRd
examples_summary <- function()
{
  list(
    c(
    "Summarize the penguins data frame",
    "summary(penguins)"
    )
  )
}
