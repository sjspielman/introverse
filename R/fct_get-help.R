#' Prints help and examples for a given function to the R Console
#'
#' @param f A function whose introverse quick docs to look up
get_help <- function(f = NULL) {
  
  if (is.null(f))
  {
    cat(
      crayon::bold(
        crayon::green("I see you need help! I'd love to help, but I need a little more information...\n\n")
      ) %+%
      "To get some help, provide an *argument* to the `get_help()` function in this format: " %+%
      style_code('get_help("name of function")') %+% 
      "\nFor example: " %+%  style_code('get_help("filter")') %+% 
      "\n\n" %+% crayon::bold("Currently available help topics:\n") 
    )
    show_topics()
  } else
  {
    # Bad topic
    if (!(f %in% unlist(topic_list)))
    {
      message(
        crayon::bold(
          crayon::red("UH-OH! ")
        ) %+%
        "That topic isn't available. Maybe check your spelling? You can also run " %+% style_code("show_topics()") %+% " to see all topics.")
    } else 
    {  
      # Good topic
      eval(
        parse(
          text =
            glue::glue("introverse_{f}()")
        )
      )
    }
  }
}
