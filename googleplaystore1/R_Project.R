## Google Play Store Apps Analysis

## Loading library
library(tidyverse)
library(rio)
library(dplyr)
#library(plyr)

# begin weith wide "messy" format: 
AppStore <- read_csv("data/googleplaystore.csv")

# Examine the data:
mutate(AppStore)

# Tidy data 
AppStore_t <- AppStore %>%
  pivot_longer(-c(App, Category, Rating, Reviews, Installs, Type), 
               names_to = "More Information")
AppStore_t

# Sample of data
AppStore_st <- sample_n(AppStore_t, 20)

# type of data:
typeof(AppStore_st)


# Descriptive statistics (count Free app VS Paid App, Max (rating, reviews), Mean, SD (Reviews))

# count Category
AppStore_st %>%
  group_by(Category) %>%
  summarise(n = length(Category))

# Most popular Category has Install 
# Create the function 
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
v <- AppStore_st$Category
popular_Category <- getmode(v) 
 
# count Free app VS Paid App:

summarise(AppStore_st, Free_App = nrow(subset(AppStore_st,Type == "Free")) )

summarise(AppStore_st, Paid_App = nrow(subset(AppStore_st,Type != "Free")) )


# The highest and lowest rating:
AppStore_st[which.max(AppStore_st$Rating),]

AppStore_st[which.min(AppStore_st$Rating),]

# App with highest reviews:
AppStore_st[AppStore_st$Reviews == max(AppStore_st$Reviews),]

AppStore_st[AppStore_st$Reviews == min(AppStore_st$Reviews),]

# Mean and SD for reviews:
 summarise(AppStore_st, AppStore_mean = mean(Reviews, na.rm = T))
 summarise(AppStore_st, AppStore_sd = sd(Reviews, na.rm = T))
 

 
 
### Plot 
 ggplot(AppStore_st, aes(Installs, Reviews )) +
   GeomBar()
 
 
 
 
ggplot(AppStore_st, aes(Installs, Reviews )) +
 geom_boxplot()
  
ggplot(AppStore_st, aes(Installs, Reviews )) +
geom_jitter(width = 0.15) 
stat_summary(fun.data = mean_sdl, 
              fun.args = list(mult = 1),
              col = "red")

#Compute one-way ANOVA test
#Model should include the scores on the validation set.
AppStore_lm <- lm( Reviews ~  Installs, data = AppStore_st)
AppStore_lm
anova(AppStore_lm)

AppStore_lm$coefficients



