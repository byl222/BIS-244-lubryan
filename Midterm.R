#Midterm By Bryan Lu

library(tidyverse)
library(scales)
library(dplyr)
library(gapminder)

tmp <- getwd()
setwd("~/Desktop/BIS FOLDER/BIS-244-lubryan")

countries <- read.csv("data.csv")

#view("data.csv")
setwd(tmp)

str(countries)
#view(countries)

G7 <- c("Canada", "France", "Germany", "Italy", "Japan", "United_Kingdom", "United_States_of_America")

G7_countries <- countries[countries$countriesAndTerritories %in% G7,]

#view(G7_countries)


p <- ggplot(data = G7_countries, mapping = aes(x = month, y = cases, color = countriesAndTerritories)) + 
  scale_x_continuous(breaks=c(2.5, 5.0, 7.5, 10.0), labels=c("Jan", "Apr","Jul", "Oct"))

p + geom_line()+
  labs(x = NULL, y = "New Cases per Day",
           title = "G7 COVID-19 Case Counts",
           subtitle = "By Bryan Lu as of 2020-10-15",
           caption = "Data: ECDC Times")
  



