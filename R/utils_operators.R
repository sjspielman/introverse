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

#' My own penguins
#' @noRd
penguins <- palmerpenguins::penguins


#' List of topics
#' @noRd
topic_list <- list(
  "dplyr" = c("filter", "select", "mutate"),
  "tidyr" = c("forthcoming")
)

#' Show the topic list
print_topic_list <- function()
{
  full <- ""
  for (pkg in names(topic_list))
  {
    full <- cat(full %+%
      crayon::red(glue::glue({pkg}, "::"))
    )
    for (topic in topic_list[[pkg]])
    {
      full <- cat(full, "\n", glue::glue('"', {topic}, '"'))
    }
    full <- "\n"
  }
}
