test_that("show_topics() yields output, message, or error appropriately",{
  expect_output(show_topics())
  expect_output(show_topics("dplyr"))
  
  expect_message(show_topics("filter"))
  
  expect_error(show_topics("faketopic"))
  expect_error(show_topics(c("dplyr", "faketopic")))

})

test_that("show_categories() yields output",{
  expect_output(show_categories())
})


test_that("find_topic_category() finds the right category or errors",{
  
  for (true in names(topic_list)) {
    topics <- topic_list[[true]]
    for (topic in topics){
      expect_equal(
        find_topic_category(topic),
        true
      )
    }
  }
  
  # Should error with fake topic
  expect_error(
    find_topic_category("faketopic")
  )
  
})


test_that("get_help() yields output, message, or error appropriately",{
  expect_output(get_help()) # null
  
  expect_error(get_help("faketopic"))
  expect_error(get_help(10))
  
  expect_message(get_help("dplyr"))
})


test_that("contents of rmd_topics match topics_list", {
  
  rmd_files <- list.files(
    system.file("rmd_topics", package = "introverse"), 
    pattern = ".Rmd"
  )
  list_names <- sort(unique(stringr::str_match(rmd_files, "^([a-z]+2*)_")[,2]))  #2* in regex for ggplot2
  
  pername <- function(name)
  {
    rmd_files[stringr::str_detect(rmd_files, name)] %>%
      stringr::str_replace(glue::glue("^{name}_"), "") %>%
      stringr::str_replace(glue::glue(".Rmd$"), "") %>%
      sort()
  }
  test_list <- purrr::map(list_names, pername)
  names(test_list) <- list_names
  
  expect_equal(test_list, topic_list)

})



test_that("logical, math, assignment operators redirect", {
  
  purrr::map(operators, convert_operator_into_topic) -> converted
  expect_true(all(converted %in% topic_list[["operators"]]))
  expect_error(convert_operator_into_topic("should not work"))
  
})

test_that("magrittr redirect", {
  
  expect_true(convert_magrittr_into_topic("%>%") == "pipe")
  expect_true(convert_magrittr_into_topic("%<>%") == "apipe")
  expect_error(convert_magrittr_into_topic("should not work"))

  expect_true(convert_topic_into_magrittr("pipe") == "%>%")
  expect_true(convert_topic_into_magrittr("apipe") == "%<>%")
  expect_error(convert_topic_into_magrittr("should not work"))
  
})

test_that("get_help() reveals help aka returns invisible", {
  
  # each topic should return invisible, implicitly testing `reveal_help()`
  test_get_help <- function(x)
  {
    expect_invisible(get_help(x))
  }
  sapply(unlist(topic_list), test_get_help)
  
  # Test for browser=TRUE
  expect_invisible(get_help("filter", browser=TRUE))
})

