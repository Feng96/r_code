library(ggplot2)
library(dplyr)
library(grid)

setwd('C:/Users/utkge/Desktop/data/buiding_height')
stat <- read.csv('all_states_stats.csv',header = T)


p1 <-ggplot(height, aes(x = state, y = mean,group = 1)) + geom_line(size = 1)+
  theme(axis.title.x = element_blank(), axis.text.x = element_blank())+
  labs(y='mean(m)')