#  1. problem statement  

# Build the predictive model which can do the prediction of the mpg

#  2. Data gathering   _
#     ( We have the data )


#  3. Sampling data     
# skipping the sampling step because data is small


# 4 .  cleaning 
#    no need a data is already clean 


# 5 . Model building


model_mtcars <- lm(mpg  ~ . , data = mtcars )    # model has been build


summary(model_mtcars)



model_mtcars <- lm(mpg  ~ wt + am + qsec + hp + disp   , data = mtcars )    # model has been build

summary(model_mtcars)


model33_mtcars <- lm(mpg  ~ wt + am + qsec   , data = mtcars )    # model has been build

summary(model33_mtcars)

#____________________________________________________________________________________
# try to build few more models taking various combinations  of columns

model2_mtcars <- lm(cyl  ~ . , data = mtcars )    # model has been build

summary(model2_mtcars)



model2_mtcars <- lm(cyl  ~   gear + vs + drat + disp + qsec , data = mtcars )    # model has been build

summary(model2_mtcars)



model3_mtcars <- lm(disp  ~   wt + carb + hp + qsec + cyl , data = mtcars )    # model has been build

summary(model3_mtcars)



model4_mtcars <- lm(hp  ~   disp + carb + wt + vs + mpg  , data = mtcars )    # model has been build

summary(model4_mtcars)



model5_mtcars <- lm(drat  ~   cyl + carb + am + wt + mpg  , data = mtcars )    # model has been build

summary(model5_mtcars)



model6_mtcars <- lm(wt  ~   disp + carb + qsec + mpg + hp , data = mtcars )    # model has been build

summary(model6_mtcars)



model7_mtcars <- lm(qsec  ~  wt + vs + am + disp + cyl, data = mtcars )    # model has been build

summary(model7_mtcars)



model8_mtcars <- lm(vs  ~  qsec + cyl + hp + am + disp , data = mtcars )    # model has been build

summary(model8_mtcars)


model9_mtcars <- lm(am  ~ qsec + gear + mpg + cyl +vs, data = mtcars )    # model has been build

summary(model9_mtcars)



model10_mtcars <- lm(gear  ~ carb + cyl + am + wt + hp  , data = mtcars )    # model has been build

summary(model10_mtcars)



model11_mtcars <- lm(carb  ~ disp + wt + hp + gear + qsec  , data = mtcars )    # model has been build

summary(model11_mtcars)




# try to building the model on lung cap data target variable is lung cap



model3 <- lm(mpg ~ wt , data = mtcars) 
summary(model3)



model1 <- lm(mpg  ~ wt + am + qsec + hp + disp   , data = mtcars )    # model has been build

summary(model1)


perd_value  <- predict(model1, mtcars)
perd_value

pred_actual <- data.frame(perd_value , mtcars$mpg)   # Create a data frame with predicted and actual values
pred_actual
colnames(pred_actual)[1] <- "Predicted"
colnames(pred_actual)[2] <- "Actual"
pred_actual


# MSE (mean square error) =  ( error , square of error , mean)

error <- mtcars$mpg  - perd_value
square_error <- error^2
MSE <- mean(square_error)
MSE


RMSE <- MSE ^ 0.5       # root of mse
RMSE


# Mean absolute percentage error

# ERROR -->  PER. ERROR --> absolute value ---> MEAN

MAPE <- mean( abs(error/ mtcars$mpg)) * 100
MAPE

plot(model1)



plot(model)
model <- lm(mpg  ~ . , data = mtcars )    # model has been build


summary(model)

mean(error)

hist(error)

plot(error)

