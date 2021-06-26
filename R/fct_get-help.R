#' Get quick help for a given function
#' 
#' @param f A function whose introverse quick docs to look up
quick_help <- function(f)
{
  
  eval(
    parse(text = 
      glue::glue("introverse_{f}()")
    )
  )
  
}

introverse_filter <- function(interactive = FALSE)
{
  cat(
    head_space %+%
    "The `filter()` function is part of the " %+% crayon::bold("dplyr package") %+%
    ".\nPlain-english usage: `filter(tibble, logical statement)`.\n" %+%
    "It is used to subset " %+% crayon::bold("rows") %+%
    " from tibbles (data frames). Rows are kept if the given condition is `TRUE`.\n\n" %+%
    crayon::inverse("Examples:\n\n") %+%
    ## Example 1
    crayon::silver(
      "# Subset to only 'setosa' Species (rows where it is TRUE that Species == 'setosa')\n"
    ) %+%
    crayon::blue(
      "iris %>%\n", 
      pipetab, "filter(Species == 'setosa')"
    ) %+% "\n\n" %+% 
    ## Example 2
    crayon::silver(
      "# Subset to irises whose petal lengths are greater than 6\n"
    ) %+%
    crayon::blue(
      "iris %>%\n", 
      pipetab, "filter(Petal.Length > 6)"
    ) %+% "\n\n" %+% 
    ## Example 3
      crayon::silver(
        "# Subset to irises whose petal lengths less than 4 AND whose sepal lengths are equal to 5 \n"
      ) %+%
      crayon::blue(
        "iris %>%\n", 
        pipetab, "filter(Petal.Length < 4, Sepal.Length == 5)"
      )  
  )
}


#x <- glue_collapse(x, "\n")
#x <- glue(x, .envir = .envir)
#
#block <- usethis:::indent(x, "  ")
#block <- crayon::silver(block)
