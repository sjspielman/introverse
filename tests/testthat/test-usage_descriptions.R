test_that("Usages and descriptions give characters",{
  for (topic in unlist(topic_list))
  {
    descr_name <- glue::glue("description_", {topic}, "()")
    if (topic %in% output_description_topic_list){
      expect_output(
        eval(parse(text = descr_name))
      )
    } else {
      expect_type( 
        eval(parse(text = descr_name)), 
        "character"
      )          
    }

    if (topic %in% no_usage_topic_list) next

    usage_name <- glue::glue("conceptual_usage_", {topic}, "()")
    expect_type( 
      eval(parse(text = usage_name)), 
      "character"
    )
    

    
  }
})
  
