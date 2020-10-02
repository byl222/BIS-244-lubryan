#BIS 244 Assignment 3 By Bryan Lu


library(tidyverse)
library(dplyr)
setwd("./covid-19-data/")
getwd()

us_counties <- read_csv("us-counties.csv")
view(us_counties)

pa_only <- us_counties %>% filter(state=="Pennsylvania")

Northampton <- pa_only %>% filter(county=="Northampton")
view(Northampton)

p<- ggplot()
p + geom_point(data=Northampton,
               mapping = aes(x = date,
                             y = deaths, color="deaths")) +
  geom_point(data=Northampton,
             mapping = aes(x = date,
                           y = cases,color="cases")) +
  labs( title = "COVID-19 Cases in Northampton County, PA",
       subtitle =  waiver()) +
  xlab('Date') +
  ylab('Cases and Deaths') 

  