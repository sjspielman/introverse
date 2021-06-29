library(dplyr) # NEEDED




test_that("Code in all dplyr verb examples run",{
  
  exclude <- c("glimpse", "if_else", "pull")
  test_topics <- unlist(topic_list["dplyr"])
  test_topics <- test_topics[!(test_topics %in% exclude) ]
  
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
  
  # Go through each example of each topic
  for (topic in test_topics)
  {
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

test_that("Code in dplyr::pull example works",{
  the_only_example <- examples_pull()[[1]][2]
  expect_equal(
    eval(parse(text = the_only_example)), 
    penguins$species
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

test_that("Code in length, nchar, nrow (ncol) examples produces integers",{
  all_examples <- c(lapply(examples_length(), `[`, 2),
                    lapply(examples_nchar(), `[`, 2),
                    lapply(examples_nrow(), `[`, 2))
  for (example in all_examples)
  {
    expect_type(
      eval(parse(text = example)), 
      "integer"
    )    
  }
})

test_that("Code in various examples produces *doubles*",{
  
  doublers <- c("log", "sqrt", "mean", "median", "min", "max", "sd", "sum")
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


test_that("Code in base::ifelse() and dplyr::if_else() examples works",{
  # base three examples: returns 7, 5 and a tibble
  expect_equal(
    eval(parse(text = examples_ifelse()[[1]][2])),
    7
  )
  expect_equal(
    eval(parse(text = examples_ifelse()[[2]][2])),
    5
  )  
  expect_s3_class(
    eval(parse(text = examples_ifelse()[[3]][2])),
    c("tbl_df", "data.frame")
  )    
  # dplyr three examples: returns 7, ERROR and a tibble
  expect_equal(
    eval(parse(text = examples_if_else()[[1]][2])),
    7
  )
  expect_error(
    eval(parse(text = examples_if_else()[[2]][2]))
  )  
  expect_s3_class(
    eval(parse(text = examples_if_else()[[3]][2])),
    c("tbl_df", "data.frame")
  )    
})


test_that("Code in levels examples works",{
  expect_equal(
    eval(parse(text = examples_levels()[[1]][2])), 
    levels(penguins$species), ignore_attr=TRUE # Deprecation for expect_equivalent: "Use expect_equal(ignore_attr = TRUE)"
  )    
  expect_null(
    eval(parse(text = examples_levels()[[2]][2]))
  ) 
})


test_that("Code in class examples works",{
  expect_equal(
    eval(parse(text = examples_class()[[1]][2])), 
    "numeric"
  )    
  expect_equal(
    eval(parse(text = examples_class()[[2]][2])), 
    "character"
  )  
  expect_equal(
    eval(parse(text = examples_class()[[3]][2])), 
    "numeric"
  )   
})



test_that("Code in c() examples works",{
  expect_equal(
    eval(parse(text = examples_c()[[1]][2])), 
    c(8, 5, 3, 6, 1, 2, 7, 88)
  )    
  expect_equal(
    eval(parse(text = examples_c()[[2]][2])), 
    c('a', 'e', 'i', 'o', 'u', 'y')
  )  
})



test_that("Code in ceiling()/floor() examples works",{
  expect_equal(
    eval(parse(text = examples_ceiling()[[1]][2])), 
    6
  )    
  expect_equal(
    eval(parse(text = examples_ceiling()[[2]][2])), 
    5
  )  
})


test_that("Code in table examples works",{
  expect_equal(
    eval(parse(text = examples_table()[[1]][2])), 
    table(penguins$species)
  ) 
  expect_equal(
    eval(parse(text = examples_table()[[2]][2])), 
    table(penguins$species, penguins$sex)
  ) 
  expect_equal(
    eval(parse(text = examples_table()[[3]][2])), 
    table(penguins$sex, penguins$species)
  ) 
  
})


test_that("Code in data.frame examples works",{
  expect_equal(
    eval(parse(text = examples_data.frame()[[1]][2])), 
    data.frame(a = 1:6, b = c('a', 'e', 'i', 'o', 'u', 'y') ),
    ignore_attr=TRUE
  )    
})


test_that("Code in file.path examples works",{
  expect_equal(
    eval(parse(text = examples_file.path()[[1]][2])), 
    file.path('path', 'to', 'data', 'file.txt'),
    ignore_attr=TRUE
  ) 
  expect_equal(
    eval(parse(text = examples_file.path()[[2]][2])), 
    file.path('..', 'path', 'to', 'data', 'file.txt'),
    ignore_attr=TRUE
  )
  expect_equal(
    eval(parse(text = examples_file.path()[[3]][2])), 
    file.path('..', '..', 'path', 'to', 'data'),
    ignore_attr=TRUE
  )  
  
})


test_that("Code in file.exists/dir.exists examples works",{
  expect_type(
    eval(parse(text = examples_file.exists()[[1]][2])), 
    "logical"
  ) 
  expect_type(
    eval(parse(text = examples_file.exists()[[2]][2])), 
    "logical"
  )
})





test_that("Code in as.factor/as.numeric/as.character examples works",{
  # factor
  expect_s3_class(
    eval(parse(text = examples_as.factor()[[1]][2])), 
    "factor"
  ) 
  expect_s3_class(
    eval(parse(text = examples_as.factor()[[2]][2])) %>% dplyr::pull(year), 
    "factor"
  )
  
  # numeric
  expect_equal(
    eval(parse(text = examples_as.numeric()[[1]][2])), 
    10
  ) 
  expect_warning( # warns since coerces --> NA
    eval(parse(text = examples_as.numeric()[[2]][2]))
  ) 
  expect_equal(
    eval(parse(text = examples_as.numeric()[[3]][2])), 
    1
  ) 
  expect_equal(
    eval(parse(text = examples_as.numeric()[[4]][2])), 
    0
  ) 
  
  # character
  expect_equal(
    eval(parse(text = examples_as.character()[[1]][2])), 
    '10'
  ) 
  expect_equal(
    eval(parse(text = examples_as.character()[[2]][2])),
    "TRUE"     
  ) 
})

test_that("Code for mathematical operators works",{

  expect_equal(
    eval(parse(text = examples_math()[[1]][2])), 
    5+8
  )
  expect_equal(
    eval(parse(text = examples_math()[[2]][2])), 
    5-8
  )
  expect_equal(
    eval(parse(text = examples_math()[[3]][2])), 
    5/8
  )
  expect_equal(
    eval(parse(text = examples_math()[[4]][2])), 
    5*8
  )
  expect_equal(
    eval(parse(text = examples_math()[[5]][2])), 
    5^8
  )
  expect_equal(
    eval(parse(text = examples_math()[[6]][2])), 
    5**8
  )
  expect_equal(
    eval(parse(text = examples_math()[[7]][2])), 
    5 + c(45, 65, 85, 105)
  )
  expect_equal(
    eval(parse(text = examples_math()[[8]][2])), 
    c(45, 65, 85, 105)^2
  )
  
})


test_that("Code for logical operators works",{
  
  expect_equal(
    eval(parse(text = examples_logical()[[1]][2])), 
    10 == 12
  )
  expect_equal(
    eval(parse(text = examples_logical()[[2]][2])), 
    14 > 13.5
  )
  expect_equal(
    eval(parse(text = examples_logical()[[3]][2])), 
    length( c(1, 1, 2, 3, 5, 8, 13)  ) == 6
  )
  expect_equal(
    eval(parse(text = examples_logical()[[4]][2])), 
    nchar('im a string being evaluated') <= 7
  )
  expect_equal(
    eval(parse(text = examples_logical()[[5]][2])), 
    nchar('!(55 > 27)') <= 7
  )
  expect_equal(
    eval(parse(text = examples_logical()[[6]][2])), 
    'elephant' %in% c('hippopotamus', 'giraffe', 'zebra', 'elephant')
  )
  expect_equal(
    eval(parse(text = examples_logical()[[7]][2])), 
    2003 %in% penguins$year
  )
})