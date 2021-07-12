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

#Hist 7
"ggplot(backpacks, aes(x = BackpackWeight)) +
    geom_histogram(bins=15, fill = 'firebrick', alpha = 0.7) +
    facet_grid(. ~ Sex) +
    labs(x='Backpack Weight (lb)', y = 'Count', title ='Distributions of Backpack Weight by Sex')" -> hist_7

# Hist 8
"ggplot(backpacks, aes(x = Units)) +
  geom_histogram(bins=20, fill = 'firebrick', alpha = 0.7) +
  facet_grid(Sex ~ .) +
  labs(x='Semester Credits', y = 'Count', title ='Distributions of Semester Credits by Sex')" -> hist_8

# Hist 9
"ggplot(backpacks, aes(x = BackpackWeight)) +
  geom_histogram(bins=15, fill = 'firebrick', color = 'black') +
  geom_vline(aes(xintercept = mean(BackpackWeight))) +
  labs(x='Backpack Weight (lb)', y = 'Count')" -> hist_9

# Hist 10
"ggplot(backpacks, aes(x = BackpackWeight)) +
  geom_histogram(bins=15, fill = 'firebrick', color = 'black', linetype = 'dashed') + 
  geom_vline(aes(xintercept = mean(BackpackWeight)), linetype= 'dashed') +
  labs(x='Backpack Weight (lb)', y = 'Count')" -> hist_10

# Scatt 1
"ggplot(backpacks, aes(x = BodyWeight, y = BackpackWeight )) +
    geom_point(color = 'darkblue') +
  labs(x='Body Weight (lb)', y = 'Backpack Weight (lb)')" -> scatt_1

# Scatt 2
"ggplot(backpacks, aes(x = BodyWeight, y = BackpackWeight, color = Sex )) +
    geom_point() +
  labs(x='Body Weight (lb)', y = 'Backpack Weight (lb)')" -> scatt_2

# Scatt 3
"ggplot(backpacks, aes(x = BodyWeight, y = BackpackWeight, color = Sex, size = Sex, shape = Sex )) +
  geom_point() +
  labs(x='Body Weight (lb)', y = 'Backpack Weight (lb)')" -> scatt_3

# Scatt 4
"ggplot(backpacks, aes(x = BodyWeight, y = BackpackWeight, color = Sex, shape = Sex )) +
  geom_point() +
  labs(x='Body Weight (lb)', y = 'Backpack Weight (lb)') +
  scale_shape_manual(values=c(8, 17)) +
  scale_color_manual(values=c('green','navy'))" -> scatt_4

# Scatt 5
"ggplot(backpacks, aes(x = BodyWeight, y = BackpackWeight, color = Ratio)) +
  geom_point() +
  labs(x='Body Weight (lb)', y = 'Backpack Weight (lb)') +
  scale_color_gradient(low = 'blue', high = 'red')" -> scatt_5

# Scatt 6
"ggplot(backpacks, aes(x = BodyWeight, y = BackpackWeight, color = Ratio)) +
  geom_point() +
  labs(x='Body Weight (lb)', y = 'Backpack Weight (lb)') +
  scale_color_gradient(low = 'blue', high = 'red') +
  geom_smooth(method=lm)" -> scatt_6

# Scatt 7
"ggplot(backpacks, aes(x = BodyWeight, y = BackpackWeight )) +
  geom_point(color = 'darkblue') +
  labs(x='Body Weight (lb)', y = 'Backpack Weight (lb)') +
  geom_text(aes(label = Major))" -> scatt_7

# Scatt 8
"ggplot(backpacks, aes(x = BodyWeight, y = BackpackWeight )) +
  geom_point(color = 'darkblue') +
  labs(x='Body Weight (lb)', y = 'Backpack Weight (lb)') +
  geom_text_repel(aes(label = Major), size = 2.5)" -> scatt_8

# Box 1
"ggplot(CO2, aes(x = Type, y = uptake)) +
  geom_boxplot() +
  labs(x ='Location of Plant', y = 'Backpack Weight (lb)')" -> box_1

# Box 2
"ggplot(CO2, aes(x = Type, y = uptake)) +
    geom_boxplot(fill = 'pink', color = 'green') +
    labs(x = 'Location of Plant', y = 'Carbon Dioxide Uptake')" -> box_2

# Box 3
"ggplot(CO2, aes(x = Type, y = uptake)) +
  geom_boxplot(fill = 'beige', color = 'black') +
  labs(x = 'Location of Plant', y = 'Carbon Dioxide Uptake', title = 'Comparsion of Plant Location Across Carbon Dioxide Uptake and Concentration') +
  facet_wrap(conc ~ .)" -> box_3

# Box 4


            