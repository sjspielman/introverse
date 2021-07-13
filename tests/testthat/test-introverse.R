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

test_that("get_help() reveals help aka returns invisible", {
  ##### Check first that we are in an RStudio session.
  if (rstudioapi::isAvailable()) {
    # each topic should return invisible, implicitly testing `reveal_help()`
    test_get_help <- function(x)
    {
      expect_invisible(get_help(x))
    }
    sapply(unlist(topic_list), test_get_help)
  }
})