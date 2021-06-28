#' Conceptual usage for dplyr::filter
#' @noRd
conceptual_usage_filter <- function()
{
  c(
  "tibble %>% filter(logical statement)",
  "tibble %>% filter(logical statement, another logical statement)"
  )
}


#' Conceptual usage for dplyr::select
#' @noRd
conceptual_usage_select <- function()
{
  c(
  "tibble %>% select(columns, you, want, to, keep)",
  "tibble %>% select(-columns, -you, -want, -to, -remove)"
  )
}

#' Conceptual usage for dplyr::slice
#' @noRd
conceptual_usage_slice <- function()
{
  c(
  "tibble %>% slice(range or index of row(s) to keep)",
  "tibble %>% slice(which, row, numbers, to, keep)",
  "tibble %>% slice(-which, -row, -numbers, -to, -remove)"
  )
}

#' Conceptual usage for dplyr::mutate
#' @noRd
conceptual_usage_mutate  <- function()
{
  c("tibble %>% mutate(name_of_new_column = what to put in new column)")
}

#' Conceptual usage for dplyr::arrange
#' @noRd
conceptual_usage_arrange <- function()
{
  c(
  "tibble %>% arrange(column to sort by in ascending order)",
  "tibble %>% arrange( desc(column to sort by in descending order) )"
  )
}

#' Conceptual usage for dplyr::distinct
#' @noRd
conceptual_usage_distinct <- function()
{
  c("tibble %>% distinct()")
}


#' Conceptual usage for dplyr::rename
#' @noRd
conceptual_usage_rename  <- function()
{
  c("tibble %>% rename(new column name = old colunm name)")
}


#' Conceptual usage for dplyr::rename
#' @noRd
conceptual_usage_rename  <- function()
{
  c("tibble %>% rename(new column name = old column name)")
}



#' Conceptual usage for dplyr::summarize
#' @noRd
conceptual_usage_summarize  <- function()
{
  c("tibble %>% summarize(name_of_new_column = summary statistic calculation)",
    "tibble %>% group_by(grouping column) %>% summarize(name_of_new_column = summary statistic calculation")
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




