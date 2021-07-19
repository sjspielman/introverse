# Prepare dataset `carnivores` as a smaller version of `ggplot2::msleep` for use in `{introverse}` examples, and two smaller tibbles for use in demonstrating joins.
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


### Joins -----------------
msleep %>% 
  filter(name %in% c("Dog", "Pig", "Rabbit", "Tiger")) %>% 
  select(name, vore, conservation) %>%
  arrange(name) -> first_tibble


msleep %>% 
  filter(name %in% c("Dog", "Pig", "Rabbit", "Sheep")) %>% 
  select(name, vore, order) %>%
  arrange(name)-> second_tibble

# Save both
usethis::use_data(first_tibble, overwrite = TRUE)
usethis::use_data(second_tibble, overwrite = TRUE)
