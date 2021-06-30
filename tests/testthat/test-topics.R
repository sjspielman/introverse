test_that("show_topics() yields output, message, or error appropriately",{
  expect_output(show_topics())
  expect_output(show_topics("dplyr"))

  expect_error(show_topics("faketopic"))
  
  expect_error(show_topics(c("dplyr", "faketopic")))
  
  ############################################################
  # restore when sum() is viewer-ified 
  # expect_output(show_topics(c("dplyr", "base")))
  ## OMG
  #expect_message(
  #  expect_output(show_topics(c("dplyr", "sum")))
  #)
  ## GMO?
  #expect_output(
  #  expect_message(show_topics(c("sum", "dplyr")))
  #)
  ################################################
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


test_that("show_topic_categories() yields output",{
  expect_output(show_topic_categories())
})
