# Prepare dataset `carnivores` as a smaller version of `ggplot2::msleep` for use in `{introverse}` examples. Save within package _and_ in extdata.
library(dplyr)


# Carnivores only, and then remove a few levels to get 9 rows
# There are NAs in `brainwt` for demonstrating na.rm=TRUE argument in summary statistics, but no NA's in awake.
ggplot2::msleep %>% 
  filter(order == "Carnivora", 
         !(name %in% c("Genet", "Caspian seal", "Domestic cat"))) %>%
  select(name, genus, awake, brainwt) %>%
  arrange(name) -> carnivores

usethis::use_data(carnivores, overwrite = TRUE)

# also, write it for use in the Rmds.
proj_root <- rprojroot::find_root(rprojroot::has_dir(".git"))
output_csv <- file.path(proj_root, "inst", "extdata", "carnivores.csv")
readr::write_csv(carnivores, output_csv)