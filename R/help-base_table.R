#' Description for base::table()
#' @noRd
description_table <- function()
{
  "The `table()` function comes with R and is part of the {base} package.
  
  This function summarizes counts in categorical variables to quickly make a contingency table. All NAs will be *ignored*."
}

#' Conceptual usage for base::table()
#' @noRd
conceptual_usage_table <- function()
{
  c("table(categorical array)",
    "table(categorical array, another categorical array)")
}


#' Examples for base::table()
#' @noRd
examples_table <- function()
{
  list(
    c(
    "Tabulate penguin species (which itself is a categorical column)",
      "table(penguins$species)"
    ),
    c(
      "Tabulate combinations of penguin species and sex, with species on rows and sex on columns'",
      "table(penguins$species, penguins$sex)"
    ),
    c(
      "Tabulate combinations of penguin species and sex, but with species on columns and sex on rows'",
      "table(penguins$sex, penguins$species)"
    )
  )
}
