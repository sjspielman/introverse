library(tidyverse)
library(learnr) 
library(datasets)

# Hist 1
"ggplot(backpacks, aes(x = BackpackWeight)) +
  geom_histogram()" -> hist_1

# Hist 2
"ggplot(backpacks, aes(x = BackpackWeight)) +
  geom_histogram(bins=15)"  -> hist_2

# Hist 3
"ggplot(backpacks, aes(x = BackpackWeight)) +
  geom_histogram(bins=15) +
  labs(x='Backpack Weight (lb)', y = 'Count')"  -> hist_3

# Hist 4
"ggplot(backpacks, aes(x = BackpackWeight)) +
  geom_histogram(bins=15, fill = 'firebrick') +
  labs(x='Backpack Weight (lb)', y = 'Count')"  -> hist_4

# Hist 5
"ggplot(backpacks, aes(x = BackpackWeight)) +
    geom_histogram(bins=15, fill = 'firebrick', color = 'black') +
    labs(x='Backpack Weight (lb)', y = 'Count')" -> hist_5

# Hist 6
"ggplot(backpacks, aes(x = BackpackWeight)) +
  geom_histogram(bins=15, fill = 'firebrick', alpha = 0.7) +
  labs(x='Backpack Weight (lb)', y = 'Count')" -> hist_6



