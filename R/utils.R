.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
## DO NOT MESS WITH THE SPACING ##
    "\nWelcome to the {introverse}!\n\n" %+%
    "Not sure where to start? You can...\n\n" %+%
    "- Run " %+% crayon::bold("show_topics()") %+% " to see all the different functions 
  and topics you can ask for help with.
  
- Run " %+% crayon::bold('show_topics("library or category of interest")') %+% " to see 
  all the different functions within a certain library/category 
  of interest. For example, to see all help topics for {dplyr}
  functions and topics, run: " %+% crayon::bold('show_topics("dplyr")') %+% ".

- Run " %+% crayon::bold('get_help("carnivores")') %+% " and " %+% 
crayon::bold('get_help("msleep")') %+% " to learn 
  about the datasets used in examples.
    
- Run the function " %+% crayon::bold('get_help()') %+% " to see the {introverse} docs
  for a function or topic. For example, to get help using 
  the `length()` function, run: " %+% crayon::bold('get_help("length")') %+% ".
  Don't forget quotation marks around the argument to " %+% crayon::bold('get_help()') %+% "!"
  )
}
#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @noRd
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
#' @noRd
#' @importFrom crayon %+%
#' @usage lhs \%+\% rhs
#' @param lhs A `crayon` value
#' @param rhs A `crayon` value
#' @return The combined `crayon` values
NULL

#' Internal path to Rmd topics
#' @keywords internal
rmd_topics_path <- "rmd_topics"

#' Internal options width for HTML size
#' @keywords internal
topic_width <- 75

#' Viewer wrapper for showing the help docs
#' 
#' @param html_file The (temporary) HTML file containing the rendered help to view
#' @keywords internal
introverse_viewer <- function(html_file)
{
  viewer <- getOption("viewer")
  rstudioapi::viewer(html_file)
}







