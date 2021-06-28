#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
#' @param lhs A value or the magrittr placeholder.
#' @param rhs A function call using the magrittr semantics.
#' @return The result of calling `rhs(lhs)`.
NULL

#' Crayon cat operator
#'
#' @name %+%
#' @rdname crayon_pipe
#' @keywords internal
#' @export
#' @importFrom crayon %+%
#' @usage lhs \%+\% rhs
#' @param lhs A `crayon` value
#' @param rhs A `crayon` value
#' @return The combined `crayon` values
NULL

#' Head space at top of doc
#' @keywords internal
#' @noRd
head_space <- "\n"

#' Examples header
#' @keywords internal
#' @noRd
examples_header <- crayon::inverse("\nExamples:\n")


#' Style text as code comment
#'
#' @param ... Text to be styled as a code comment
style_comment <- function(...) 
{
  crayon::silver("\n# " %+% ...)
}


#' Style text as code
#'
#' @param ... Text to be styled as code
style_code <- function(...) {
  crayon::blue("\n" %+% ...)
}


#' My own penguins
#' @noRd
penguins <- palmerpenguins::penguins



#' Format conceptual usages
#' @noRd
format_conceptual_usage <- function(...)
{
  usage_array <- c(...)
  print_usage <- "\n\n"  %+% crayon::inverse("Conceptual Usage:\n\n") 
  
  for (use_case in usage_array)
  {
    print_usage <- print_usage %+% 
      "`" %+% 
      crayon::yellow(use_case) %+% 
      "`" %+% "\n"
  }
  print_usage
}



#' Format code examples
#' @noRd
#' @param example_list an unnamed list of examples. Each example should be an array `(comment string, code string)`
format_examples <- function(example_list)
{
  full <- ""
  for (x in example_list)
  {
    full <- full %+% style_comment(x[1]) %+% style_code(x[2]) %+% "\n"
  }
  full
}








