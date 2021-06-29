#' List of available help topics
#' @noRd
topic_list <- list(
  
  #"operators" = c("math" 
  #                "logical", 
  #                "assignment",
  #                "pipe"),
  
  "dplyr" = c("filter", 
              "slice",
              "select", 
              "mutate", 
              "arrange", 
              "distinct",
              "summarize",
              "group_by",
              "ungroup", 
              "rename", 
              "glimpse", 
              "pull",
              "tally", 
              "count",
              "n", 
              "case_when", 
              "if_else"),
  # _join
  # bind_
  # between
  
   "Base R" = c("head", 
                "tail", 
                "length", 
                "nchar", 
                "log", 
                "sqrt", 
                "summary", 
                "mean",
                "median",
                "max",
                "min",
                "sum",
                "sd",
                "round", "ceiling", "floor",
                "ifelse", 
                "nrow", "ncol",
                "table",
                "levels", 
                "class", 
                "c", 
                "data.frame",
                "file.path", 
                "file.exists", "dir.exists",
                "as.numeric", "as.factor", "as.character", # "as.logical" probably not needed?
                ##### DO NOT TEST EXAMPLES FOR THE REST #####
                "library", "install.packages",
                "getwd", "setwd") 
                
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