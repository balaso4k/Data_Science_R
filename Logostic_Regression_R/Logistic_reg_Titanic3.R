library(readxl)
titanic3 <- read_excel("titanic3.xls", na = "")
View(titanic3)
str(titanic3)
head(titanic3)

summary(titanic3)


titanic3$age[ is.na(titanic3$age)] <-  mean(titanic3$age, na.rm = T)
titanic3$fare[ is.na(titanic3$fare)] <-  mean(titanic3$fare, na.rm = T)
titanic3$body[ is.na(titanic3$body)] <-  mean(titanic3$body, na.rm = T)
titanic3$embarked[ is.na(titanic3$embarked)] <- "C"

#  Convert the data from categorical to numeric

library(dplyr)

titanic3 <- mutate( titanic3, sex1 = ifelse( sex == "female",1,0) )
titanic3 <- mutate( titanic3, embarked1 = ifelse( embarked == "C",2, ifelse( embarked == "S",0,1)) )


titanic3a <- titanic3[ ,c(1,2,5,6,7,9,13,15,16)]
View(titanic3a)

titanic3a$survived  <- factor(titanic3a$survived )    # we factorised the survived because it is the target variable

View(titanic3a)

dim(titanic3a)


# Sampling

set.seed(111)  # it dosent changes the sampling every time sampling fix any time regenerate same test and train sample & 1111 is only random no which ever we want take 

tit <- sample( 2, nrow(titanic3a), replace = T , prob = c(0.8,0.2))
titanic3a_train <- titanic3a[ tit == 1 , ]
titanic3a_test <- titanic3a[ tit == 2 , ]

dim(titanic3a_train)
dim(titanic3a_test)

# Model Building
# function =  glm( y ~ . , data = DF)

model_tit <- glm(survived ~ . , data = titanic3a_train, family = binomial)
summary(model_tit)

#

table(titanic3a_train$survived,titanic3a_train$sex1)

pred_titval <- predict(model_tit , titanic3a_test, type = "response")
pred_titval


# Create the data frame of output
df_tit <- data.frame(pred_titval, titanic3a_test$survived)  
df_tit
colnames(df_tit)[2] <- "Actual_Value"

df_tit <- mutate( df_tit , Predicted = ifelse(pred_titval >= 0.5,1,0))
df_tit

tab1_tit <- table(df_tit$Predicted, df_tit$Actual_Value)
tab1_tit

sum(diag(tab1_tit)) / sum(tab1_tit) * 100 # gives the accuracy of the model

tpr <- 73/(73+37)
fpr <- 19/(19+110)
tpr
fpr


install.packages("ROSE")
library(ROSE)


predict.glm_tit <- predict(model_tit, titanic3a_train, type = "response") # prediction of train
pred_actual_tit <- data.frame(predict.glm_tit, titanic3a_train$survived)

pred_actual_tit <- mutate(pred_actual_tit, pred_val = ifelse(predict.glm_tit > 0.5,1,0))
colnames(pred_actual_tit)[2] <- "Actual"
pred_actual_tit <- na.omit(pred_actual_tit)

roc.curve(pred_actual_tit$Actual, predict.glm_tit)
