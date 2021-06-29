test_that("show_topics() yields output, message, or error appropriately",{
  expect_output(show_topics())
  expect_output(show_topics("dplyr"))
  expect_output(show_topics(c("dplyr", "base")))

  expect_error(show_topics("faketopic"))
  
  expect_error(show_topics(c("dplyr", "faketopic")))
  # OMG
  expect_message(
    expect_output(show_topics(c("dplyr", "sum")))
  )
  # GMO?
  expect_output(
    expect_message(show_topics(c("sum", "dplyr")))
  )
  
})


test_that("show_topic_categories() yields output",{
  expect_output(show_topic_categories())
})
