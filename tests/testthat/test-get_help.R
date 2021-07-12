test_that("show_topics() yields output",{
  expect_output(show_topics())
})

test_that("get_help() works",{
  expect_output(get_help()) # null
  expect_error(get_help("faketopic"))
  expect_error(get_help(10))
  
  
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