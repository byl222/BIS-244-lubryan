library(tidyverse)
library(ggplot2)

tanks <- read.csv("LT History.csv")

tanks$win_ratio <- tanks$Wins/tanks$Games.Played
average_win_ratios_tier <- tanks %>%
  group_by(Tier) %>%
  summarize(average_win= mean(win_ratio, na.rm=TRUE))

p <- ggplot(average_win_ratios_tier, aes(x=Tier, y=average_win, fill=Tier))
p+geom_col()+
  (scale_y_continuous(labels=scales::percent)) +
  labs(x= "Tiers",
       y= "Average Win Percentage",
       title= "Best Tier",
       subtitle = "Based on Average Win ratio")

tanks$win_ratio <- tanks$Wins/tanks$Games.Played
average_win_ratios <- tanks %>%
  group_by(Nationality) %>%
  summarize(average_win= mean(win_ratio))

p <- ggplot(average_win_ratios, aes(x=Nationality, y=average_win, fill=Nationality))
p+geom_col()+(scale_y_continuous(labels=scales::percent)) +
  labs(x= "Nationality",
       y= "Average Win Percentage",
       title= "Best Nationality ",
       subtitle = "Based on Average Win Per Nationality")


tanks$win_ratio <- tanks$Wins/tanks$Games.Played
average_win_ratios_tank <- tanks %>%
  group_by(Tank) %>%
  summarize(average_win= mean(win_ratio))

p <- ggplot(data=average_win_ratios_tank,
            mapping = aes(x=Tank,
                          y=average_win,
                          fill=Tank,
                          color=Tank))

p+geom_col()+geom_text(mapping=aes(label=Tank), hjust=-0.1)+
  coord_flip()+
  (scale_y_continuous(labels=scales::percent)) +
  labs(x="Tanks", 
       y="Average Win Ratio",
       title= "Best Individual Tank",
       subtitle = "Based on Average Win Per Tank")

