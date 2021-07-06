# topic_list -------------------
#' List of available help topics by category, which is sometimes but not always a package.
topic_list <- list(
  "datasets" = c("carnivores", "msleep"),
  "dplyr" = sort(c(
    "filter",
    "slice",
    "select", 
    "mutate", 
    "arrange", 
    "distinct",
    "summarize",
    "group_by", 
    "ungroup",
    "pull",
    "rename",
    "glimpse",
    "if_else", 
    "case_when", 
    "n",
    "count",
    "tally"
    # _join
    # bind_
    # between
  )),
  # comes with R, affectionately termed base, even though some is not, it's all documented.
  "base" = sort(c(
    "length", 
    "nchar", 
    "log", 
    "sqrt",
    "summary", 
    "round",
    # Same page
    "head", "tail", 
    # Same page
    "mean", "median", "max", "min", "sum", "sd",
    # Same page
    "ceiling", "floor",
  #  "ifelse", 
    # Same page
    "nrow", "ncol",
  #  "table",
  #  "levels", 
    "class", 
  #  "c", 
  #  "data.frame",
    "file.path", 
  #  # Same page
    "file.exists", "dir.exists"
  #  # Same page
  #  "as.numeric", "as.factor", "as.character", 
    ))
)

# TODO???
#shared_topics <- list(
# topic = topics that share its page???
#  "mean" = c("median", "max", "min", "sum", "sd"),
#  "ceiling" = c("ceiling", "floor"),
#  "head" = c("head", "tail") 
#)


# Need to convert below to Rmd from current text garbage
# topic_list <- list(
#   "operators" = sort(
#     c("math",
#       "logical")
#   #    "assignment",
#   #    "pipe"),
#   ),
#   
#   ),

#         
#         "ifelse", 
#         "nrow", "ncol",
#         "table",
#         "levels", 
#         "class", 
#         "c", 
#         "data.frame",
#         "file.path", 
#         "file.exists", "dir.exists",
#         "as.numeric", "as.factor", "as.character", # "as.logical" probably not needed?
#         ##### DO NOT TEST EXAMPLES FOR THE REST #####
#         "library", "install.packages",
#         "getwd", "setwd") 
#    )
#                 
# )

#' Show the topic list
#' 
#' TODO: Should we reveal this in Console or Viewer?
#' @param category If specified, gives only topics in the given category (name in topic_list)
#' @returns Prints out available topics by package
#' @export
#' @examples 
#' \dontrun{
#' show_topics() # Show a list of topics, organized by category
#' show_topics(category = 'dplyr') # Show a list of topics in the `dplyr` category
#' show_topics(category = c('dplyr', 'tidyr')) # Show a list of topics in the `dplyr` and `tidyr` categories
#' }
show_topics <- function(category = NULL)
{
  show_names <- c()
  if (!(is.null(category)))
  {
    for (categ in category)
    {
      # check category
      if (!(categ %in% names(topic_list)))
      {
        
        # Did they accidentally provide a topic?? Help them out!
        # the only message in the function
        if (categ %in% unlist(topic_list)) {
          message_topic_to_help(categ)
          next
        }
        
        # Totally wrong
        # the only stop in the function
        stop(
          glue::glue(
            crayon::red("\n\nSorry, I don't have that category.") %+% "\n\nYour provided category '", 
            {categ}, 
            "' is either spelled wrong, or it isn't an available category. To see all available topic categories, run " %+% 
            crayon::black(crayon::bgWhite("show_topic_categories()")) %+% "."
          )
        )
      }
      # add it to the list if passed
      # don't sort what the user provided. maybe they did that order on purpose
      show_names <- c(show_names, categ)
    }
  } else {
    show_names <- sort(names(topic_list))
  }
  
  
  for (pkg in show_names)
  {
    cat(crayon::bold(crayon::magenta(glue::glue({pkg}, "::")))
    )
    for (topic in topic_list[[pkg]])
    {
      # looping to add quotes to reinforce that the arguments need to be strings
      cat("\n", glue::glue('  "', {topic}, '"'))
    }
    cat("\n")
  }
}


#' Redirect user to the get_help() output if they entered a topic into `show_topics()`
#' 
#' TODO: Should we reveal this in Console or Viewer?
#' @param topic The topic to whose help this function redirects to
#' @noRd
message_topic_to_help <- function(topic)
{
  message(
    "\nHmm, it looks like you asked to get help for the " %+% 
    crayon::underline("topic") %+% " " %+% crayon::bold(topic) %+% "?\n" %+%
    "To see help for that function, try using: " %+% crayon::inverse(glue::glue('get_help("',
                                                                                {topic}, '")\n\n'))
  )
}



#' Function to identify a topic's category
#' 
#' @param topic The topic of interest
#' @returns The category
find_topic_category <- function(topic){
  
  gsub("\\d+$", "", 
       names(unlist(topic_list)[unlist(topic_list) == topic])) -> category
  
  # Should no longer be NULL and should be a character
  if ((!(typeof(category) == "character")) | is.null(category))
  {
    stop("\nERROR: Could not determine the category for the given topic.")
  }
  # Should only be ONE word
  # TODO Eventually, if we have duplicates, can prompt for which one.
  if (length(category) != 1)
  {
    stop("\nERROR: A unique category for the given topic could not be found.")
  }
  category
}

#' Show the list of topic categories
#' 
#' TODO: Should we reveal this in Console or Viewer?
#' @returns Prints out available topic categories
#' @export
#' @examples 
#' \dontrun{
#' show_topic_categories()
#' }
show_topic_categories <- function()
{
  for (topic in sort(names(topic_list)))
  {
    # looping to add quotes to reinforce that the arguments need to be strings
    cat(glue::glue('"', {topic}, '"\n\n'))
  }
}



