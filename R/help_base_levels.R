#' Description for base::levels()
#' @noRd
description_levels <- function()
{
  "The `levels()` function comes with R and is part of the {base} package.
  
  We use this function to find the levels, aka ordered categories, of a factor variable. If the provided argument is not a factor, the result will be NULL."
}

#' Conceptual usage for base::levels()
#' @noRd
conceptual_usage_levels <- function()
{
  c("levels(factor variable)")
}


#' Examples for base::levels()
#' @noRd
examples_levels <- function()
{
  list(
    c(
    "Find the levels of the `species` factor column in penguins",
    "levels(penguins$species)"
    ),
    c(
    "Trying to find the levels of the `bill_length_mm` factor column in penguins results in NULL since the column is not a factor type",
      "levels(penguins$bill_length_mm)"
    )
  )
}
