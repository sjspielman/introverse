#' Prints help and examples for a given topic to the R Console
#'
#' @param name_of_topic A topic whose introverse quick docs to look up
#' @export
get_help <- function(name_of_topic = NULL) {
  
  if (is.null(name_of_topic))
  {
    cat(
      crayon::bold(
        crayon::green("I see you need help! I'd love to help, but I need a little more information...\n\n")
      ) %+%
      "To get some help, provide an *argument* to the `get_help()` function in this format: " %+%
      style_code('get_help("name of function")') %+% 
      "\nFor example: " %+%  style_code('get_help("filter")') %+% 
      "\nMany help examples use the `penguins` tibble (data frame). Make sure you have explored this tibble first to fully understand all examples.\n\n" %+% crayon::bold("Currently available help topics:\n") 
    )
    show_topics()
  } else
  {
    # Bad topic
    if (!(name_of_topic %in% unlist(topic_list)))
    {
      message(
        crayon::red("\nUh-oh!\n") %+%
        "That topic isn't available. Maybe check your spelling? You can also run " %+% 
        crayon::black(crayon::bgWhite("show_topics()")) %+% 
        " to see all topics.\n\n\n
        Or, do you think this topic is missing and it _should_ be a topic in the {introverse}? Let us know by filing an issue at: " %+% crayon::underline("https://github.com/spielmanlab/introverse/issues") %+% ". Thanks for the feedback!"
      )
    } else 
    {  
      # Good topic
      reveal_help(name_of_topic, name_of_topic %in% no_usage_topic_list)
      #eval(
      #  parse(
      #    text =
      #      glue::glue("introverse_{f}()")
      #  )
      #)
    }
  }
}


#' Reveal help for a given function
#' @param name_of_topic A topic whose introverse quick docs to look up
#' @param no_usage Logical indicating whether there is a conceptual usage section in the quick docs. TRUE = there is no usage
#' @noRd
reveal_help <- function(name_of_topic, no_usage) {
  
  if (!(no_usage))
  {
    include_usage <- format_conceptual_usage(
      eval(parse(text = glue::glue("conceptual_usage_", {name_of_topic}, "()")))
    )
  } else {
    include_usage <- ""
  }
  cat(
    eval(parse(text = glue::glue("description_", {name_of_topic}, "()"))) %+%
      include_usage %+%
      examples_header %+%
      format_examples(
        eval(parse(text = glue::glue("examples_", {name_of_topic}, "()")))
      )
  )
}
