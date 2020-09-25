#Assignment 2 BIS 244 by Bryan Lu
library(tidyverse)
us_states <- read_csv("us-states.csv")
view(us_states)

only_pa <- us_states %>% filter(state=="Pennsylvania")
View(only_pa)

only_pa <- mutate(only_pa, adj_deaths = deaths)

##April 21st, 2020 deaths should be adjusted downward by 282

##April 22nd, 2020 deaths should be adjusted downward by 297

n<-length(only_pa$date)

for (i in 1:n) {
  if (as.character(only_pa$date[i])=="2020-04-21") {
    only_pa$adj_deaths[i] <- (only_pa$deaths[i] - 282)}
   else if(as.character(only_pa$date[i])=="2020-04-22") {
     only_pa$adj_deaths[i] <- (only_pa$deaths[i] - 297)}}

##Calculate sum of all adj_deaths in PA and Print to console
sum(only_pa$adj_deaths)
