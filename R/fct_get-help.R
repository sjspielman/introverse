#' Prints help and examples for a given function to the R Console
#'
#' @param name_of_function A function whose introverse quick docs to look up
get_help <- function(name_of_function = NULL) {
  
  if (is.null(name_of_function))
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
    if (!(name_of_function %in% unlist(topic_list)))
    {
      message(
        crayon::bold(
          crayon::red("UH-OH! ")
        ) %+%
        "That topic isn't available. Maybe check your spelling? You can also run " %+% style_code("show_topics()") %+% " to see all topics.")
    } else 
    {  
      # Good topic
      reveal_help(name_of_function)
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
#' @param name_of_function A function whose introverse quick docs to look up
#' @noRd
reveal_help <- function(name_of_function) {
  cat(
    eval(parse(text = glue::glue("description_", {name_of_function}, "()"))) %+%
      format_conceptual_usage(
        eval(parse(text = glue::glue("conceptual_usage_", {name_of_function}, "()")))
      ) %+%
      examples_header %+%
      format_examples(
        eval(parse(text = glue::glue("examples_", {name_of_function}, "()")))
      )
  )
}
