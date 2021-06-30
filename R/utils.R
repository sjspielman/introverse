.onAttach <- function(libname, pkgname) {
  packageStartupMessage("\nWelcome to the {introverse}! Please be aware that to use this package, you must be working with R from RStudio.")
}

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

#' Penguins dataset
#' 
#' @keywords internal
#' @export
#' @importFrom palmerpenguins penguins
#' @noRd
NULL


#' Internal path to html topics
#' @keywords internal
html_topics_path <- "html_topics"

#' Internal path to Rmd topics
#' @keywords internal
rmd_topics_path <- "rmd_topics"


#' Viewer wrapper for showing the help docs
#' 
#' @param html_file The (temporary) HTML file containing the rendered help to view
#' @keywords internal
introverse_viewer <- function(html_file)
{
  viewer <- getOption("viewer")
  rstudioapi::viewer(html_file)
}







