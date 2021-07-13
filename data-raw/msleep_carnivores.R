# Prepare dataset `carnivores` as a smaller version of `ggplot2::msleep` for use in `{introverse}` examples. 
# Get both carnivores and msleep as extdata csv's AND package datasets.
library(dplyr)


msleep <- ggplot2::msleep

# Carnivores only, and then remove a few levels to get 9 rows
# There are NAs in `brainwt` for demonstrating na.rm=TRUE argument in summary statistics, but no NA's in awake.
msleep %>% 
  filter(order == "Carnivora", 
         !(name %in% c("Genet", "Caspian seal", "Domestic cat"))) %>%
  select(name, genus, awake, brainwt) %>%
  arrange(name) -> carnivores

# Save both
usethis::use_data(carnivores, overwrite = TRUE)
usethis::use_data(msleep, overwrite = TRUE)
