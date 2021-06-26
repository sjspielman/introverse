#' List of available help topics
#' @noRd
topic_list <- list(
  "dplyr" = c("filter", 
              "slice",
              "select", 
              "mutate", 
              "arrange", 
              "distinct",
              "summarize",
              "group_by",
              "ungroup") 
              #"count")
              # _join
              # bind_
              # tally
              # n
              # between
              # if_else
              # case_when
  
)

#' Show the topic list
#' @returns Prints out available topics by package
#' @examples 
#' \dontrun{
#' show_topics()
#' }
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