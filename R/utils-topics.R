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
  # Same page
  "group_by", "ungroup",
  "pull",
  "rename",
  "glimpse",
  "if_else", 
  "case_when", 
  "n",
  "count",
  "tally",
  "left_join",
  "right_join",
  "full_join",
  "inner_join",
  "anti_join",
  "bind_cols",
  "bind_rows"
))

#' All the ggplot2 topics
#' @keywords internal
ggplot2_topics <- sort(c(
  "ggplot",
  "aes",
  "labs",
  "ggsave",
  "geom_histogram",
  "geom_density",
  "geom_boxplot", 
  "geom_point",
  "geom_smooth",
  "geom_jitter",
  "geom_bar",
  "geom_col",
  "geom_segment",
  # Same page
  "geom_text", "geom_label",
  # Same page
  "theme_gray", "theme_grey", "theme_bw", "theme_minimal", "theme_light", "theme_linedraw", "theme_classic", "theme_dark", "theme_void",
  "theme_set",
  "theme",
  # Same page
  "scale_color_manual","scale_colour_manual",  "scale_fill_manual", "scale_shape_manual", "scale_size_manual", "scale_alpha_manual","scale_linetype_manual", "scale_color_gradient", "scale_colour_gradient","scale_color_gradient2", "scale_colour_gradient2","scale_fill_gradient","scale_fill_gradient2",
  # Same page
  "scale_color_brewer", "scale_color_distiller", "scale_colour_brewer","scale_colour_distiller", "scale_fill_distiller", "scale_fill_brewer", 
  "scale_color_viridis_c","scale_color_viridis_d","scale_colour_viridis_c","scale_colour_viridis_d","scale_fill_viridis_c", "scale_fill_viridis_d",
  # Same page
  "xlim", "ylim",
  # Same page:
  "facet_wrap", "facet_grid"
))
# geom_line <--- need a dataset
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

#' All the todyselect topics, INCLUDING SELF!
#' @keywords internal
tidyselect_topics <- sort(c(
  # All on same page so we include self:
  "tidyselect", 
  "everything",
  "contains",
  "starts_with",
  "ends_with",
  "matches"
))

#' All the readr topics
#' @keywords internal
readr_topics <- sort(c(
  # Same page:
  "read_csv", "read_tsv", "read_csv2", "read_delim",
  # Same page:
  "write_csv", "write_tsv", "write_csv2", "write_delim"
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


#' All the stringr topics
#' @keywords internal
stringr_topics <- sort(c(
  "str_count",
  "str_replace", "str_replace_all",
  "str_to_upper", "str_to_lower", "str_to_sentence", "str_to_title", 
  "str_detect", 
  "str_starts", "str_ends"
  # Not needed for fall:
  #"str_trim",
#  "str_order",
#  "str_trunc", "str_pad"
))



#' All the base R topics
#' @keywords internal
base_topics <- sort(c(
  "abs",
  "all", "any", # Same page
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
  "as.character",
  "names",
  "unique",
  "str",
  "print", "cat", # Same page
  "paste", "paste0" # same page
))



#' List of available help topics by category ordered alphabetically, which is sometimes but not always a package.
#' @keywords internal
topic_list <- list(
  # ALERT!!!! Do not directly add topics to this list! Instead, add new topics to the appropriate array above For example, to add a `dplyr` topic, put in into the `dplyr_topics` definition!!
  "base"       = base_topics,
  "datasets"   = c("carnivores", "msleep"),
  "dplyr"      = dplyr_topics,
  "forcats"    = forcats_topics,
  "ggplot2"    = ggplot2_topics,
  "glue"       = c("glue"),
  "magrittr"   = c("apipe", "pipe"), # keep assignment first
  "operators"  = c("assignment", "logical", "mathematical"), # alphabetical
  "readr"      = readr_topics,
  "stringr"    = stringr_topics, 
  "tibble"     = tibble_topics,
  "tidyr"      = tidyr_topics,
  "tidyselect" = tidyselect_topics
  )




#' List of which topics share a given page, for redirection. The FIRST one represents the rmd file which _exist_
#' @keywords internal
shared_doc_pages <- list(
  c("all", "any"),
  c("print", "cat"),
  c("paste", "paste0"),
  c("str_replace", "str_replace_all"),
  c("str_to_upper", "str_to_lower", "str_to_sentence", "str_to_title"),
  c("str_starts", "str_ends"),
  c("facet_wrap", "facet_grid"),
  c("tidyselect", 
    "everything",
    "contains",
    "starts_with",
    "ends_with",
    "matches"),
  c("geom_text", "geom_label"),
  c("xlim", "ylim"),
  c("scale_color_manual",
    "scale_colour_manual", 
    "scale_fill_manual", 
    "scale_shape_manual", 
    "scale_size_manual", 
    "scale_alpha_manual",
    "scale_linetype_manual",
    "scale_color_gradient", 
    "scale_colour_gradient",
    "scale_fill_gradient",
    "scale_color_gradient2", 
    "scale_colour_gradient2",
    "scale_fill_gradient2"),
  c("scale_color_brewer", 
    "scale_color_distiller", 
    "scale_colour_brewer",
    "scale_colour_distiller", 
    "scale_fill_distiller", 
    "scale_fill_brewer"),
  c("scale_color_viridis_c",
    "scale_color_viridis_d",
    "scale_colour_viridis_c",
    "scale_colour_viridis_d",
    "scale_fill_viridis_c", 
    "scale_fill_viridis_d"),
  c("mean", "median", "min", "max", "sd", "sum"),
  c("theme_gray",
    "theme_grey", 
    "theme_bw", 
    "theme_minimal", 
    "theme_light", 
    "theme_linedraw", 
    "theme_classic", 
    "theme_dark", 
    "theme_void"),
  c("group_by", "ungroup"),
  c("read_csv", "read_tsv", "read_csv2", "read_delim"),
  c("write_csv", "write_tsv", "write_csv2", "write_delim"),
  c("fct_lump_n", "fct_lump_prop", "fct_lump_min"),
  c("nrow", "ncol"),
  c("head", "tail"),
  c("ceiling", "floor"),
  c("file.exists", "dir.exists"),
  c("tibble", "tribble")
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
