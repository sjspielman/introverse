# Hi! Run this to build the pkgdown site!

options(rmarkdown.html_vignette.check_title = FALSE)

args = commandArgs(trailingOnly=TRUE)
htmlify <- as.logical(args[1]) 
if (is.na(htmlify)) htmlify <- FALSE
htmlify<-TRUE
if (htmlify)
{
  
  ## Step 1: Load em up
  devtools::load_all()
  
  ## Step 2: HTMLify all the Rmds
  rmd_dir <- system.file("rmd_topics", package = "introverse")
  
  html_dir <- file.path(rprojroot::find_root(".git/index"), 
                      "docs/introverse_docs/")
  # Purge!
  system(paste0("rm ",html_dir, "*html"))
  #!!!!!! STEPH IF YOU'RE GONNA SUBSET CATEGORIES DON'T DELETE EVERYTHING!!!!!!!
  
  # I can loop if I want to, I can leave my fRiends behind.
  for (category in names(topic_list)) #STEPH!!!!!!!!!
  {
    category <- "tidyselect"
    topic <- "tidyselect"
    for (topic in topic_list[[category]])
    {

      #category <- "base"
      #topic <- "names"
      redirected_topic <- redirect_topic(topic)
      print(redirected_topic)
      name <- glue::glue("{category}_{redirected_topic}")
      rmd_file <- file.path(rmd_dir, glue::glue("{name}.Rmd"))
      html_file <- file.path(html_dir, glue::glue("{name}.html"))
      #if (file.exists(html_file)) next
      withr::with_options(c(width = topic_width),
                            rmarkdown::render(
                            rmd_file,
                            output_file = html_file,
                            quiet = TRUE)
      )  
    }
    
  }
}

pkgdown::build_site(run_dont_run = TRUE)
