# Contributing to the `{introverse}` package development

## Before you begin...

Want to learn more about R package development in general? 

1. Official book: https://r-pkgs.org/
2. A good blog post walking you through your first package: https://www.pipinghotdata.com/posts/2020-10-25-your-first-r-package-in-1-hour/
3. You will use the package `devtools` _a lot_ https://devtools.r-lib.org/


## How to contribute to the `{introverse}`

### The whole terminal experience

You'll begin by navigating in the terminal with `cd` to the directory where you have your local `introverse` clone. 
```
# Navigating to the directory where you have your local `introverse` clone. 
cd wherever/that/directory/is/introverse 

# Double chceck that you are in the right directory
pwd # should be --> /homeorUsersorC/username/whatever/whateveretc/introverse  <-- this !!

# Be in the main branch. If this doesn't work or does something really odd, reach out for help. Do not proceed!
git checkout main

# Double check that you are in the main branch
git status

# Make sure you are up to date with your repo, aka your remote
git pull origin main

# Make sure you are up to date with spielmanlab repo (assuming the remote is named `spielman`)
git pull spielman main

# If the last step updated your repo in some way, great! Tell your remote about it 
# If the last step did NOT update your repo in some way, you can skip this line, but it will not hurt if you do run it!
git push origin main

### Now, you are ready to develop!! 

# Create and enter a new branch for development of your feature (do _not_ use new_branch_name)
git checkout -b new_branch_name

# Run git status to make sure you are in the right branch. If it says your new branch's name, you are good to go!
git status

# Code away and write some introverse material! Do the add/commit/push stuff!
### (PS: Remember, the first time you push in this new branch, _it will not work_! 
### git will complain, but it will also give you the right command for how to fix it. 
### Copy/paste and run that command to do your first push. Then, it's back to normal.
# Continue coding and develop! Do the add/commit/push stuff!
```

When you're done coding and developing, all your tests have passed, and you're ready to share with me, go to the [`spielmanlab/introverse`](https://github.com/spielmanlab/introverse) github and file a PULL REQUEST (https://github.com/spielmanlab/introverse/pulls) _from your fork and the branch you've been developing on_ to the `spielmanlab` `main` branch. 

#### Merging back up after you PR has been accepted

```
# again, navigate with cd (and confirm with pwd) to your introverse directory

# Leave your development branch and go back to your main branch
git checkout main

# Sync your main branch with spielmanlab, assuming the remote is named spielman. 
git pull spielman main

# Sync your remote (github.com) repo
git push origin main

# You are now ready to develop again!
```

### Get the `{introverse}` templates

Install the package `introverse.templates` with `remotes::install_github("spielmanlab/introverse.templates")`. You are not cloning a repository - you are installing an R package that Spielman wrote and is only available via in its github repo. Hence, we are not using `install.packages()` because the package is not on CRAN, the main place for all things R. In the [github](https://github.com/spielmanlab/introverse.templates), you'll find instructions on how to get an RMarkdown document in the right format. 


### How to develop new `{introverse}` help docs

> You must be in a new feature branch first!! Scroll back up to the command line as needed! 


1. In RStudio, open your `introverse/` Project session (recommended), or set your working directory to `introverse/`.

2. In Console, run the command: `devtools::load_all()` to _load_ the current version of the package into your R session. 
    + When the `{introverse}` loads, it will print a 2-paragraph welcome message to the Console that begins "Welcome to the {introverse}!". If you see this output, you will know the command worked.

3. Add your topic to the appropriate place in the `topic_list` definition inside `R/fct-topics.R`. 
    + You should _not be guessing_ the appropriate place. You should _already know how and where to do this._ If you don't know, stop and ask Spielman.
  
4. Run `devtools::load_all()` again to update the loaded package with this code addition. 
    + If you get an error of any kind, it means you likely introduced a bug somewhere in the `introverse/R` directory (probably when adding to the `topic_list`). The error should be reasonably informative about how to track down the bug. Fix and re-run the `devtools::load_all()` command until it's all loaded

5. Open a new Rmd introverse docs template file, and save it to the directory `introverse/inst/rmd_topics/`. Write your Rmd help page using the `introverse` template and existing Rmd help pages as guidance. 
    + **You cannot and should not knit this document like normal!!** Instead, you have to interactively re-load the package and use `get_help()` to see the output. **TO KNIT:**
        + `devtools::load_all()`
        + `get_help("thing youre developing")`
    + As long as you are developing in the right steps, the `carnivores` and `msleep` datasets should automatically be available without any need to read them in.

6. Once you are satisfied with your doc page, it's time to test the package with `devtools::test()`. **If there are NO test FAILURES, you did it! You developed!!** Time for a pull request! Before filing the PR, make sure you've added/committed/pushed the following:
     + `R/fct-topics.R`
     + Your `Rmd` topic page in `inst/rmd_topics/`

### How to develop new `{introverse}` exercises

Coming soon!







