> Please be aware: These instructions are written for a primary audience of _student contributors in the [Spielman lab](https://spielmanlab.github.io/)_. However, anyone is welcome to contribute. Please file an issue using "Request to Contribute" first to ensure efforts are not duplicated.
 
# Contributing to `{introverse}` package development

## Before you begin...

Want to learn more about R package development in general? 

1. Official book : https://r-pkgs.org/
2. A good blog post walking you through your first package: https://www.pipinghotdata.com/posts/2020-10-25-your-first-r-package-in-1-hour/
3. You will use the packages `devtools` and `usethis` _a lot_
    + https://devtools.r-lib.org/
    + https://usethis.r-lib.org/



## When to file issues in the `{introverse}`

> You will see templates when you [open a new issue](https://github.com/spielmanlab/introverse/issues/new/choose).


1. File an issue when you **have suggestions to improve or address bugs in the documentation**, using the "Feedback for existing introverse docs" template.

2. File an issue when you **want to make a contribution**, using the "Request to Contribute" template. 

3. File an issue when you **want to request a new topic be added to the introverse**, using the "Feature request" template.
  


## How to contribute to the `{introverse}` docs

**First, please file an issue requesting to document a certain topic!** This will make sure work is not duplicated. 

### The whole terminal experience

You'll begin by navigating in the terminal with `cd` to the directory where you have your local `introverse` clone.


```bash
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

```bash
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


1. In RStudio, open your `introverse/` Project session (recommended), where your *R working directory* should be at the top-level of your `introverse/` directory.

<br>

2. Add your topic to the appropriate place inside `R/utils-topics.R`, making sure to not introduce bugs in the process!
    + You should _not be guessing_ the appropriate place. You should _already know how and where to do this._ If you don't know, stop and ask Spielman.

<br>

  
3. In R Console, run the command: `devtools::load_all()` to _load_ the current version of the package into your R session. 
    + When the `{introverse}` loads, it will print a short welcome message to the Console that begins "Welcome to the {introverse}!". If you see this output, you will know the command worked.
    + If you get an error of any kind, it means you likely introduced a bug somewhere when adding your topic. Go de-bug until `devtools::load_all()` works.

<br>


4. Open a new Rmd introverse docs template file, and save it to the directory `introverse/inst/rmd_topics/`. Write your Rmd help page using the `introverse` template and existing Rmd help pages as guidance. 
    + Your file **must be named** `category_topic.Rmd`, reflecting what you added to `R/utils-topics.R`.
    + **You cannot and should not knit this document like normal!!** Instead, you must use `get_help()` to see the output, i.e. `get_help("topic")` (replace topic with your topic, of course). 
      + As long as you are developing in the right steps, the `carnivores` and `msleep` datasets should automatically be available without any need to read them in.

<br>


5. Once you are satisfied with your doc page, it's time to test the package with `devtools::test()`. **If there are NO test FAILURES, you did it! You developed!!** Time for a pull request! Before filing the PR, make sure you've added/committed/pushed the following:
     + `R/utils-topics.R`
     + Your `Rmd` topic page at `inst/rmd_topics/category_topic.Rmd`

<br>


### How to develop new `{introverse}` exercises

Coming soon!







