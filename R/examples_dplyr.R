#' Examples for dplyr::select
#' @noRd
examples_select <- function()
{
  list(
    c(
    "Keep only the column `species` from penguins", 
    "penguins %>%
    select(species)"
    ),
    c(
    "Keep only the columns `species` and `bill_depth_mm` (in that order!) from penguins",
    "penguins %>%
    select(species, bill_depth_mm)"
    ),
    c(
    "Remove only the column `species` from penguins",
    "penguins %>%
     select(-species)"
    ),
    c(
    "Remove only the columns `species` and `bill_depth_mm` from penguins",
    "penguins %>%
    select(-species, -bill_depth_mm)"  
    ), 
    c(
    "Reorder the columns so `sex` comes first, followed by everything else, using the helper {tidyselect} function `everything()`",
    "penguins %>%
     select(sex, everything())"
    )    
  )
}
  
#' Examples for dplyr::rename
#' @noRd
examples_rename <- function()
{
  list(
    c(
      "Rename the `species` column to the new name `penguin_species`", 
      "penguins %>%
      rename(penguin_species = species)"
    ),
    c(
      "Rename the `species` column to `penguin_species`, and rename the `flipper_length_mm` column to `flipper`", 
      "penguins %>%
      rename(penguin_species = species,
        flipper = flipper_length_mm)"
    )
  ) 
}


  
  
#' Examples for dplyr::filter
#' @noRd
examples_filter <- function()
{
  list(
    c(
      "Subset to only 'Gentoo' Species (rows where it is TRUE that species == 'Gentoo')", 
      "penguins %>%
      filter(species == 'Gentoo')"
    ),
    c(
      "Subset to penguins whose bill lengths are greater than 45 mm",
      "penguins %>%
      filter(bill_length_mm > 45)"
    ),
    c(
      "Subset to Gentoo penguins from the island Biscoe",
      "penguins %>%
      filter(species == 'Gentoo', island == 'Biscoe')"
    )
  )
}
  
#' Examples for dplyr::slice
#' @noRd
examples_slice <- function()
{
  list(
    c(
      "Keep only the 3rd row from penguins", 
      "penguins %>%
      slice(3)"
    ),
    c(
      "Keep only rows 1, 4, and 8 from penguins", 
      "penguins %>%
      slice(1, 4, 8)"
    ),
    c(
      "Keep only the first 15 rows from penguins", 
      "penguins %>%
      slice(1:15)"
    ),
    c(
      "Remove the first two rows from penguins", 
      "penguins %>%
      slice(-(1:2))"
    )
  )
}



#' Examples for dplyr::mutate
#' @noRd
examples_mutate <- function()
{
  list(
    c(
      "Create a new column called `my_new_column` that literally contains the value `5` at all rows", 
      "penguins %>%
      mutate(my_new_column = 5)"
    ),
    c(
      "Create a new column called `bill_length_cm` that contains bill lengths in cm (aka `bill_length_mm` values divided by 10)", 
      "penguins %>%
      mutate(bill_length_cm = bill_length_mm / 10)"
    ),
    c(
      "Create two new columns: `flipper_squared` containing the squared values of flipper lengths, and `island_lower` containing the island names all in lowercase", 
      "penguins %>%
      mutate(flipper_squared = flipper_length_mm**2,
        island_lower    =  tolower(island) )"
    ),
    c(
      "Change the `year` column into a factor column. `mutate()` will overwrite columns", 
      "penguins %>%
      mutate(year = as.factor(year))"
    )
  )
}
  
  
#' Examples for dplyr::arrange
#' @noRd
examples_arrange <- function()
{
  list(
    c(
      "Arrange in ascending alphabetal order of island", 
      "penguins %>%
      arrange(island)"
    ),
    c(
      "Arrange in descending alphabetal order of island", 
      "penguins %>%
      arrange(desc(island))"
    ),
    c(
      "Arrange in ascending order of flipper length", 
      "penguins %>%
      arrange(flipper_length_mm)"
    ),
    c(
      "Arrange in descending order of flipper length", 
      "penguins %>%
      arrange(desc(flipper_length_mm))"
    )
  )
}



#' Examples for dplyr::distinct
#' @noRd
examples_distinct <- function()
{
  list(
    c(
      "Remove duplicate rows from penguins", 
      "penguins %>%
      distinct()"
    )
  )
}


#' Examples for dplyr::summarize
#' @noRd
examples_summarize <- function()
{
  list(
    c(
      "Calculate the mean of penguin bill depth. The bill depth column contains NA's so use `na.rm=TRUE` *argument with mean()*", 
      "penguins %>%
      summarize(mean_bill_depth = mean(bill_depth_mm, na.rm = TRUE))"
    ),
    c(
      "Calculate the maximum value of body mass", 
      "penguins %>%
      summarize(max_body_mass = max(body_mass_g, na.rm = TRUE))"
    ),
    c(
      "Calculate the median body mass separately for each species (using `group_by!`)", 
      "penguins %>%
      group_by(species) %>%
      summarize(med_body_mass = median(body_mass_g, na.rm = TRUE))"
    ),
    c(
      "Calculate the median body mass for each combination of island and species (using `group_by!`)", 
      "penguins %>%
      group_by(species, island) %>%
      summarize(med_body_mass = median(body_mass_g, na.rm = TRUE))"
    )
  )
}

#' Examples for dplyr::group_by
#' @noRd
examples_group_by <- function()
{
  list(
    c(
    "Establish a species grouping, and then calculate the mean bill depth for each species group. Ungroup when finished. The bill depth column has NA's so use `na.rm=TRUE` *argument with mean()*",
    "penguins %>%
     group_by(species) %>%  
     summarize(mean_bill_depth = mean(bill_depth_mm, na.rm = TRUE)) %>%
     ungroup()"
    ),
    c(
    "Calculate the smallest bill depth seen each year (as in, in each year grouping)",
    "penguins %>%
     group_by(year) %>%  
     summarize(min_bill_depth = min(bill_depth_mm, na.rm = TRUE)) %>%
     ungroup()"
    ),
    c(
      "Calculate the median body mass for each combination of island and species", 
      "penguins %>%
      group_by(species, island) %>%
      summarize(med_body_mass = median(body_mass_g, na.rm = TRUE))"
    )
  )
}

#' Examples for dplyr::ungroup, from group_by examples (needs to exists for tests to pass)
#' @noRd
examples_ungroup <- function()
{
  examples_group_by()
}

    