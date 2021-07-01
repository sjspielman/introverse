.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "\nWelcome to the {introverse}! Please be aware that to use this package, you must be working with R from RStudio.\n\n" %+%
    "Not sure where to start? You can...\n" %+%
    "- Run the function " %+% crayon::inverse("TBD??") %+% " to learn about the built-in dataset called `pengs` used for examples.\n" %+% 
    "- Run the function " %+% crayon::inverse("show_topics()") %+% " to see all the different topics you can ask for help for.\n" %+%
    "- Ready to get some help? Use the function " %+% crayon::inverse('get_help("topic you want help on")') %+% " to get some help! For example, to get help using the `mean()` function, run:  " %+% crayon::inverse('get_help("mean")') %+% "."
  )
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







