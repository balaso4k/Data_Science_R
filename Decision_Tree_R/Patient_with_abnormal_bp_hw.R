pabp <- read.csv("Patient_with_abnormal_bloodpressure.csv", stringsAsFactors = F)
summary(pabp)

library(dplyr)
pabp$Pregnancy[ is.na(pabp$Pregnancy)] <- 0
pabp$Genetic_Pedigree_Coefficient[ is.na(pabp$Genetic_Pedigree_Coefficient)] <-  mean(pabp$Genetic_Pedigree_Coefficient, na.rm = T)
pabp$alcohol_consumption_per_day[ is.na(pabp$alcohol_consumption_per_day)] <-  mean(pabp$alcohol_consumption_per_day, na.rm = T)


pabp$Blood_Pressure_Abnormality <- factor(pabp$Blood_Pressure_Abnormality)    
pabp$Pregnancy <- factor(pabp$Pregnancy)    

set.seed(1111) 
pabp_s <- sample( 2, nrow(pabp), replace = T, prob = c(0.8,0.2))
pabp_train <- pabp [pabp_s == 1 , ]
pabp_test <- pabp [pabp_s == 2 , ]

dim(pabp_train)
dim(pabp_test)


# Model Building

# Logistic regression

# function =  glm( y ~ . , data = DF)

model_pabp <- glm( Blood_Pressure_Abnormality ~ . , data = pabp_train, family = binomial)
summary(model_pabp)

table(pabp_train$Blood_Pressure_Abnormality,pabp_train$Level_of_Hemoglobin  )

pred_val_pabp <- predict(model_pabp , pabp_test, type = "response")
pred_val_pabp

# Create the data frame of output
df_pabp <- data.frame(pred_val_pabp, pabp_test$Blood_Pressure_Abnormality)  
df_pabp
colnames(df_pabp)[2] <- "Actual_Value"

df_pabp <- mutate( df_pabp , Predicted = ifelse(pred_val_pabp >= 0.5,1,0))
df_pabp

tab1_pabp <- table(df_pabp$Predicted, df_pabp$Actual_Value)
tab1_pabp

sum(diag(tab1_pabp)) / sum(tab1_pabp) * 100 # gives the accuracy of the model

tpr <- 140/(140+58)
fpr <- 153/(153+56)
tpr
fpr

predict.glm_pabp<- predict(model_pabp, pabp_train, type = "response") # prediction of train
pred_actual_pabp <- data.frame(predict.glm_pabp, pabp_train$Blood_Pressure_Abnormality)

pred_actual_pabp <- mutate(pred_actual_pabp, pred_val = ifelse(predict.glm_pabp > 0.5,1,0))
colnames(pred_actual_pabp)[2] <- "Actual"
pred_actual_pabp <- na.omit(pred_actual_pabp)

library(ROSE)
roc.curve(pred_actual_pabp$Actual, predict.glm_pabp)

#______________________________________________________________________________________________________________________________


# Model building with decision tree

library(party)


summary(pabp_train)
pabp_dt <- ctree( Blood_Pressure_Abnormality ~ . , data = pabp_train, controls = ctree_control(mincriterion = .90, minsplit = 450))
plot(pabp_dt)

pabp_dt_predict <- predict( pabp_dt, pabp_test , type = "response")
pabp_dt_predict

pabp_DT_DF  <- data.frame( pabp_dt_predict , pabp_test$Blood_Pressure_Abnormality)

pabp_predict_table <- table(pabp_dt_predict,  pabp_test$Blood_Pressure_Abnormality)
pabp_predict_table

pabp_DT_Accuracy <- sum(diag(pabp_predict_table))/ sum(pabp_predict_table) * 100
pabp_DT_Accuracy


#______________________________________________________________________________________________________________________________________________________

# Model building with random forest

library(randomForest)

pabp_rf <- randomForest(Blood_Pressure_Abnormality ~ . , data = pabp_train , ntree = 750)
pabp_rf

pred_rf <- predict( pabp_rf , pabp_test )

pabp_tab_rf <- table(pred_rf ,pabp_test$Blood_Pressure_Abnormality)
pabp_tab_rf

pabp_rf_accuracy <- sum(diag(pabp_tab_rf))/ sum(pabp_tab_rf)*100
pabp_rf_accuracy

#____________________________________________________________________________________________________________________________________________________

# Model building with  naive Bayes
library(e1071)
pabp_nb <- naiveBayes(Blood_Pressure_Abnormality ~ . , data = pabp_train)
pabp_nb


pabp_predict_nb <- predict( pabp_nb, pabp_test )
pabp_predict_nb

pabp_predict_nb_dt <- data.frame(pabp_predict_nb,pabp_test$Blood_Pressure_Abnormality)
pabp_predict_nb_dt

pabp_predict_nb_table <- table(pabp_predict_nb,pabp_test$Blood_Pressure_Abnormality)
pabp_predict_nb_table

pabp_nb_accuracy <- sum(diag(pabp_predict_nb_table))/ sum(pabp_predict_nb_table)*100
pabp_nb_accuracy

