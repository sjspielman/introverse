#' List of available help topics
#' @noRd
topic_list <- list(
  "dplyr" = c("filter", "select", "mutate")
)

#' Show the topic list
#' @returns Prints out available topics by package
#' @examples `show_topics()`
show_topics <- function()
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