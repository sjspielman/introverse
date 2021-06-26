#' Prints help and examples for a given function to the R Console
#'
#' @param f A function whose introverse quick docs to look up
get_help <- function(f = NULL) {
  
  if (is.null(f))
  {
    cat(
      crayon::bold(
        crayon::green("\nI see you need help! I'd love to help, but I need a little more information...\n\n")
      ) %+%
      "To get some help, provide an *argument* to the `get_help()` function in this format: " %+%
      style_code('get_help("name of function")') %+% 
      "\nFor example: " %+%  style_code('get_help("filter")') %+% 
      "\n\n" %+% crayon::bold("Currently available help topics:\n") 
    )
    print_topic_list()
  } else 
  {
      eval(
        parse(
          text =
            glue::glue("introverse_{f}()")
        )
      )
  }
}



#' Style text as code comment
#'
#' @param x Text to be styled as a code comment
style_comment <- function(...) {
  crayon::silver(...)
}


#' Style text as code
#'
#' @param x Text to be styled as code
style_code <- function(...) {
  crayon::blue(...)
}


#' Documentation for dplyr::filter
introverse_filter <- function() {
  cat(
    head_space %+%
    "The `filter()` function is part of the " %+% 
      crayon::bold("{dplyr} package") %+%
      ".\nPlain-english usage: `filter(tibble, logical statement)`.\n" %+%
      "It is used to subset " %+% crayon::bold("rows") %+%
      " from tibbles (data frames). Rows are kept if the given condition is `TRUE`. Use this function if you only want to keep certain rows, aka certain observations." %+%
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



#' Documentation for dplyr::mutate
introverse_mutate <- function() {
  cat(
    head_space %+%
      "The `mutate()` function is part of the " %+% 
      crayon::bold("{dplyr} package") %+%
      ".\nPlain-english usage: `mutate(name_of_new_column = what to put in new column)`.\n" %+%
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
      )
    
  )
}




#' Documentation for dplyr::select
introverse_select <- function() {
  cat(
    head_space %+%
      "The `select()` function is part of the " %+% 
      crayon::bold("{dplyr} package") %+%
      ".\nPlain-english usage: `select(columns, you, want, to, keep)`",
      "\n Plain-english usage: `select(-columns, -you, -want, -to, -remove)`" %+%
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
        "# Reorder the columns so `sex` comes first, followed by everything else, using the helper {dplyr} function `everything()`\n"
      ) %+%
      style_code(
        "penguins %>%\n",
        pipetab, "select(sex, everything())"
      )    
    
  )
}

