#' Render _all_ Rmd help topics into standalone and learnr tutorial HTML versions.
#' 
#' @keywords internal
render_rmd_topics <- function() {
  
  all_rmd_files <- list.files( 
                    system.file(rmd_topics_path, package = "introverse")
  )
  
  # Render each of them in a super duper efficient manner
  for (rmd_file in all_rmd_files){
    # need this for learnr 
    html_file <- gsub(".Rmd$", ".html", rmd_file) # can be used for both standalone and learnr
    
    # Convert to standalone
    render_single_rmd_topic_to_standalone(
      system.file(rmd_topics_path, rmd_file, package = "introverse"),
      file.path(
        system.file(html_topics_path, package = "introverse"), 
        html_file
      )
    )
    # Convert to learnr
    output_path <- system.file(learnr_topics_path, package = "introverse")
    render_single_rmd_topic_to_learnr(
      system.file(rmd_topics_path, rmd_file, package = "introverse"),
      file.path(output_path, rmd_file), 
      output_path
    )    
    
  }
  # return invisible
  return(invisible())
}


#' Render an Rmd help topic page into a standalone HTML
#' 
#' @keywords internal
render_single_rmd_topic_to_standalone <- function(rmd_file, html_file) {
  rmarkdown::render(rmd_file, 
                    output_file = html_file, 
                    quiet = TRUE)
}




#' Render an Rmd help topic page into a learnr tutorial HTML
#' 
#' @keywords internal
render_single_rmd_topic_to_learnr <- function(rmd_file, learnr_file, output_path) {
  
  # Read Rmd file
  rmd_string <- readr::read_file(rmd_file) # single string
  
  # Replace html_document --> learnr::tutorial
  rmd_string <- stringr::str_replace(rmd_string,
                                     "html_document", 
                                     "learnr::tutorial")
  
  # Split into chars AFTER REPLACING HTML_DOCUMENT. 
  rmd_chars <- stringr::str_split(rmd_string, "")[[1]] # individual characters
  
  # Find the end of the YAML and add shiny_prerendered and a learnr chunk
  yaml_bounds <- stringr::str_locate_all(rmd_string, "---")[[1]]
  end_of_rmd <- length(rmd_chars)
  # Make sure 2x2
  if (ncol(yaml_bounds) != 2 | nrow(yaml_bounds) != 2) {
    stop("Could not find YAML to convert Rmd to learnr.")
  }
  
  # The second row is end of yaml
  break_off <- unname(yaml_bounds[2,]['start']) -1 
  resume <- unname(yaml_bounds[2,]['end']) + 1
  
  # do NOT use glue::glue, since there are {} in the string
  paste0(
    paste(rmd_chars[1:break_off], collapse=""), # Top of YAML
    "runtime: shiny_prerendered\n",             # Make this the last line of the YAML 
    "---",                                      # Close the YAML
    learnr_chunk_string,                        # Load learnr (has preceding \n's)
    paste(rmd_chars[resume:end_of_rmd], collapse="") # Rest of the Rmd
  ) -> learnr_text
  
  # Save to file, and render the file
  readr::write_lines(learnr_text, learnr_file)  
  #rmarkdown::render(learnr_file, 
  #                  output_dir = output_path)
}









