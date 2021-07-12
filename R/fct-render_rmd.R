#' Render _all_ Rmd help topics into HTML versions.
#' 
#' @keywords internal
#' @param verbose Whether to print rendered topics as we go.
render_rmd_topics <- function(verbose = FALSE) {
  
  all_rmd_files <- list.files( 
                    system.file(rmd_topics_path, package = "introverse"), 
                    pattern = ".Rmd"
  )
  
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


