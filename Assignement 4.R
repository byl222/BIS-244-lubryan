#Assignment 4 by Bryan Lu

library(tidyverse)
library(scales)

gamers <- read.csv("Most Popular Twitch Streamers.csv")
str(gamers)
gamers$Date <- as.Date(gamers$Date, "%m/%d/%Y")
#View(gamers)


p <- ggplot(as.data.frame(gamers),
            mapping = aes(x = Date,
                          y = Viewers,
                          color = Streamer)) 

p + geom_line(mapping= aes(group= Streamer)) +
  scale_y_continuous(labels = unit_format(unit = "M", scale = 1e-6))+
  labs(title= "Most Popular Twitch Streamers")

###second graph

p <- ggplot(as.data.frame(gamers),
       mapping = aes(x = Date,
                     y = Viewers,
                     color = Streamer)) 
  p + geom_line(mapping= aes(group= Streamer))+
    facet_wrap(~Streamer)+
      scale_y_continuous(labels = unit_format(unit = "M", scale = 1e-6))+
      labs(title= "Most Popular Twitch Streamers")
      

