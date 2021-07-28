# Hi! Run this to build the pkgdown site!
args = commandArgs(trailingOnly=TRUE)


htmlify <- as.logical(args[1]) 

if (is.na(htmlify)) htmlify <- FALSE

if (htmlify)
{
  
  ## Step 1: Load em up
  devtools::load_all()
  
  ## Step 2: HTMLify all the Rmds
  rmd_dir <- system.file("rmd_topics", package = "introverse")
  
  html_dir <- file.path(rprojroot::find_root(".git/index"), 
                      "docs/introverse_docs/")
  
  
  # I can loop if I want to, I can leave my fRiends behind.
  for (category in names(topic_list))
  {
    #print(category)
    for (topic in topic_list[[category]])
    {
      redirected_topic <- redirect_topic(topic)
      name <- glue::glue("{category}_{redirected_topic}")
      rmd_file <- file.path(rmd_dir, glue::glue("{name}.Rmd"))
      html_file <- file.path(html_dir, glue::glue("{name}.html"))
      withr::with_options(c(width = 100),
                          rmarkdown::render(
                            rmd_file,
                            output_file = html_file,
                            quiet = TRUE)
      )  
    }
    
  }
}

pkgdown::build_site(run_dont_run = TRUE)
