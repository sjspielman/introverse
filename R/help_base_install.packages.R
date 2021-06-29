#' Description for base::install.packages()
#' @noRd
description_install.packages <- function()
{
  "The `install.packages()` function comes with R and is part of the {utils} package.
  
  We use this function install packages (aka libraries) onto your computer. Libraries only need to be installed one time. To load an installed library, use the function `library()`. If you need to install a package from a non-default database (i.e. not CRAN), this function may or may not work."
}

#' Conceptual usage for base::install.packages()
#' @noRd
conceptual_usage_install.packages <- function()
{
  c("install.packages('name of package to install in quotes')",
    "install.packages(c('array', 'of', 'package', 'names', 'to', 'install'))"
    )
}


#' Examples for base::install.packages()
#' @noRd
examples_install.packages <- function()
{
  list(
    c(
    "Install the viridis package",
    "install.packages('viridis')"
    )
  )
}
