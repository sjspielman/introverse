#' Render _all_ Rmd help topics into HTML versions.
#' 
#' @keywords internal
#' @param verbose Whether to print rendered topics as we go.
#' @param topic_file Which specific topic file to knit, as `category_topic.Rmd`.If NULL, knit all topics.
#' @example 
#' \dontrun{
#' render_rmd_topics(TRUE) # verbose mode
#' render_rmd_topics("dplyr_filter.Rmd") # only render dplyr_filter.Rmd
#' render_rmd_topics("dplyr_filter") # also works to only render dplyr_filter.Rmd
#' }
render_rmd_topics <- function(verbose = FALSE, topic_file = NULL) {
  
  
  if (is.null(topic_file)) {
    all_rmd_files <- list.files( 
                      system.file(rmd_topics_path, 
                                  package = "introverse"), 
                      pattern = ".Rmd")
  } else 
  {
    topic_file_ext <- glue::glue(
      gsub("\\.Rmd$", "",topic_file), ".Rmd")
    
    # Just to check that exists
    path_to_topic_file <- system.file(rmd_topics_path,
                                      topic_file_ext,
                                      package = "introverse")
    if (!(file.exists(path_to_topic_file))) {
      stop("\n\nError: The provided topic file does not exist.")
    }
    all_rmd_files <- topic_file_ext
  }
  
    
  # Render each of them in a super duper efficient manner
  for (rmd_file in all_rmd_files){
    # need this for learnr 
    html_file <- gsub(".Rmd$", ".html", rmd_file) # can be used for both standalone and learnr
    if (verbose) print(rmd_file)
    
    # Convert to html
    rmarkdown::render(
      system.file(rmd_topics_path, rmd_file, package = "introverse"),
      output_file = file.path(
        system.file(html_topics_path, package = "introverse"), 
        html_file
      ),
      quiet = TRUE)
    
  }
  # return invisible
  return(invisible())
}


