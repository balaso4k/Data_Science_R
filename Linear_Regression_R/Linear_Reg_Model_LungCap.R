

#  1. problem statement  

# Build the predictive model which can do the prediction of the Lung Capacity


library(dplyr)

Lung_cap <- read.csv("LungCapData.csv")
Lung_cap <- mutate(Lung_cap , Smoke1 = ifelse(Smoke == "no", 0,1))
Lung_cap <- mutate(Lung_cap , Gender1 = ifelse(Gender == "male", 1,0))
Lung_cap <- mutate(Lung_cap , Caesarean1 = ifelse(Caesarean == "no", 0,1))

summary(Lung_cap)

lcn <- Lung_cap[  , c(1,2,3,7,8,9)]
head(lcn)

sam  <-  sample( 2 , nrow(lcn), replace = T , prob = c(0.8 ,0.2))

train_lcn  <-  lcn[ sam == 1 , ]
test_lcn  <-  lcn[ sam == 2 , ]

dim(train_lcn)
dim(test_lcn)


model_lcn <- lm(LungCap ~ . , data = train_lcn)
summary(model_lcn)


pred_train <- predict(model_lcn , train_lcn)
pred_test <- predict(model_lcn,test_lcn)

# the model which i have created is able to explain 85.02% of the total variance of the data

error_train <- train_lcn$LungCap - pred_train
mean(error_train)   # mean of the errors should be close to zero

hist(error_train)

plot(error_train)
abline( h = mean(error_train), col = "red")
abline( h = 2 , col = "green")
abline( h = -2, col = "yellow")


plot(train_lcn$LungCap , error_train)
abline( h = mean(error_train), col = "red")



model_lcn1 <- lm(LungCap ~ Age + Height + Smoke1 + Gender1, data = train_lcn)
summary(model_lcn1)


# Rsquare = 0.8 ,

error_test <- test_lcn$LungCap - pred_test

MSE <-  mean(error_test^2)
MSE


RMSE <- MSE ^ 0.5
RMSE


MAPE <- mean(abs(error_test/test_lcn$LungCap )) * 100
MAPE



#___________________________________________________________________________________________________________________




