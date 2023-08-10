library(tidyverse)
str_length("ABCDEF")
X <- c("abcdef", "ghijkl")
str_sub(X, 3, 3)
str_sub(X, 2, -2)
str_sub(X, 2, 2) <- "T"
X
str_dup(X, c(2, 3))
str_pad(X, 10)
str_pad(X, 15, "both")
str_pad(X, 3)
y <- c("Short", "This string is very long")
y %>%
  str_trunc(10)%>%
  str_pad(10, "right")
z <- c(" a ", "b    ", "           c")
str_trim(z)
str_trim(z, "left")
words <- str_c("hello there are a lot of words I can type into",
               "this document I am still typing and I feel like",
               "I am running out of things to type I feel like",
               "This may be long enough now thank you.")
cat(str_wrap(words, width=40))
a <- "I like coding!"
str_to_upper(a)
str_to_title(a)
str_to_lower(a)
str_to_lower(a, "tr")
b <- c("m", "a", "b")
str_order(b)
str_sort(b)
strings <- c("banana",
             "856 981 7904",
             "856-464-0860",
             "Work: 718.381.2919; Home: 472.102.7501")
phone <- "([2-9][0-9]{2})[- .]([0-9]{3})[- .]([0-9]{4})"
str_detect(strings, phone)
str_subset(strings, phone)
str_count(strings, phone)
(loc <- str_locate(strings, phone))
str_locate_all(strings, phone)
str_extract(strings, phone)
str_extract_all(strings, phone)
str_extract_all(strings, phone, simplify=TRUE)
str_match(strings, phone)
str_match_all(strings, phone)
str_replace(strings, phone, "XXX-XXX-XXXX")
str_split("a-b-c", "-")
str_split_fixed("a-b-c", "-", n=2)
a1 <- "\u00e1"
a2 <- "a\u0301"
c(a1, a2)
a1 == a2
str_detect(a1, fixed(a2))
str_detect(a1, coll(a2))
i <- c("I", "İ", "i", "ı")
i
str_subset(i, coll("i", ignore_case = TRUE))
str_subset(i, coll("i", ignore_case = TRUE, locale = "tr"))
x <- "This is a sentence."
str_split(x, boundary("word"))
str_count(x, boundary("word"))
str_extract_all(x, boundary("word"))
str_split(x, "")
str_count(x, "")
