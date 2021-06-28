test_that("Usages and descriptions give characters",{
  for (topic in unlist(topic_list))
  {
    usage_name <- glue::glue("conceptual_usage_", {topic}, "()")
    descr_name <- glue::glue("description_", {topic}, "()")
    
    expect_type( 
      eval(parse(text = usage_name)), 
      "character"
    )
    expect_type( 
      eval(parse(text = descr_name)), 
      "character"
    )
    
  }
})
  
