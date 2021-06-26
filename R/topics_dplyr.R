#' Documentation for dplyr::filter
#' @noRd
introverse_filter <- function() {
  cat(
    head_space %+%
      "The `filter()` function is part of the " %+% 
      crayon::bold("{dplyr} package") %+%
      ".\nConceptual usage: `tibble %>% filter(logical statement)`." %+%
      ".\nConceptual usage: `tibble %>% filter(logical statement, another logical statement)`.\n" %+%
      "It is used to subset " %+% crayon::bold("rows") %+%
      " from tibbles (data frames). Rows are kept if the given logical statement (code that gives `TRUE` or `FALSE`) is `TRUE`. Use this function if you only want to keep certain rows, aka certain observations." %+%
      examples_header %+%
      ## Example 1
      style_comment(
        "# Subset to only 'Gentoo' Species (rows where it is TRUE that species == 'Gentoo')\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "filter(species == 'Gentoo')"
      ) %+% "\n\n" %+%
      ## Example 2
      style_comment(
        "# Subset to penguins whose bill lengths are greater than 45 mm\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "filter(bill_length_mm > 45)"
      ) %+% "\n\n" %+%
      ## Example 3
      style_comment(
        "# Subset to Gentoo penguins from the island Biscoe \n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "filter(species == 'Gentoo', island == 'Biscoe')"
      )
  )
}


#' Documentation for dplyr::slice
#' @noRd
introverse_slice <- function() {
  cat(
    head_space %+%
      "The `slice()` function is part of the " %+% 
      crayon::bold("{dplyr} package") %+%
      ".\nConceptual usage: `tibble %>% slice(range or index of row(s) to keep)`\n"%+%
      "It is used to subset " %+% crayon::bold("tibble rows") %+%
      " based on indices." %+%
      examples_header %+%
      ## Example 1
      style_comment(
        "# Keep only the 3rd row from penguins\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "slice(3)"
      ) %+% "\n\n" %+%
      ## Example 2
      style_comment(
        "# Keep only rows 1, 4, and 8 from penguins\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "slice(1, 4, 8)"
      ) %+% "\n\n" %+%
      ## Example 3
      style_comment(
        "# Keep only the first 15 rows from penguins \n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "slice(1:15)"
      )
  )
}

#' Documentation for dplyr::mutate
#' @noRd
introverse_mutate <- function() {
  cat(
    head_space %+%
      "The `mutate()` function is part of the " %+% 
      crayon::bold("{dplyr} package") %+%
      ".\nConceptual usage: `tibble %>% mutate(name_of_new_column = what to put in new column)`.\n" %+%
      "It is used to " %+% crayon::bold("create new columns") %+%
      " in tibbles (data frames)." %+%
      examples_header %+%
      ## Example 1
      style_comment(
        "# Create a new column called `my_new_column` that literally contains the value `5` at all rows\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "mutate(my_new_column = 5)"
      ) %+% "\n\n" %+%
      ## Example 2
      style_comment(
        "# Create a new column called `bill_length_cm` that contains bill lengths in cm (aka `bill_length_mm` values divided by 10)\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "mutate(bill_length_cm = bill_length_mm / 10)"
      ) %+% "\n\n" %+%
      ## Example 3
      style_comment(
        "# Creates two new columns: `flipper_squared` containing the squared values of flipper lengths, and `island_lower` containing the island names all in lowercase. \n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "mutate(flipper_squared = flipper_length_mm**2,\n",
        pipetab,pipetab,pipetab,
        " island_lower    =  tolower(island) )"
      ) %+% "\n\n" %+%
      ## Example 4
      style_comment(
        "# Change the `year` column into a factor column. `mutate()` will overwrite columns. \n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "mutate(year = as.factor(year))"
      )
    
  )
}


#' Documentation for dplyr::select
#' @noRd
introverse_select <- function() {
  cat(
    head_space %+%
      "The `select()` function is part of the " %+% 
      crayon::bold("{dplyr} package") %+%
      ".\nConceptual usage: `tibble %>% select(columns, you, want, to, keep)`",
    "\nConceptual usage: `tibble %>% select(-columns, -you, -want, -to, -remove)`" %+%
      "It is used to " %+% crayon::bold("keep, remove, and/or reorder columns") %+%
      " in tibbles (data frames)." %+%
      examples_header %+%
      ## Example 1
      style_comment(
        "# Keep only the column `species` from penguins\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "select(species)"
      ) %+% "\n\n" %+%
      ## Example 2
      style_comment(
        "# Keep only the columns `species` and `bill_depth_mm` (in that order!) from penguins\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "select(species, bill_depth_mm)"
      ) %+% "\n\n" %+%
      ## Example 3
      style_comment(
        "# Remove only the column `species` from penguins\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "select(-species)"
      ) %+% "\n\n" %+%
      ## Example 4
      style_comment(
        "# Remove only the columns `species` and `bill_depth_mm` from penguins\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "select(-species, -bill_depth_mm)"
      ) %+% "\n\n" %+%
      ## Example 5
      style_comment(
        "# Reorder the columns so `sex` comes first, followed by everything else, using the helper {tidyselect} function `everything()`.\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "select(sex, everything())"
      )    
    
  )
}



#' Documentation for dplyr::arrange
#' @noRd
introverse_arrange <- function() {
  cat(
    head_space %+%
      "The `arrange()` function is part of the " %+% 
      crayon::bold("{dplyr} package") %+%
      ".\nConceptual usage: `tibble %>% arrange(column_sort_ascending)`"%+%
      "\nConceptual usage: `tibble %>% arrange(desc(column_sort_descending))`" %+%
      "It is used to arrange " %+% crayon::bold("tibble rows") %+%
      " in ascending order of the given column. To arrange by descending order tibbles (data frames)." %+%
      examples_header %+%
      ## Example 1
      style_comment(
        "# Arrange in ascending alphabetal order of island\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "arrange(island)"
      ) %+% "\n\n" %+%
      ## Example 2
      style_comment(
        "# Arrange in descending alphabetal order of island\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "arrange(desc(island))"
      ) %+% "\n\n" %+%
      ## Example 3
      style_comment(
        "# Arrange in ascending order of flipper length \n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "arrange(flipper_length_mm)"
      )%+% "\n\n" %+%
      ## Example 4
      style_comment(
        "# Arrange in descending order of flipper length \n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "arrange(desc(flipper_length_mm))"
      )
  )
}


#' Documentation for dplyr::distinct
#' @noRd
introverse_distinct <- function() {
  cat(
    head_space %+%
      "The `distinct()` function is part of the " %+% 
      crayon::bold("{dplyr} package") %+%
      ".\nConceptual usage: `tibble %>% distinct()`\n"%+%
      "It is used to " %+% crayon::bold("remove duplicate rows") %+%
      " from tibbles (data frames). Only distinct rows are retained. No arguments needed!" %+%
      examples_header %+%
      ## Example 1
      style_comment(
        "# Remove duplicate rows from penguins\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "distinct()"
      ) 
  )
}




#' Documentation for dplyr::summarize
#' @noRd
introverse_summarize <- function() {
  cat(
    head_space %+%
      "The `summarize()` function is part of the " %+% 
      crayon::bold("{dplyr} package") %+%
      ".\nConceptual usage: `tibble %>% summarize(name_of_new_column = summary statistic calculation)`\n"%+%
      "It is used to summarize tibbles. The final result has new column(s) and is smaller, retaining only what was needed for summarizing." %+%
      examples_header %+%
      ## Example 1
      style_comment(
        "# Calculate the mean of penguin bill depth. The bill depth column has NA's so use `na.rm=TRUE` *argument with mean()*. \n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "summarize(mean_bill_depth = mean(bill_depth_mm, na.rm = TRUE))"
      ) %+% "\n\n" %+%
      ## Example 2
      style_comment(
        "# Calculate the maximum value of body mass\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "summarize(max_body_mass = max(body_mass_g, na.rm = TRUE))"
      ) %+% "\n\n" %+%
      ## Example 3
      style_comment(
        "# Calculate the median body mass for each species (using `group_by!`) \n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "group_by(species) %>%\n",
        pipetab, "summarize(med_body_mass = median(body_mass_g, na.rm = TRUE))"
      ) %+% "\n\n" %+%
      ## Example 4
      style_comment(
        "# Calculate the median body mass for each combination of island and species (using `group_by!`) \n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "group_by(species, island) %>%\n" %+%
        pipetab, "summarize(med_body_mass = median(body_mass_g, na.rm = TRUE)) %>%\n",
        pipetab, "ungroup()"
      )
  )
}


#' Documentation for dplyr::ungroup, which calls introverse_group_by()
#' @noRd
introverse_ungroup <- function() {
  introverse_group_by()
}

#' Documentation for dplyr::group_by
#' @noRd
introverse_group_by <- function() {
  cat(
    head_space %+%
      "The `group_by()` and ungroup() functions are part of the " %+% 
      crayon::bold("{dplyr} package") %+%
      "\nConceptual usage: `tibble %>% group_by(group subsequent steps on this column)`\n"%+%
      "\nConceptual usage: `tibble %>% group_by(group, subsequent, steps, on, these, columns)`\n"%+%
      "\nConceptual usage: `tibble %>% group_by(group by me)`\n"%+%
      "\nConceptual usage: `tibble that was previously grouped %>% ungroup()`\n"%+%
      "`group_by()` establishes groupings of data based on given columns for subsequent operations, and it is often used with `summarize()`. After you are done with your grouped operations, it is often a good idea use `ungroup()` (no arguments needed) to remove groupings." %+%
      examples_header %+%
      ## Example 1
      style_comment(
        "# Establish a species grouping, and then calculate the mean bill depth for each species group. Ungroup when finished. The bill depth column has NA's so use `na.rm=TRUE` *argument with mean()*\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "group_by(species) %>%\n",
        pipetab, "summarize(mean_bill_depth = mean(bill_depth_mm, na.rm = TRUE)) %>%\n",
        pipetab, "ungroup()"
      ) %+% "\n\n" %+%
      ## Example 2
      style_comment(
        "# Calculate the smallest bill length seen each year (as in, in each year grouping).\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "group_by(year) %>%\n",
        pipetab, "summarize(min_bill_length = min(bill_length_mm, na.rm = TRUE)) %>%\n",
        pipetab, "ungroup()"
      ) %+% "\n\n" %+%
      ## Example 3
      style_comment(
        "# Calculate the median body mass for each combination of island and species. \n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "group_by(island, species) %>%\n",
        pipetab, "summarize(med_body_mass = median(body_mass_g, na.rm = TRUE)) %>%\n",
        pipetab, "ungroup()"
      ) 
  )
}


