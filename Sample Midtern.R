#Bryan Lu

library(tidyverse)

tmp <- getwd()
setwd("./covid-19-data")

us_counties <- read_csv("us-counties.csv")

setwd(tmp)

pa_counties <- us_counties %>% filter(state=="Pennsylvania")
NEPA <- c("Bradford", "Carbon", "Columbia","Lackawanna", "Luzerne", "Monroe", "Montour",
          "Northumberland", "Pike", "schuylkill", "Sullivan", "Susquehanna", "Wayne", "Wyoming")
NEPA_counties <- pa_counties[pa_counties$county %in% NEPA,]
NEPA_latest <- NEPA_counties[NEPA_counties$date == max(NEPA_counties$date),]

#view(NEPA_latest)

p <- ggplot(date = NEPA_latest, 
            mapping = aes(x = county, y=cases, fill = county))

p + geom_bar(position = "dodge", stat = "identity") + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  labs(x = NULL, y = "Latest Case Count",
       title = "NEPA COVID-19 Case Counts",
       subtitle = paste0("as of",max(NEPA_counties$date)),
       caption = "Data: NY Times")

