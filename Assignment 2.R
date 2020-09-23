#Assignment 2 BIS 244 by Bryan Lu

us_states <- read_csv("us-states.csv")
view(us_states)

only_pa <- us_states %>% filter(state=="Pennsylvania")
View(only_pa)

only_pa <- mutate(only_pa, adj_deaths = deaths)

##April 21st, 2020 deaths should be adjusted downward by 282

#mutate(only_pa, adj_deathsd)

#n<-length(only_pa)

#for (i in 1:n) {
#  if(only_pa[i]=="x"){
#    print(age[i])
#  } else{}
#}

##April 22nd, 2020 deaths should be adjusted downward by 297

##Calculate sum of all adj_deaths in PA and Print to console
sum(only_pa$adj_deaths)
