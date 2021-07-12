test_that("render_rmd_topics() works",{
  expect_invisible(render_rmd_topics())
  
  expect_invisible(render_rmd_topics(topic_file = "dplyr_filter"))
  expect_invisible(render_rmd_topics(topic_file = "dplyr_filter.Rmd"))
  expect_error(render_rmd_topics(topic_file = "fakefile.Rmd"))
  
})