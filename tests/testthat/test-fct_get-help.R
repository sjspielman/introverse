test_that("topic_list is a list",{
  expect_true(class(topic_list) == "list")
})

test_that("show_topics() yields output",{
  expect_output(show_topics())
})

test_that("get_help() works",{
  expect_output(get_help()) # null
  expect_message(get_help("faketopic"))

  # Add topics here - implicitly tests the introverse_<f> functions...
  expect_output(get_help("filter"))
  expect_output(get_help("select"))
  expect_output(get_help("mutate"))
  
})