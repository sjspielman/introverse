# introverse

Approachable, beginner-oriented help for getting started in R and [`tidyverse`](https://www.tidyverse.org/), led by [Stephanie J. Spielman, PhD](https://spielmanlab.github.io). 

**_EXTREMELY_ UNDER DEVELOPMENT**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental) 
[![R-CMD-check](https://github.com/spielmanlab/introverse/workflows/R-CMD-check/badge.svg)](https://github.com/spielmanlab/introverse/actions)



#### Student contributors:
<!--
+ [Madeline ("Maddie") Greene](https://github.com/greenemadeline) (Fall 2020 - Present) -->
+ [John ("Jake") Kovaleski](https://github.com/jakekova) (Fall 2020 - Present)
+ [Shemaiah Sotrah](https://github.com/shemaiah-s) (Summer 2020)
+ [Judith Evans](https://github.com/judithepevans) (Spring 2021 - Present)



The `{introverse}` package provides alternate documentation for commonly-used functions in base R and in the `tidyverse`. The provided resources are meant to _complement, not replace_ official documentation and existing R resources. Therefore, the goal of the `{introverse}` is to provide beginner-oriented help for most _introductory_ topics within R and the tidyverse, _not_ to provide comprehensive help about using all of R. We hope `{introverse}` can help you (and/or your students!) get up-and-running within R and the `tidyverse`, so that once you get your bearings you can eventually "graduate" from the `{introverse}` and take advantage of the official comprehensive documentation/resources.

<br><br>

## Obtaining the `{introverse}`

#### Step 1: Install the package

First, install the `{introverse}` package by copy/pasting this code into an R Console. You only need to run this _once_!

```
remotes::install_github("introverse")
```

If you run this line of code and receive the error, 
> Error in loadNamespace(name) : there is no package called ‘remotes’

This error means you first need to install the `{remotes}` package to be able to install the `{introverse}`. Copy/paste the line of code below into an R Console, and then try the code `remotes::install_github("introverse")` again.

```
install.packages("remotes") 
```

If you did not receive that error, `{introverse}` has been installed! Good job!

<br><br>
 
#### Step 2: Load the package. 
Now that the `{introverse}` is installed, you are ready to use it! From the R Console, _load the package_ with the code. After you run this, you will be greeted with a welcome prompt that tells you some basic usage of the `{introverse}`.

```
library(introverse)
```

<br><br>

## Getting help in the `{introverse}`

#### What topics can I get help on?

To see all currently available help topics, run the following command. The function `show_topics()` will print all topic _categories_ and all associated topics within each category. 

```
show_topics()
```

<br>


#### Woah, there's a lot of topics! Can I just see the topic categories to narrow it down?

Yes, you can! Use this function:

```
show_categores()
```

<br>

#### I know I want help using `{dplyr}`. Can I see only the `{dplyr}` help topics?

Absolutely! You can see _only_ those topics for a given category with `show_topics("category of interest")`. For example, to see the `{dplyr}` topics, you would run...

```
show_topics("dplyr") # Don't forget to use quotes!
```

<br>

#### I know the topic I want help for! Show me how to get help already!!

Use the function `get_help()` to get help for a particular topic. For example, to get help using the `filter()` function in `{dplyr}`, you can run:

```
get_help("filter")  # Don't forget to use quotes!
```

If you prefer for the help to automatically appear in your browser instead of in the RStudio Viewer pane, you can use the _second argument_ `browser = TRUE` when using `get_help()`. For example:

```
get_help("filter", browser = TRUE)  # Don't forget to use quotes!
```

## Code of Conduct

Please note that the introverse project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
