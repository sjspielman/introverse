library(dplyr)
set.seed(42)

top_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))
setwd(top_dir)

extdata_pengs <- file.path("extdata", "pengs.csv")

palmerpenguins::penguins %>%
  dplyr::sample_n(10) %>%
  dplyr::select(species,
                island,
                flipper_length_mm, 
                body_mass_g, 
                year) -> pengs
usethis::use_data(pengs, overwrite=TRUE)
readr::write_csv(pengs, extdata_pengs)
