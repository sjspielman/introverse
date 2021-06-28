library(dplyr) # NEEDED

# Used within tests in this suite
test_examples <- function(list_of_examples)
{
  example_code <- lapply(list_of_examples, `[`, 2)
  for (example in example_code)
  {
    expect_s3_class(
      eval(parse(text = example)), 
      c("tbl_df", "data.frame")
    )
  }
}


test_that("Code in all examples runs",{
  for (topic in unlist(topic_list))
  {
    example_name <- glue::glue("examples_", {topic})
    test_examples( 
      eval(parse(text = paste0(example_name, "()")))
    )
  }
})
  
