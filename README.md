# introverse

Accessible and beginner-oriented help for getting started in R and the [`tidyverse`](https://www.tidyverse.org/), led by [Stephanie J. Spielman, PhD](https://spielmanlab.github.io). 

**_EXTREMELY_ UNDER DEVELOPMENT**

<!-- badges: start --> 
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental) 
[![R-CMD-check](https://github.com/spielmanlab/introverse/workflows/R-CMD-check/badge.svg)](https://github.com/spielmanlab/introverse/actions)
<!-- badges: end -->


<img src="logo.png" height="200px"/>

Note: This package is _not_ affiliated with [RStudio](https://www.rstudio.com/) or the [`tidyverse`](https://www.tidyverse.org/), but their [CC0 hex-stickers](https://github.com/rstudio/hex-stickers) are simply fantastic.



The `{introverse}` package provides alternate documentation for commonly-used functions in base `R` and in the `tidyverse`. The provided resources are meant to _complement, not replace_ official documentation and existing `R` resources. Therefore, the goal of the `{introverse}` is to provide beginner-oriented help for most _introductory_ topics within `R` and the tidyverse, _not_ to provide comprehensive help about using all of R. We hope `{introverse}` can help you (and/or your students!) get up-and-running within R and the `tidyverse`, so that once you get your bearings you can eventually "graduate" from the `{introverse}` and take advantage of the official comprehensive documentation/resources.

<br><br>

## Obtaining the `{introverse}`

#### Step 1: Install the package

First, install the `{introverse}` package by copy/pasting this code into an R Console. You only need to run this _once_!

```
remotes::install_github("spielmanlab/introverse")
```

If you run this line of code and receive the error, 
> Error in loadNamespace(name) : there is no package called ‘remotes’

This error means you first need to install the `{remotes}` package to be able to install the `{introverse}`. Copy/paste the line of code below into an R Console, and then try the code `remotes::install_github("spielmanlab/introverse")` again.

```
install.packages("remotes") 
```

If you did not receive that error, `{introverse}` has been installed! Good job!

<br><br>
 
#### Step 2: Load the package. 
Now that the `{introverse}` is installed, you are ready to use it! From the R Console, _load the package_ with the code. After you run this, you will be greeted with a welcome prompt that tells you some basic usage of the `{introverse}`. _Remember to load the package again for every R session you want to use it during!_

```
library(introverse)
```

<br>

## Ready to start?

Head over [here](https://spielmanlab.github.io/introverse/)!


## Code of Conduct

Please note that the `{introverse}` project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.

#### Undergraduate student contributors:

+ [John ("Jake") Kovaleski](https://github.com/jakekova) (Fall 2020 - Present)
+ [Judith Evans](https://github.com/judithepevans) (Spring 2021 - Present)
