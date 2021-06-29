#' Description for mathematical operators
#' @noRd
description_math <- function()
{
  "Mathematical operators (symbols to do math with) in R include the following:
  
  +         Addition
  -         Subtraction
  *         Multiplication
  /         Division
  ^ or **   Exponentiation (no space in between the **)
  
All operators can be used on individual numbers or with numeric arrays."
}



#' Examples for mathematical operators
#' @noRd
examples_math <- function()
{
  list(
    c(
    "Add two numbers",
    "5+8"
    ),
    c(
    "Subtract two numbers",
    "5-8"
    ),
    c(
    "Divide two numbers",
    "5/8"
    ),
    c(
    "Multiply two numbers",
    "5*8"
    ),
    c(
    "Raise 5 to the 8th power",
    "5^8"
    ),
    c(
    "Raise 5 to the 8th power (equivalent to above)",
    "5**8"
    ),
    c(
    "Add the number 5 to every value in a numeric array",
    "5 + c(45, 65, 85, 105)"
    ), 
    c(
    "Square every value in a numeric array",
    "c(45, 65, 85, 105)^2"
    )
  )
}
