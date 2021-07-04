#' Prints help and examples for a given topic to the R Console
#'
#' @param topic A topic whose introverse quick docs to look up
#' @param interactiven Whether the docs should be interactive or not. Default: FALSE
#' @export
get_help <- function(topic = NULL, interactive = FALSE) {
  
  if (is.null(topic))
  {
    # output
    cat(
      crayon::bold(
        crayon::green("I see you need help! I'd love to help, but I need a little more information...\n\n")
      ) %+%
      "To get some help, provide an *argument* to the `get_help()` function in this format: " %+%
        crayon::inverse('get_help("name of function")') %+% 
      "\nFor example: " %+%  crayon::inverse('get_help("filter")') %+% 
      "\nMany help examples use the `penguins` tibble (data frame). Make sure you have explored this tibble first to fully understand all examples.\n\n" %+% crayon::bold("Currently available help topics:\n") 
    )
    show_topics()
  } else
  {
    # Bad topic
    if (!(topic %in% unlist(topic_list)))
    {
      # Keep this - do not change to an html so that we can expect an error in tests
      error(
        crayon::red("\nUh-oh!\n") %+%
        "That topic isn't available. Maybe check your spelling? You can also run " %+% 
        crayon::black(crayon::bgWhite("show_topics()")) %+% 
        " to see all topics.\n\n\n
        Or, do you think this topic is missing and it _should_ be a topic in the {introverse}? Let us know by filing an issue at: " %+% crayon::underline("https://github.com/spielmanlab/introverse/issues") %+% ". Thanks for the feedback!"
      )
    } else 
    {  
      # INVISIBLE!!!
      # Good topic.
      
      # Find category
      category <- paste0(find_topic_category(topic), "_")
      
      # standalone aka not interactive
      if(!(interactive)) {
        launch_standalone_help(topic, category)
      } else {
        # Launch the shiny
        print("!!!!!!!!!!!!!!!!")
        launch_interactive_help(topic, category)
      }
      
    }
  }
}



#' Launch (show) the standalone help topic HTML content in the viewer pane
#' 
#' @param topic The topic to launch
#' @param category The topic to launch's category
launch_standalone_help <- function(topic, category)
{
  html_topic_file <- system.file(html_topics_path, 
                                 glue::glue("topic-", {category}, {topic}, ".html"), 
                                 package = "introverse")
  # read html, write to tempfile so can be displayed in viewer
  html_topic_lines <- readr::read_lines(html_topic_file)
  tempDir <- tempfile()
  dir.create(tempDir)
  htmlFile <- file.path(tempDir, "index.html")
  readr::write_lines(html_topic_lines, htmlFile)
  
  introverse_viewer(htmlFile)
  
  # return invisible
  return(invisible(topic))
}



#' Launch the learnr interactive help topic HTML
#' 
#' @param topic The topic to launch
#' @param category The topic to launch's category
launch_interactive_help <- function(topic, category)
{
  learnr_topic_file <- system.file(learnr_topics_path, 
                                   glue::glue("topic-", {category}, {topic}, ".Rmd"), 
                                   package = "introverse")

  unlink(glue::glue({learnr_topics_path}, "_cache", recursive = TRUE)) # knitr cache
  rmarkdown::shiny_prerendered_clean(learnr_topic_file)       
  
  rmarkdown::run(learnr_topic_file)
  # return invisible
  return(invisible(topic))  
}
