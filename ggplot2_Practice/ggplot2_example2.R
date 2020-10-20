
library(tidyverse)
library(ggplot2)  ## <<< part of the tidyvers
library(RColorBrewer)

# Another data set ----

msleep2 <- msleep %>% 
  select(vore, sleep_total) %>% 
  na.omit()

msleep2

myCol <- brewer.pal(5, "Dark2")

# a) "Dot" plot
ggplot(msleep2, aes(x = vore, y = sleep_total, color = vore)) +
  geom_point(position = position_jitter(width = 0.2, seed = 136), 
             shape = 16, alpha = 0.65) +
  scale_color_brewer(palette = "Dark2") +
  scale_y_continuous(limits = c(0,24),
                     breaks = seq(0, 24, 6),
                     expand = c(0,0)) +
  scale_x_discrete(labels = c("Carnivore",
                              "Herbivore",
                              "Insectivore",
                              "Omnivore")) +
  labs(title = "a) Dot Plot",
       x = "Eating Habits",
       y = "Total Sleep Time (h)") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none") +
  NULL

# b) "Dot" plot with mean and sd
ggplot(msleep2, aes(x = vore, y = sleep_total, color = vore)) +
  geom_point(position = position_jitter(width = 0.2, seed = 136),
             shape = 16, alpha = 0.65,
              fun.y="mean") +
  stat_summary(fun.data = mean_sdl,
               fun.args = list(mult = 1))+

  scale_color_brewer(palette = "Dark2") +

  scale_y_continuous(limits = c(0,24),
                     breaks = seq(0, 24, 6),
                     expand = c(0,0)) +
  scale_x_discrete(labels = c("Carnivore",
                              "Herbivore",
                              "Insectivore",
                              "Omnivore")) +


  labs(title = "b) Dot plot with mean and sd",
       x = "Eating Habits",
       y = "Total Sleep Time (h) [mean,sd]") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none")


# c) Just the mean and the sd
ggplot(msleep2, aes(x = vore, y = sleep_total, color = vore)) +

  stat_summary(fun.data = mean_sdl, 
               fun.args = list(mult = 1)) +
  scale_color_brewer(palette = "Dark2") +
  scale_y_continuous(limits = c(0,24),
                     breaks = seq(0, 24, 6),
                     expand = c(0,0)) +
  scale_x_discrete(labels = c("Carnivore",
                              "Herbivore",
                              "Insectivore",
                              "Omnivore")) +
  
  
  stat_summary(fun.data = mean_sdl,
               fun.args = list(mult = 1), col=myCol)+
  
  labs(title = "c) Just the mean and the sd",
       x = "Eating Habits",
       y = "Total Sleep Time (h) [mean, sd]") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none") +
  NULL


# d) Bar (aka "Dynamite") plot
# om <- msleep2[msleep2$vore =="omni" ,]
# sd <- sd(om$sleep_total)
# me <- mean(om$sleep_total)
# 
# ggplot(msleep2, aes(x = vore, 
#                     y = sleep_total, 
#                     color = vore,
#                     fill= vore)) +
#   geom_bar(stat = "identity") +
#   scale_y_continuous(limits = c(0,24),
#                      breaks = seq(0, 24, 6),
#                      expand = c(0,0)) +
#   scale_x_discrete(labels = c("Carnivore",
#                               "Herbivore",
#                               "Insectivore",
#                               "Omnivore")) +
#   
#   labs(title = "d) Bar (aka Dynamite) plot",
#        x = "Eating Habits",
#        y = "Total Sleep Time (h) [mean, sd]") +
#   theme_classic() +
#   theme(axis.text.x = element_text(angle = 45, hjust = 1),
#         legend.position = "none") +
#   NULL

# e) Box plot
ggplot(msleep2, aes(x = vore, y = sleep_total )) +
  geom_boxplot(color="black", fill=myCol) +
  
  scale_y_continuous(limits = c(0,24),
                                     breaks = seq(0, 24, 6),
                                     expand = c(0,0)) +
  scale_x_discrete(labels = c("Carnivore",
                              "Herbivore",
                              "Insectivore",
                              "Omnivore")) +
  labs(title = "e) Box plot",
       x = "Eating Habits",
       y = "Total Sleep Time (h)") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none") +
  NULL

# f) Violin plot
ggplot(msleep2, aes(x = vore, 
                    y = sleep_total,
                    color= vore,
                    fill= vore )) +
  geom_violin() +
  scale_y_continuous(limits = c(0,24),
                     breaks = seq(0, 24, 6),
                     expand = c(0,0)) +
  scale_x_discrete(labels = c("Carnivore",
                              "Herbivore",
                              "Insectivore",
                              "Omnivore")) +
  labs(title = "f) Violin plot",
       x = "Eating Habits",
       y = "Total Sleep Time (h)") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none") +
  NULL


#c("#1B9E77", "#D95F02", "#7570B3" ,"#E7298A" ,"#66A61E")

