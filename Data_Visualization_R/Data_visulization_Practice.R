                 #  Data Visualization In R 




#library

library(dplyr)
library(ggplot2)


#Data

midwest <- read.csv("midwest.csv", header = T)
str(midwest)

#_______________________________________________________________________________________________________________


# Bar plot

# State wise count

midwest %>% 
  ggplot(aes(x = state , fill = state))+
  geom_bar()+
  ggtitle("State wise count", 
          "State V/S Count")


# State wise category count
midwest %>% 
  ggplot(aes(x = category , fill = state ))+
  geom_bar()+
  ggtitle("State wise count",
          "Category V/S Count")+
  coord_flip()+
  facet_wrap(~state)


#__________________________________________________________________________________________________________


# Pie chart

# Data preparation for state wise distribution

midwest_pie <- as_data_frame(midwest)
midwest_pie


data <- midwest_pie %>%  filter( state == 'IL'| state == 'IN' | state == 'MI' |
                                   state == 'OH' | state == 'WI') %>%
  group_by(state) %>%
  summarise( avgpoptotal = mean(poptotal),
             avgpopdensity = mean(popdensity),
             avgpopblack = mean(popblack),
             avgpopwhite = mean(popwhite),
             avgpopamerindian = mean(popamerindian),
             avgpopasian = mean(popother),
             avgpoppovertyknown = mean(poppovertyknown),
             avgpopadults = mean(popadults),
             avgpopother = mean(popother))

# data visualization

# 1. State wise total population Distribution

pie(data$avgpoptotal, labels = data$state, col = rainbow(length(data$state)), 
    main="State wise total population Distribution")+
legend("topright", c("IN","WI","MI","IL","OH"), cex = 0.7, fill = rainbow(length(data$avgpoptotal)))



# 2. State wise population Density

pie(data$avgpopdensity, labels = data$state, col = rainbow(length(data$state)), 
    main="State wise population Density")+
legend("topright", c("IN","WI","MI","IL","OH"), cex = 0.7, fill = rainbow(length(data$avgpopdensity)))


# 3. State wise Number of Black people 
pie(data$avgpopblack, labels = data$state, col = rainbow(length(data$state)), 
    main="State wise Number of Black people ")
legend("topright", c("IN","WI","MI","IL","OH"), cex = 0.7, fill = rainbow(length(data$avgpopblack)))


# 4. State wise Number of White people 

pie(data$avgpopwhite, labels = data$state, col = rainbow(length(data$state)), 
    main="State wise Number of White people")+
legend("topright", c("IN","WI","MI","IL","OH"), cex = 0.7, fill = rainbow(length(data$avgpopwhite)))



# 5. State wise Number of American-Indians people 

pie(data$avgpopamerindian, labels = data$state, col = rainbow(length(data$state)), 
    main="State wise Number of American-Indians people")+
legend("topright", c("IN","WI","MI","IL","OH"), cex = 0.7, fill = rainbow(length(data$avgpopamerindian)))


# 6. State wise Number of Asians  people 

pie(data$avgpopasian, labels = data$state, col = rainbow(length(data$state)), 
    main="State wise Number of Asians  people")+
legend("topright", c("IN","WI","MI","IL","OH"), cex = 0.7, fill = rainbow(length(data$avgpopasian)))




# 7. State wise Number of poor people  

pie(data$avgpoppovertyknown, labels = data$state, col = rainbow(length(data$state)), 
    main="State wise Number of poor people ")+
legend("topright", c("IN","WI","MI","IL","OH"), cex = 0.7, fill = rainbow(length(data$avgpoppovertyknown)))


# 8. State wise Number of adults  people  

pie(data$avgpopadults, labels = data$state, col = rainbow(length(data$state)), 
    main="State wise Number of adults people ")+
legend("topright", c("IN","WI","MI","IL","OH"), cex = 0.7, fill = rainbow(length(data$avgpopadults)))


# 9. State wise Number of other  people  

pie(data$avgpopother, labels = data$state, col = rainbow(length(data$state)), 
    main="State wise Number of other people ") +
legend("topright", c("IN","WI","MI","IL","OH"), cex = 0.7, fill = rainbow(length(data$avgpopother)))

  
#___________________________________________________________________________________________________________

# Data preparation for Category wise distribution

data2 <- midwest_pie %>%  filter( category == 'AAR'| category == 'AAU' | category == 'AHR ' |
                                    category == 'AHU'| category == 'ALR' | category == 'ALU'|
                                    category == 'HAR'| category == 'HAU' | category == 'HHR'|
                                    category == 'HHU'| category == 'HLR' | category == 'HLU'|
                                    category == 'LAR'| category == 'LAU' | category == 'LHR'| 
                                    category == 'LHU' | category == 'LLR'| category == 'LLU') %>%
  group_by(category) %>%
  summarise( avgpoptotal = mean(poptotal),
             avgpopdensity = mean(popdensity),
             avgpopblack = mean(popblack),
             avgpopwhite = mean(popwhite),
             avgpopamerindian = mean(popamerindian),
             avgpopasian = mean(popother),
             avgpoppovertyknown = mean(poppovertyknown),
             avgpopadults = mean(popadults),
             avgpopother = mean(popother))

# data visualization

# 1. Category wise total population Distribution

pie(data2$avgpoptotal, labels = data2$category, col = rainbow(length(data2$category)), 
    main="Category wise total population Distribution") +
  legend("topright",c('AAR','AAU', 'AHR ','AHU',
                      'ALR','ALU' ,'HAR','HAU' , 
                      'HHR','HHU' ,'HLR' ,'HLU',
                      'LAR', 'LAU' ,'LHR' ,'LHU', 
                      'LLR', 'LLU'), 
         cex = 0.8, fill = rainbow(length(data2$avgpoptotal)))




# 2. Category wise total population Density

pie(data2$avgpopdensity, labels = data2$category, col = rainbow(length(data2$category)), 
    main="Category wise total population Density") +
  legend("topright",c('AAR','AAU', 'AHR ','AHU',
                      'ALR','ALU' ,'HAR','HAU' , 
                      'HHR','HHU' ,'HLR' ,'HLU',
                      'LAR', 'LAU' ,'LHR' ,'LHU', 
                      'LLR', 'LLU'),
         cex = 0.8, fill = rainbow(length(data2$avgpopdensity)))


# 3. Category wise Number of Black people 

pie(data2$avgpopblack, labels = data2$category, col = rainbow(length(data2$category)), 
    main="Category wise Number of Black people ") +
  legend("topright",c('AAR','AAU', 'AHR ','AHU',
                      'ALR','ALU' ,'HAR','HAU' , 
                      'HHR','HHU' ,'HLR' ,'HLU',
                      'LAR', 'LAU' ,'LHR' ,'LHU', 
                      'LLR', 'LLU'),
         cex = 0.8, fill = rainbow(length(data2$avgpopblack)))


# 4. Category wise Number of White people  

pie(data2$avgpopwhite, labels = data2$category, col = rainbow(length(data2$category)), 
    main="Category wise Number of White people  ") +
  legend("topright",c('AAR','AAU', 'AHR ','AHU',
                      'ALR','ALU' ,'HAR','HAU' , 
                      'HHR','HHU' ,'HLR' ,'HLU',
                      'LAR', 'LAU' ,'LHR' ,'LHU', 
                      'LLR', 'LLU'),
         cex = 0.8, fill = rainbow(length(data2$avgpopwhite)))


# 5. Category wise Number of American-Indians people 


pie(data2$avgpopamerindian, labels = data2$category, col = rainbow(length(data2$category)), 
    main="Category wise Number of American-Indians people  ") +
  legend("topright",c('AAR','AAU', 'AHR ','AHU',
                      'ALR','ALU' ,'HAR','HAU' , 
                      'HHR','HHU' ,'HLR' ,'HLU',
                      'LAR', 'LAU' ,'LHR' ,'LHU', 
                      'LLR', 'LLU'),
         cex = 0.8, fill = rainbow(length(data2$avgpopamerindian)))


# 6. Category wise Number of Asian people 


pie(data2$avgpopasian, labels = data2$category, col = rainbow(length(data2$category)), 
    main="Category wise Number of Asian people  ") +
  legend("topright",c('AAR','AAU', 'AHR ','AHU',
                      'ALR','ALU' ,'HAR','HAU' , 
                      'HHR','HHU' ,'HLR' ,'HLU',
                      'LAR', 'LAU' ,'LHR' ,'LHU', 
                      'LLR', 'LLU'),
         cex = 0.8, fill = rainbow(length(data2$avgpopasian)))



# 7. Category wise Number of poor people 


pie(data2$avgpoppovertyknown, labels = data2$category, col = rainbow(length(data2$category)), 
    main="Category wise Number of poor people  ") +
  legend("topright",c('AAR','AAU', 'AHR ','AHU',
                      'ALR','ALU' ,'HAR','HAU' , 
                      'HHR','HHU' ,'HLR' ,'HLU',
                      'LAR', 'LAU' ,'LHR' ,'LHU', 
                      'LLR', 'LLU'),
         cex = 0.8, fill = rainbow(length(data2$avgpoppovertyknown)))


# 8. Category wise Number of Adult people 


pie(data2$avgpopadults, labels = data2$category, col = rainbow(length(data2$category)), 
    main="Category wise Number of Adult people  ") +
  legend("topright",c('AAR','AAU', 'AHR ','AHU',
                      'ALR','ALU' ,'HAR','HAU' , 
                      'HHR','HHU' ,'HLR' ,'HLU',
                      'LAR', 'LAU' ,'LHR' ,'LHU', 
                      'LLR', 'LLU'),
         cex = 0.8, fill = rainbow(length(data2$avgpopadults)))



# 9. Category wise Number of Other people 


pie(data2$avgpopother, labels = data2$category, col = rainbow(length(data2$category)), 
    main="Category wise Number of Ather people  ") +
  legend("topright",c('AAR','AAU', 'AHR ','AHU',
                      'ALR','ALU' ,'HAR','HAU' , 
                      'HHR','HHU' ,'HLR' ,'HLU',
                      'LAR', 'LAU' ,'LHR' ,'LHU', 
                      'LLR', 'LLU'),
         cex = 0.8, fill = rainbow(length(data2$avgpopother)))



#_______________________________________________________________________________________________________



# box plot

midwest %>%
  ggplot(aes( x = state , y = poptotal, fill = state)) +
  geom_boxplot()+
  scale_y_continuous(" Total Population",
                     limits = c(0,100000))

# in above code we can generates the various box plots by using the different variables (only numeric)
#  for this change the y variable  and adjust the limits as per condition for y 
#  we get state wise distribution for selected y variable and also change the title



#___________________________________________________________________________________________________________________





# Histogram 


midwest %>% 
  ggplot(aes( x = poptotal, fill = state)) +
  geom_histogram(binwidth = 75000,
                 color = "blue",
                 alpha = 0.8) +
  facet_wrap( ~ state) +
  
  ggtitle("State wise Total population distribution")



# in above code we can generates the various histogram by using the different variables (only numeric)
#  for this change the x variable (Which has numeric) and adjust the limits as per condition for x
#  we get state wise distribution for selected x variable and also change the title


#___________________________________________________________________________________________________________________



# line plot

midwest %>% 
  ggplot(aes(x= area, y = poptotal, color = state )) +
  geom_line()+
  stat_smooth(se = 0)+
  facet_wrap( ~ state) +
  scale_x_continuous("Area",
                     limits = c(0,0.09))+
  scale_y_continuous(" Total Population",
                     limits = c(0,800000))+
  ggtitle("State wise Total population vs Area")



# in above code we can generates the various line plots by using the different variables (only numeric)
#  for this change the x and y variable (Which has numeric) and adjust the limits as per condition for X And y  
#  we get state wise line plot for selected x & y variable and also change the title




#________________________________________________________________________________________________________________________________

# Scatter plot



midwest %>% ggplot(aes( x = area, y = poptotal, fill =state)) +
  geom_point()+
  facet_wrap(~ state)+
  ggtitle("State wise Distribution",
          subtitle = "Area V/S Total population")+
  geom_smooth(method = "lm") +
  scale_x_continuous(" Area",
                     limits = c(0,0.09))+
  scale_y_continuous(" Total Population",
                     limits = c(0,800000)) +
  theme_bw()


# in above code we can generates the various line plots by using the different variables (only numeric)
#  for this change the x and y variable (Which has numeric) and adjust the limits as per condition for X And y  
#  we get state wise line plot for selected x & y variable and also change the title
