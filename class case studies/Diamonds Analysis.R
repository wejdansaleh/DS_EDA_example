


library(tidyverse)
library(rio)

#Exercise 8.1 (Import and Examine)
jems <- read_csv("data/diamonds.csv")
jems

#Exercise 8.3 (Counting individual groups)
#How many diamonds with a clarity of category “IF” are present in the data-set? 
# sum(jems$clarity == "IF")
clarity <- jems %>%
  filter(clarity =="IF")
nrow(clarity)
#- What fraction of the total do they represent?
nrow(clarity)/nrow(jems)

#Exercise 8.4 (Summarizing proportions)
#What proportion of the whole is made up of each category of clarity?

jems %>%
  group_by(clarity) %>%
  count() %>%
  mutate(prop=n/nrow(jems))


#jems %>%
# filter(clarity  == TRUE) %>%
# count() %>%
# mutate(prop=n/nrow(jems))


#Exercise 8.5 (Find specific diamonds prices)
#What is the cheapest diamond price overall?
min(jems$price)
#What is the range of diamond prices?
range(jems$price)
#What is the average diamond price in each category of cut and color?
jems %>% 
  group_by(cut, color) %>%
  summarise(avg = mean(price))


#Exercise 8.6 (Basic plotting)
jems %>%
  group_by(carat) 
ggplot(jems, aes(carat,price )) +
  geom_jitter()
# code with Rick
ggplot(jems, aes(x = carat,y = price )) +
  geom_point()


#Exercise 8.7 (Interpreting plots)
#What can you say about the relationship between these two variables? 
# there is no enigh information 
#Do you think that you can use the carat weight of a diamond to predict its price?

#Exercise 8.8 (Applying transformations)


jems <- jems %>%
  mutate(price_log10 = log10(jems$price),
         carat_log10<-log10(jems$carat))

# alternative 
jems$price_log10 <- log10(jems$price)
jems$carat_log10 <-log10(jems$carat)

# plot the transformed varibles
ggplot(jems, aes(x = carat_log10,y = price_log10 )) +
  geom_point()




#Exercise 8.9 (Basic plotting)
jems %>%
  group_by(carat)
ggplot(jems, aes(carat_log10,price_log10 )) +
  geom_jitter()



#Exercise 8.10 (Viewing models)
# our produce model x ~ y
diamonds_lm <- lm( price_log10 ~ carat_log10, data = jems)
diamonds_lm
diamonds_lm$coefficients

#Exercise 8.11 (Displaying models)
#geom_smooth(colour ="red")
ggplot(jems, aes( x = carat_log10, y = price_log10)) + 
  geom_point() +
  geom_smooth(method = lm, se = FALSE ,colour = "red")






