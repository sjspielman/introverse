#' Description for dplyr::summarize
#' @noRd
description_summarize <- function()
{
  "The `summarize()` (aka `summarise()`) function is part of the {dplyr} package.
  It is used to summarize tibbles. The final resulting tibble has new column(s) and is smaller, retaining only what was needed for summarizing."
}

#' Conceptual usage for dplyr::summarize
#' @noRd
conceptual_usage_summarize  <- function()
{
  c("tibble %>% summarize(name_of_new_column = summary statistic calculation)",
    "tibble %>% group_by(grouping column) %>% summarize(name_of_new_column = summary statistic calculation")
}



#' Examples for dplyr::summarize
#' @noRd
examples_summarize <- function()
{
  list(
    c(
      "Calculate the mean of penguin bill depth. The bill depth column contains NA's so use `na.rm=TRUE` *argument with mean()*", 
      "penguins %>%
      summarize(mean_bill_depth = mean(bill_depth_mm, na.rm = TRUE))"
    ),
    c(
      "Calculate the maximum value of body mass", 
      "penguins %>%
      summarize(max_body_mass = max(body_mass_g, na.rm = TRUE))"
    ),
    c(
      "Calculate the median body mass separately for each species (using `group_by!`)", 
      "penguins %>%
      group_by(species) %>%
      summarize(med_body_mass = median(body_mass_g, na.rm = TRUE))"
    ),
    c(
      "Calculate the median body mass for each combination of island and species (using `group_by!`)", 
      "penguins %>%
      group_by(species, island) %>%
      summarize(med_body_mass = median(body_mass_g, na.rm = TRUE))"
    )
  )
}
