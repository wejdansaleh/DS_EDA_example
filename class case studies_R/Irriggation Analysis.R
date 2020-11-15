# Irriggation Analysis
# Small case study using irrigation _wide.csv in the data directory

library(tidyverse)
library(rio)
library(dplyr)

# begin weith wide "messy" format: 
irrigation <- read_csv("data/irrigation_wide.csv")


# Examine the data:
str(irrigation)
# other way
summary(irrigation)
# or
mutate(irrigation)

# In 2007 what the total area under irriggation?
  sum(irrigation[4,4:5])

# tidy Data
irrigation_t <- irrigation %>%
  pivot_longer(-year, names_to = "region")
irrigation_t

# What is the total under irrigation for each year?
irrigation_t %>%
  group_by(year) %>%
  mutate(total_ = sum (value)) %>%
  select(year,total_) %>%
  filter(row_number(year) == TRUE)

#which 2 region increased most from 1980 to 2007:
# arrange from highest to lowest  use "-"
# slice() takes a specific row number 
irrigation_t %>% 
  group_by(region) %>%
  summarise(diff = value[year == 2007] - value[year == 1980]) %>%
  arrange(-diff) %>%
  slice(1:2)
# other way
#slice_max(diff, n=2)

# standardizes area against 1980(relative change over 1980)
irrigation_t %>%
  group_by(year) %>%
  mutate(total_ = sum (value)) %>%
  select(year,total_) %>%
  transmute(rel_c = total_ /62) %>%   # add a new variable and drop the exiting 
  filter(row_number(year) == TRUE)

# what is the rate of change in each region (maybe tricky)
 irrigation_t %>% 
  arrange(region) %>%
  mutate(rate= c(0, diff(value)/value[-length(value)]))
 arrange(diff)


# where is it ?the highest and lowest 
# by tidy way
irrigation_t %>%
  ungroup() %>%     # bucuse our data is group
  slice_max(rate, n=1)


irrigation_t %>%
  ungroup() %>%     
  slice_min(rate, n=1)


