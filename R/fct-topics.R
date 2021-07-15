#' All the dplyr topics
#' @keywords internal
#' @noRd
dplyr_topics <- sort(c(
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
  "tally",
  "bind_cols"
  # _join
  # bind_
  # between
))

#' All the base R topics
#' @keywords internal
#' @noRd
base_topics <- sort(c(
  "length", 
  "nchar", 
  "log", 
  "sqrt",
  "summary", 
  "round",
  "head", "tail", # Same page
  "mean", "median", "max", "min", "sum", "sd", # Same page
  "ceiling", "floor", # Same page
  "ifelse", 
  "nrow", "ncol", # Same page
  "table",
  "levels", 
  "class", 
  "c", 
  "data.frame",
  "file.path", 
  "library",
  "install.packages",
  "getwd", 
  "setwd",
  "file.exists", "dir.exists", # Same page
  "as.numeric", 
  "as.factor", 
  "as.character" 
))



#' List of available help topics by category ordered alphabetically, which is sometimes but not always a package.
#' @keywords internal
#' @noRd
#' !!! ALERT!!!! Do not directly add topics to this list! Instead, add new topics to the appropriate array above For example, to add a `dplyr` topic, put in into the `dplyr_topics` definition!!
topic_list <- list(
  "base" = base_topics,
  "datasets" = c("carnivores", "msleep"),
  "dplyr" = dplyr_topics,
  "magrittr" = c("apipe", "pipe"), # keep assignment first
  "operators" = c("assignment", "logical", "mathematical") # alphabetical
)

#' Operators documented in logical, math, or assignment help pages
#' @keywords internal
#' @noRd
operators <- c("+", "-", "*", "/" ,"**", "^", "%", "->", "<-",
               "==", ">", "<", ">=", "<=", "!=", "!", "&", "|") 

#' Obtain correct category and topic for any operator get_help() arguments 
#' @keywords internal
#' @noRd
convert_operator_into_topic <- function(operator)
{
  dplyr::case_when(
    ########## Math ###########
    operator == "+" ~ "mathematical",
    operator == "-" ~ "mathematical",
    operator == "*" ~ "mathematical",
    operator == "/" ~ "mathematical",
    operator == "**" ~ "mathematical",
    operator == "^" ~ "mathematical",
    operator == "%" ~ "mathematical",
    ######### Logical ##########
    operator == "==" ~ "logical",
    operator == "!=" ~ "logical",
    operator == ">" ~ "logical",
    operator == "<" ~ "logical",
    operator == ">=" ~ "logical",
    operator == "<=" ~ "logical",
    operator == "!" ~ "logical",
    operator == "&" ~ "logical",
    operator == "|" ~ "logical",
    ######## Assignment #######
    operator == "<-" ~ "assignment",
    operator == "->" ~ "assignment",
  ) -> topic
  
  if (is.na(topic)) stop("\n\nERROR: Unknown operator.")
  
  topic
}
  
  
#' Magrittr operators
#' @keywords internal
#' @noRd
magrittr_operators <- c("%<>%", "%>%")

#' Obtain correct docs word for magrittr pipes
#' @keywords internal
#' @noRd
convert_magrittr_into_topic <- function(pipe)
{
  word <- NA
  if (pipe == "%>%") word <- "pipe"
  if (pipe == "%<>%") word <- "apipe"
  stopifnot(!(is.na(word)))
  
  word
}
  
  
  
  
  
  
  



#' Show the topic list
#' 
#' TODO: Should we reveal this in Console or Viewer?
#' @param category If specified, gives only topics in the given category (name in topic_list)
#' @returns Prints out available topics by package
#' @export
#' @examples 
#' \dontrun{
#' show_topics() # Show a list of topics, organized by category
#' # Show all topics in the `dplyr` category
#' show_topics(category = 'dplyr') 
#' # Show all topics in the `dplyr` and `tidyr` categories
#' show_topics(category = c('dplyr', 'tidyr')) 
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
          message_get_help(categ)
          next
        }
        
        # Totally wrong
        # the only stop in the function
        stop(
          # SPACING IS GOOD KEEP IT!
          glue::glue(
    '
  \n\nSorry, your provided category "{category}" is not available. 
  Is it spelled correctly? 
  You can also run ' %+% 
  crayon::bold("show_categories()") %+% 
  " to see all available 
  introverse help categories."
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
    cat(crayon::bold(crayon::green(crayon::underline(glue::glue("{pkg} topics:")))))
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
message_get_help <- function(topic)
{
  message(
    "\n\nI think you want to get help for the " %+% 
      crayon::underline("topic") %+% " " %+% crayon::bold(topic) %+% "?
Run this instead: " %+% crayon::bold(glue::glue('get_help("',{topic}, '")\n\n'))
  )
}


#' Redirect user to the `show_topics()` output if they entered a category into `get_help()`
#' 
#' TODO: Should we reveal this in Console or Viewer?
#' @param category The category to whose topics this function reveals
#' @noRd
message_show_categories <- function(category)
{
  message(
  "\n\nI think you want to get help for the " %+% 
  crayon::underline("category") %+% " " %+% crayon::bold(category) %+% "?
Run this instead to see all topics in this category
that you can get help for: " %+% crayon::bold(glue::glue('show_topics("',{category}, '")\n\n'))
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
#' show_categories()
#' }
show_categories <- function()
{
  for (topic in sort(names(topic_list)))
  {
    # looping to add quotes to reinforce that the arguments need to be strings
    cat(glue::glue('"', {topic}, '"\n\n'))
  }
}



