# tally() ------------------------------------------

#' Description for dplyr::tally
#' @noRd
description_tally <- function()
{
  "The `tally()` function is part of the {dplyr} package.
  
  It creates a new column (named `n` by default) that summarizes data frames by tallying up (counting!) all rows (observations) in a given group. If there is no grouping, `tally()` will give the total number of rows. This is similar to using base `nrow()` except, like many {dplyr} verbs, `tally()` returns a tibble. \nNote that the {dplyr} function `count()` provides a shortcut for `group_by() %>% tally() %>% ungroup()`"
}

#' Conceptual usage for dplyr::tally
#' @noRd
conceptual_usage_tally <- function()
{
  c("tibble %>% tally()",
    "tibble %>% group_by(grouping column) %>% tally() %>% ungroup()"
  )
}


#' Examples for dplyr::tally
#' @noRd
examples_tally <- function()
{
  list(
    c(
      "Count total number of rows in penguins",
      "penguins %>%
     tally()"
    ),
    c(
      "Count total number of rows in penguins, but name the final column `total`",
      "penguins %>%
     tally(name = 'total')"
    ),
    c(
      "Count total number of rows for each penguin species. Note that this can also be done more simply with `dplyr::count()`.",
      "penguins %>%
       group_by(species) %>%
       tally()"
    )
  )
}


# count() ---------------------------------------
#' Description for dplyr::count
#' @noRd
description_count <- function()
{
  "The `count()` function is part of the {dplyr} package.
  
  It creates a new column (named `n` by default) that summarizes data frames by counting the number of rows in specified group. It is a convenient shortcut for: `group_by() %>% tally() %>% ungroup()`"
}

#' Conceptual usage for dplyr::count
#' @noRd
conceptual_usage_count <- function()
{
  c("tibble %>% count(column to group by)",
    "tibble %>% count(columns, to, group, by)"
  )
}


#' Examples for dplyr::count
#' @noRd
examples_count <- function()
{
  list(
    c(
      "Count total number of rows for each penguin species (aka, the total number of each species observed in the data).",
      "penguins %>%
       count(species)"
    ),
    c(
      "Count total number of rows for each penguin species, but name the new column `total`.",
      "penguins %>%
       count(species, name = 'total')"
    ),
    c(
      "Count total number of rows for each combination of penguin species and island.",
      "penguins %>%
       count(species, island)"
    )
  )
}
# n() -------------------------------------------


#' Description for dplyr::n
#' @noRd
description_n <- function()
{
  "The `n()` function is part of the {dplyr} package.
  
  It is a *helper function* that returns a number representing the total number of rows in a given grouping. It is most useful if you want to add an 'index column' in a tibble.`"
}

#' Conceptual usage for dplyr::n
#' @noRd
conceptual_usage_n <- function()
{
  c("tibble %>% mutate(column_ranging_1_to_n = 1:n())"
  )
}


#' Examples for dplyr::n
#' @noRd
examples_n <- function()
{
  list(
    c(
      "Make a new column `one_to_n` that counts the rows 1-n in penguins",
      "penguins %>%
     mutate(one_to_n = 1:n())"
    ),
    c(
      "Make a new column `one_to_n` that counts the rows 1-n in penguins, where numbering starts over in each species grouping",
      "penguins %>%
     group_by(species) %>%
     mutate(one_to_n = 1:n())"
    )
  )
}