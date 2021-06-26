test_that("topic_list is a list",{
  expect_true(class(topic_list) == "list")
})

test_that("show_topics() yields output",{
  expect_output(show_topics())
})

test_that("get_help() works",{
  expect_output(get_help()) # null
  expect_message(get_help("faketopic"))
  expect_message(get_help(10))
  
  # each topic should give *output*
  test_get_help <- function(x)
  {
    expect_output(get_help(x))
  }
  sapply(unlist(topic_list), test_get_help)
  
})