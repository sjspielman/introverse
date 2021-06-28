library(dplyr) # NEEDED


# Used within tests in this suite
test_dplyr_examples <- function(list_of_examples)
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


test_that("Code in all dplyr verb examples run",{
  
  exclude <- c("glimpse")
  for (topic in unlist(topic_list["dplyr"]))
  {
    if (topic %in% exclude) next
    example_name <- glue::glue("examples_", {topic}, "()")
    test_dplyr_examples( 
      eval(parse(text = example_name))
    )
  }
})


test_that("Code in dplyr::glimpse example works",{
  the_only_example <- examples_glimpse()[[1]][2]
  expect_equal(
    eval(parse(text = the_only_example)), 
    glimpse(penguins), ignore_attr=TRUE # Deprecation for expect_equivalent: "Use expect_equal(ignore_attr = TRUE)"
  )    
})


test_that("Code in head/tail examples produces tibbles",{
  all_examples <- lapply(examples_head(), `[`, 2)
  for (example in all_examples)
  {
    expect_type(
      eval(parse(text = example)), 
      "list" # TIBBLE. not great. 
    )    
  }
})

test_that("Code in length, nchar examples produces integers",{
  all_examples <- lapply(examples_length(), `[`, 2)
  all_examples <- c(all_examples, 
                    lapply(examples_nchar(), `[`, 2))
  for (example in all_examples)
  {
    expect_type(
      eval(parse(text = example)), 
      "integer"
    )    
  }
})

test_that("Code in various examples produces *doubles*",{
  
  doublers <- c("log", "sqrt", "mean", "median", "min", "max", "sd")
  all_examples <- c()
  for (doubler in doublers)
  {
    fname <- glue::glue("examples_", {doubler}, "()")
    all_examples <- c(all_examples,
                      lapply(eval(parse(text = fname)), `[`, 2)
    )
  }
  for (example in all_examples)
  {
    expect_type(
      eval(parse(text = example)), 
      "double"
    )    
  }
})

test_that("Code in summary examples works",{
  the_only_example <- examples_summary()[[1]][2]
  expect_equal(
      eval(parse(text = the_only_example)), 
      summary(penguins), ignore_attr=TRUE # Deprecation for expect_equivalent: "Use expect_equal(ignore_attr = TRUE)"
  )    
})


  
