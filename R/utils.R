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



#' Tab amount for printing pipelines
#' @keywords internal
#' @noRd
pipetab <- "  "

#' Head space at top of doc
#' @keywords internal
#' @noRd
head_space <- "\n"

#' Examples header
#' @keywords internal
#' @noRd
examples_header <- crayon::inverse("\n\nExamples:\n\n")


#' Style text as code comment
#'
#' @param ... Text to be styled as a code comment
style_comment <- function(...) {
  crayon::silver(...)
}


#' Style text as code
#'
#' @param ... Text to be styled as code
style_code <- function(...) {
  crayon::blue(...)
}


#' My own penguins
#' @noRd
penguins <- palmerpenguins::penguins
