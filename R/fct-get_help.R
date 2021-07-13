#' Prints help and examples for a given topic to the R Console
#'
#' @param topic A topic whose introverse quick docs to look up
#' @export
get_help <- function(topic = NULL) {
  
  
  if (is.null(topic))
  {
    # output
    cat("To get some help, provide an argument in quotation marks to the `get_help()` function in this format: " %+%
        crayon::bold('get_help("name of function")') %+% 
      "\nFor example: " %+%  crayon::bold('get_help("filter")') %+% 
      "\nMany help examples use the `penguins` tibble (data frame). Make sure you have explored this tibble first to fully understand all examples.\n\n" %+% crayon::bold("Currently available help topics:\n") 
    )
    show_topics()
  } else
  {
    # Operator?
    if (topic %in% operators) 
    {
      topic <- convert_operator_into_topic(topic)
    }
    
    # Bad topic
    if (!(topic %in% unlist(topic_list)))
    {
      # They asked for a category
      if (topic %in% names(topic_list))
      {
        message_show_categories(topic)
      } else {
        #totally wrong
          # Keep this so that we can expect an error in tests. KEEP THE SPACING TOO!!
          stop(
          "\n\nSorry, that topic is not available. Is it spelled correctly? 
    You can also run " %+% 
    crayon::bold("show_topics()") %+% " to see all available introverse topics.
          
    Or, do you think this topic is missing and would 
    be helpful to include in the introverse? 
    
    Let us know by filing an issue here:\n" %+% crayon::underline("https://github.com/spielmanlab/introverse/issues") %+% "
    Thanks for the feedback!")
      }
    } else 
    {  
      # Good topic.
      
      # Find category
      category <- paste0(find_topic_category(topic))
      
      # launch help
      reveal_help(category, topic)
    }
  }
}



#' Reveal the standalone help topic HTML content in the viewer pane
#' 
#' @param category The topic to launch's category
#' @param topic The topic to launch
reveal_help <- function(category, topic)
{

  tempDir <- tempfile()
  dir.create(tempDir)
  htmlFile <- file.path(tempDir, "index.html")
  
  withr::with_options(c(width = topic_width),
    rmarkdown::render(
      system.file(rmd_topics_path, 
                  glue::glue("{category}_{topic}.Rmd"), 
                  package = "introverse"),
      output_file = htmlFile,
      quiet = TRUE)
  )  
  
  introverse_viewer(htmlFile)
  # return invisible
  return(invisible(topic))
}


