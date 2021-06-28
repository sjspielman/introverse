#' Description for dplyr::group_by and dplyr::ungroup
#' @noRd
description_group_by <- function()
{
  "The `group_by()` and ungroup() functions are part of the {dplyr} package.
  
  `group_by()` establishes groupings of data based on given columns for subsequent operations, and it is often (but not only!) used with the {dplyr} package `summarize()`. After you are done with your grouped operations, it is often a good idea use `ungroup()` (no arguments needed) to remove groupings and avoid unintended consequences of grouped data."
}

#' Description for dplyr::ungroup, which simply runs the group_by description
#' @noRd
description_ungroup <- function()
{
  description_group_by()
}


#' Conceptual usage for dplyr::group_by
#' @noRd
conceptual_usage_group_by  <- function()
{
  c("tibble %>% group_by(group subsequent steps on this column)",
    "tibble %>% group_by(group, subsequent, steps, on, these, columns",
    "tibble that was previously grouped %>% ungroup()`"
  )
}

#' Conceptual usage for dplyr::ungroup which returns the group_by
#' @noRd
conceptual_usage_ungroup <- function()
{
  conceptual_usage_group_by()
}


#' Examples for dplyr::group_by
#' @noRd
examples_group_by <- function()
{
  list(
    c(
      "Establish a species grouping, and then calculate the mean bill depth for each species group. Ungroup when finished. The bill depth column has NA's so use `na.rm=TRUE` *argument with mean()*",
      "penguins %>%
     group_by(species) %>%  
     summarize(mean_bill_depth = mean(bill_depth_mm, na.rm = TRUE)) %>%
     ungroup()"
    ),
    c(
      "Calculate the smallest bill depth seen each year (as in, in each year grouping)",
      "penguins %>%
     group_by(year) %>%  
     summarize(min_bill_depth = min(bill_depth_mm, na.rm = TRUE)) %>%
     ungroup()"
    ),
    c(
      "Calculate the median body mass for each combination of island and species", 
      "penguins %>%
      group_by(species, island) %>%
      summarize(med_body_mass = median(body_mass_g, na.rm = TRUE))"
    )
  )
}

#' Examples for dplyr::ungroup, from group_by examples (needs to exists for tests to pass)
#' @noRd
examples_ungroup <- function()
{
  examples_group_by()
}
