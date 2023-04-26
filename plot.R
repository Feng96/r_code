library(ggplot2)
library(dplyr)
library(grid)

height <- read.csv('C:/Users/utkge/Desktop/data/stats/HEIGHT.csv',header = T)
area <- read.csv('C:/Users/utkge/Desktop/data/stats/AREA.csv',header = T)
validation <- read.csv('C:/Users/utkge/Desktop/data/stats/validation.csv',header = T)



##height plot
#remove outlier

#plot
p1 <-ggplot(height, aes(x = state, y = mean,group = 1)) + geom_line(size = 1)+
  theme(axis.title.x = element_blank(), axis.text.x = element_blank())+
  labs(y='mean(m)')
p2 <-ggplot(height, aes(x = state, y = median,group = 1)) + geom_line(size = 1)+
  theme(axis.title.x = element_blank(), axis.text.x = element_blank())+
  labs(y='median(m)')
p3 <-ggplot(height, aes(x = state, y = std,group = 1)) + geom_line(size = 1)+
  theme(axis.title.x = element_blank(),axis.text.x = element_text(angle=60))+
  labs(y='STD(m)')
  

grid.newpage()
grid.draw(rbind(ggplotGrob(p1), ggplotGrob(p2),ggplotGrob(p3), size = "last"))



##area plot
#remove outlier
area <- area %>% mutate(std = replace(std, std > 2000, 2000))
#plot
p1 <-ggplot(area, aes(x = state, y = mean,group = 1)) + geom_line(size = 1)+
  theme(axis.title.x = element_blank(), axis.text.x = element_blank())+
  labs(y= expression ('mean'~(m^2)))
p2 <-ggplot(area, aes(x = state, y = median,group = 1)) + geom_line(size = 1)+
  theme(axis.title.x = element_blank(), axis.text.x = element_blank())+
  labs(y= expression ('median'~(m^2)))
p3 <-ggplot(area, aes(x = state, y = std,group = 1)) + geom_line(size = 1)+
  theme(axis.title.x = element_blank(),axis.text.x = element_text(angle=60))+
  labs(y= expression ('STD'~(m^2)))


grid.newpage()
grid.draw(rbind(ggplotGrob(p1), ggplotGrob(p2),ggplotGrob(p3), size = "last"))

## count
p1 <-ggplot(area, aes(x = state, y = count/1000000,group = 1)) + geom_line(size = 1)+
  theme(axis.title.x = element_blank(), axis.text.x = element_blank())+
  labs(y= 'count/million')
p2 <-ggplot(height, aes(x = state, y = count/1000000,group = 1)) + geom_line(size = 1)+
  theme(axis.title.x = element_blank(),axis.text.x = element_text(angle=60))+
  labs(y= 'coun/millon')

grid.newpage()
grid.draw(rbind(ggplotGrob(p1), ggplotGrob(p2), size = "last"))

