#' Description for logical operators
#' @noRd
description_logical <- function()
{
  # test this separately
  cat( # need cat for the %+%
    "Logical operators, symbols you can make comparisons with **that tell you TRUE or FALSE** in R include the following, using placeholders `X` and `Y` to represent values/variables being compared:
    
    (lhs means 'left-hand side' and rhs means 'right-hand side'. For example in `2+3`, 2 is the lhs and 3 is the rhs.)
    
          
    X " %+% crayon::inverse("==") %+% " Y          Is X " %+% crayon::bold("equal to") %+% " rhs? Must use DOUBLE equals!
    X " %+% crayon::inverse(">") %+% " Y           Is X " %+% crayon::bold("greater than") %+% " rhs?
    X " %+% crayon::inverse(">=") %+% " Y          Is X " %+% crayon::bold("greater than or equal to") %+% " rhs?
    X " %+% crayon::inverse("<") %+% " Y           Is X " %+% crayon::bold("less than") %+% " rhs?
    X " %+% crayon::inverse("<=") %+% " Y          Is X " %+% crayon::bold("less than or equal to") %+% " rhs?" %+%
    crayon::inverse("!(") %+% "X == Y" %+% crayon::inverse(")") %+% "          Is X " %+% crayon::bold("NOT equal to") %+% " rhs?" %+%
    crayon::inverse("!(") %+% "X > Y" %+% crayon::inverse(")") %+% "         Is X " %+% crayon::bold("NOT greater than") %+% " rhs? and etc. for `!` making comparisons things 'NOT')
    X " %+% crayon::inverse("%in%") %+% " Y_ARRAY          Is X " %+% crayon::bold("a value inside the array") %+% " Y_ARRAY?"
  )
}



#' Examples for logical operators
#' @noRd
examples_logical <- function()
{
  list(
    c(
    "Is 10 equal to 12?",
    "10 == 12"
    ),
    c(
    "Is 14 greater than 13.5?",
    "14 > 13.5"
    ),
    c(
    "Is the following array a length of 6? ",
    "length( c(1, 1, 2, 3, 5, 8, 13)  ) == 6"
    ),
    c(
    "Does the following string have less than or equal to 7 characters?",
    "nchar('im a string being evaluated') <= 7"
    ),
    c(
    "Is 55 not greater than 27?",
    "!(55 > 27)"
    ),
    c(
    "Is the word 'elephant' in the following array?",
    "'elephant' %in% c('hippopotamus', 'giraffe', 'zebra', 'elephant')"
    ),
    c(
    "Is 2003 in the penguins `year` column (were penguins observed in 2003?)",
    "2003 %in% penguins$year"
    )
  )
}
