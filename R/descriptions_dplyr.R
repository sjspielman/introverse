#' Description for dplyr::filter
#' @noRd
description_filter <- function()
{
  head_space %+%
  "The `filter()` function is part of the {dplyr} package.
  
  It is used to subset rows from tibbles (data frames). Rows are kept if the given logical statement (code that gives `TRUE` or `FALSE`) is `TRUE`. Use this function if you only want to keep certain rows, aka certain observations."
}

#' Description for dplyr::select
#' @noRd
description_select <- function()
{
  head_space %+%
    "The `select()` function is part of the {dplyr} package.
    It is used to keep, remove, and/or reorder columns in tibbles (data frames). No quotes are needed." 
}


#' Description for dplyr::slice
#' @noRd
description_slice <- function()
{
  head_space %+%
    "The `slice()` function is part of the {dplyr} package. 
    It is used to subset tibble rows based on indices, aka which row it is in the tibble (data frame)."
}


#' Description for dplyr::mutate
#' @noRd
description_mutate <- function()
{
  head_space %+%
    "The `mutate()` function is part of the {dplyr} package.
    It is used to create new columns in tibbles (data frames)."
}

#' Description for dplyr::arrange
#' @noRd
description_arrange <- function()
{
  head_space %+%
    "The `arrange()` function is part of the {dplyr} package.
    It is used to arrange tibble rows in ascending order of the given column. To arrange by descending order, you need to use `desc()` around your column argument."
}



#' Description for dplyr::distinct
#' @noRd
description_distinct <- function()
{
  "The `distinct()` function is part of the {dplyr} package.
  It is used to remove duplicate rows from tibbles (data frames). Only distinct rows are retained. No arguments needed!"
}


#' Description for dplyr::rename
#' @noRd
description_rename <- function()
{
  "The `rename()` function is part of the {dplyr} package.
  It is useful for quickly renaming columns in tibbles (data frames). No quotes are needed."
}



#' Description for dplyr::summarize
#' @noRd
description_summarize <- function()
{
  "The `summarize()` (aka `summarise()`) function is part of the {dplyr} package.
  It is used to summarize tibbles. The final resulting tibble has new column(s) and is smaller, retaining only what was needed for summarizing."
}

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