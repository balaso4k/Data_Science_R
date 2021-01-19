# Feature selection for the linear regression models

install.packages("ISLR") 
library(ISLR)
install.packages("leaps") 
library(leaps)


mdl_hit <- regsubsets(Salary ~ . , Hitters, nvmax = 19 )
summary(mdl_hit)

dim(Hitters)


# on property price 

Prop_Price <- read.csv("Property_Price_Train.csv")

View(Prop_Price)

summary(Prop_Price)


Prop_Price[is.na(Prop_Price)] = 0


summary(Prop_Price)


Prop_Price1 <- Prop_Price[  , c(2,4,5,18,19,27,35,37,38,44,45,46, 48:53,55,57,62,63,67:72,76,77,81)]
head(Prop_Price1)


sam  <-  sample( 2 , nrow(Prop_Price1), replace = T , prob = c(0.8 ,0.2))

train_Prop_Price1  <-  Prop_Price1[ sam == 1 , ]
test_Prop_Price1  <-  Prop_Price1[ sam == 2 , ]

dim(train_Prop_Price1)
dim(test_Prop_Price1)

# 

mdl_propr <- regsubsets(Sale_Price ~ . , Prop_Price1, nvmax = 30  )
summary(mdl_propr)

