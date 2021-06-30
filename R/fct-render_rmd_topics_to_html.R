#' Render _all_ md help topics into HTMLs.
#' 
#' @keywords internal
render_rmd_topics_to_html <- function() {
  
  all_rmd_files <- list.files( 
                    system.file(rmd_topics_path, package = "introverse")
  )
  
  # Render each of them in a super duper efficient manner
  for (rmd_file in all_rmd_files){
    html_file <- gsub(".Rmd$", ".html", rmd_file)
    rmarkdown::render(
      # all_rmd_files don't come with path
      system.file(rmd_topics_path, rmd_file, package = "introverse"),
      output_file = file.path(
        system.file(html_topics_path, package = "introverse"), 
        html_file
      ), 
      quiet = TRUE # shh rmarkdown::render
    )
  }
  # return invisible
  return(invisible())
}







