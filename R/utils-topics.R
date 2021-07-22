#' All the dplyr topics
#' @keywords internal
dplyr_topics <- sort(c(
  "filter",
  "slice",
  "select", 
  "mutate", 
  "arrange", 
  "distinct",
  "summarize",
  "group_by", 
  "ungroup",
  "pull",
  "rename",
  "glimpse",
  "if_else", 
  "case_when", 
  "n",
  "count",
  "tally",
  "bind_cols",
  "left_join",
  "right_join",
  "full_join",
  "inner_join",
  "anti_join"
))

#' All the ggplot2 topics
#' @keywords internal
ggplot2_topics <- sort(c(
  "aes",
  "labs",
  "geom_histogram",
  "geom_density",
  "geom_boxplot", 
  "geom_point",
  "geom_smooth",
  "geom_jitter",
  "geom_bar",
  "geom_col"
))
# geom_line <--- need a dataset
# theme - this should also document theme_bw(), etc.
# scale_fc_manual
# scale_fc_brewer
# scale_fc_distiller
# facet


#' All the tibble topics
#' @keywords internal
tibble_topics <- sort(c(
  "as_tibble",
  # same page:
  "tibble","tribble"
))

#' All the tidyr topics
#' @keywords internal
tidyr_topics <- sort(c(
  "drop_na",
  "separate",
  "unite",
  "pivot_longer",
  "pivot_wider"
))

  
#' All the readr topics
#' @keywords internal
readr_topics <- sort(c(
  # Same page:
  "read_csv", "read_tsv", "read_csv2", "read_delim"
))

#' All the forcats topics
#' @keywords internal
forcats_topics <- sort(c(
  "fct_relevel",
  "fct_rev",
  "fct_infreq",
  "fct_reorder",
  # Same page:
  "fct_lump_n", "fct_lump_prop", "fct_lump_min"
))
  
#' All the base R topics
#' @keywords internal
base_topics <- sort(c(
  "length", 
  "nchar", 
  "log", 
  "sqrt",
  "summary", 
  "round",
  "head", "tail", # Same page
  "mean", "median", "max", "min", "sum", "sd", # Same page
  "ceiling", "floor", # Same page
  "ifelse", 
  "nrow", "ncol", # Same page
  "table",
  "levels", 
  "class", 
  "c", 
  "data.frame",
  "file.path", 
  "library",
  "install.packages",
  "getwd", 
  "setwd",
  "file.exists", "dir.exists", # Same page
  "as.numeric", 
  "as.factor", 
  "as.character" 
))



#' List of available help topics by category ordered alphabetically, which is sometimes but not always a package.
#' @keywords internal
topic_list <- list(
  # ALERT!!!! Do not directly add topics to this list! Instead, add new topics to the appropriate array above For example, to add a `dplyr` topic, put in into the `dplyr_topics` definition!!
  "base"      = base_topics,
  "datasets"  = c("carnivores", "msleep"),
  "dplyr"     = dplyr_topics,
  "forcats"   = forcats_topics,
  "ggplot2"   = ggplot2_topics,
  "magrittr"  = c("apipe", "pipe"), # keep assignment first
  "operators" = c("assignment", "logical", "mathematical"), # alphabetical
  "readr"     = readr_topics,
  "tibble"    = tibble_topics,
  "tidyr"     = tidyr_topics
)

#' Operators documented in logical, math, or assignment help pages
#' @keywords internal
operators <- c("+", "-", "*", "/" ,"**", "^", "%", "->", "<-",
               "==", ">", "<", ">=", "<=", "!=", "!", "&", "|") 

#' Obtain correct category and topic for any operator get_help() arguments 
#' @keywords internal
convert_operator_into_topic <- function(operator)
{
  dplyr::case_when(
    ########## Math ###########
    operator == "+" ~ "mathematical",
    operator == "-" ~ "mathematical",
    operator == "*" ~ "mathematical",
    operator == "/" ~ "mathematical",
    operator == "**" ~ "mathematical",
    operator == "^" ~ "mathematical",
    operator == "%" ~ "mathematical",
    ######### Logical ##########
    operator == "==" ~ "logical",
    operator == "!=" ~ "logical",
    operator == ">" ~ "logical",
    operator == "<" ~ "logical",
    operator == ">=" ~ "logical",
    operator == "<=" ~ "logical",
    operator == "!" ~ "logical",
    operator == "&" ~ "logical",
    operator == "|" ~ "logical",
    ######## Assignment #######
    operator == "<-" ~ "assignment",
    operator == "->" ~ "assignment",
  ) -> topic
  
  if (is.na(topic)) stop("\n\nERROR: Unknown operator.")
  
  topic
}


#' Magrittr operators
#' @keywords internal
magrittr_operators <- c("%<>%", "%>%")


#' Magrittr topics
#' @keywords internal
magrittr_topics <- c("apipe", "pipe")
