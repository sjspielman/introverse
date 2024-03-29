
<!-- README.md is generated from README.Rmd. Please edit that file -->

**Note: This package is no longer under active development. Do you want to continue the project and take it over as your baby? Let me know!**

# introverse

Into the [`tidyverse`](https://www.tidyverse.org/) with the
`introverse`: Accessible and novice-oriented help for getting started
with `R` and data science

<!-- badges: start -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R-CMD-check](https://github.com/sjspielman/introverse/workflows/R-CMD-check/badge.svg)](https://github.com/sjspielman/introverse/actions)<!-- badges: end -->

<img src="logo.png" width="125px" />

(Note: This package is *not* affiliated with
[RStudio](https://www.rstudio.com/) or the
[`tidyverse`](https://www.tidyverse.org/), but their [CC0
hex-stickers](https://github.com/rstudio/hex-stickers) are simply
fantastic.)

The `{introverse}` package provides alternate documentation for
commonly-used functions and concepts in Base `R` and in the `tidyverse`.
The provided resources are meant to *complement, not replace* official
documentation and existing `R` resources. Therefore, the goal of the
`{introverse}` is to provide beginner-oriented help for most
*introductory* topics within `R` and the tidyverse, *not* to provide
comprehensive help about using all of R. We hope `{introverse}` can help
you (and/or your students!) get up-and-running within R and the
`tidyverse`, so that once you get your bearings you can eventually
“graduate” from the `{introverse}` and take advantage of the official
comprehensive documentation/resources.

## Obtaining the `{introverse}`

All `{introverse}` help docs are available online
[here](https://sjspielman.github.io/introverse/articles/introverse_online.html),
or via command line as a package in RStudio as described below.

<br>

#### Step 1: Install the package

First, install the `{introverse}` package by copy/pasting this code into
an R Console. You only need to run this *once*!

    remotes::install_github("sjspielman/introverse")

If you run this line of code and receive the error, \> Error in
loadNamespace(name) : there is no package called ‘remotes’

This error means you first need to install the `{remotes}` package to be
able to install the `{introverse}`. Copy/paste the line of code below
into an R Console, and then try the code
`remotes::install_github("sjspielman/introverse")` again.

    install.packages("remotes") 

If you did not receive that error, `{introverse}` has been installed
properly.

#### Step 2: Load the package.

Now that the `{introverse}` is installed, you are ready to use it! From
the R Console, *load the package* with the code. After you run this, you
will be greeted with a welcome prompt that tells you some basic usage of
the `{introverse}`. *Remember to load the package again for every R
session you want to use it during!*

    library(introverse)

#### Step 3: Get some help!

Head over
[here](https://sjspielman.github.io/introverse/articles/introverse_rstudio.html)
to see how to get started.

<br><br>

### Code of Conduct

Please note that the `{introverse}` project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
