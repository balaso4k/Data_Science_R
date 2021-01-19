
#-----------------------------------------------------------------------------

credit_Risk <- read.csv("CreditRisk.csv", stringsAsFactors = T)
head(credit_Risk) ; dim(credit_Risk)
summary(credit_Risk)
View(credit_Risk)
credit_Risk$Gender[ is.na(credit_Risk$Gender)] <- "Male"
credit_Risk$Married[ is.na(credit_Risk$Married)] <- "No"
credit_Risk$Self_Employed[ is.na(credit_Risk$Self_Employed)] <- "Yes"
credit_Risk$Loan_Amount_Term[ is.na(credit_Risk$Loan_Amount_Term)] <- mean(credit_Risk$Loan_Amount_Term, na.rm = T)
credit_Risk$Credit_History[ is.na(credit_Risk$Credit_History)] <- 0
credit_Risk$Dependents[ is.na(credit_Risk$Dependents)] <- "0"
credit_Risk$LoanAmount[ is.na(credit_Risk$LoanAmount)] <- mean(credit_Risk$LoanAmount, na.rm = T)

#  Convert the data from categorical to numeric

library(dplyr)
credit_Risk <- mutate(credit_Risk , Loan_Status1  = ifelse(Loan_Status == "Y",1,0))
credit_Risk <- mutate(credit_Risk , Education1     = ifelse(Education   == "Graduate",1,0))
credit_Risk <- mutate(credit_Risk , Self_Employed1 = ifelse(Self_Employed == "Yes",1,0))
credit_Risk <- mutate(credit_Risk, newarea = ifelse(Property_Area == "Urban" ,2 , ifelse(Property_Area == "Rural",0,1)))
credit_Risk <- mutate(credit_Risk , Gender1 = ifelse(Gender == "Female",1,0))
credit_Risk <- mutate(credit_Risk , Married1 = ifelse(Married == "No",1,0))


credit_Risk1 <- credit_Risk[ , c( 4,7,8,9,10,11,14,15,16,17,18,19)]
  
credit_Risk1$Loan_Status1 <- factor(credit_Risk1$Loan_Status1)    # we factorize the loan status because it is the target variable



dim(credit_Risk1)

# Sampling
set.seed(1111)
crs <- sample( 2, nrow(credit_Risk1), replace = T, prob = c(0.8,0.2))
credit_Risk1_train <- credit_Risk1[crs == 1 , ]
credit_Risk1_test <- credit_Risk1[crs == 2 , ]

dim(credit_Risk1_train)
dim(credit_Risk1_test)



# Model Building
# function =  glm( y ~ . , data = DF)

model_cr <- glm( Loan_Status1 ~ . , data = credit_Risk1_train ,family = binomial)
summary(model_cr)

table(credit_Risk1_train$Loan_Status1,credit_Risk1_train$Credit_History)

pred_val <- predict(model_cr , credit_Risk1_test, type = "response")
pred_val

# Create the data frame of output
df <- data.frame(pred_val, credit_Risk1_test$Loan_Status1)  
df
colnames(df)[2] <- "Actual Value"

df <- mutate( df , Predicted = ifelse(pred_val >= 0.5,1,0))
df

tab1 <- table(df$Predicted, df$`Actual Value`)
tab1

sum(diag(tab1)) / sum(tab1) * 100 # gives the accuracy of the model

tpr <- 127/(127+14)
fpr <- 36/(36+41)
tpr
fpr



# 
install.packages("ROSE")
library(ROSE)


predict.glm <- predict(model_cr, credit_Risk1_train, type = "response") # prediction of train
pred_actual <- data.frame(predict.glm, credit_Risk1_train$Loan_Status1)

pred_actual <- mutate(pred_actual, pred_val = ifelse(predict.glm > 0.5,1,0))
colnames(pred_actual)[2] <- "Actual"
pred_actual <- na.omit(pred_actual)

roc.curve(pred_actual$Actual, predict.glm)

#
pred_glm <- predict(model_cr ,credit_Risk1 , type = "response")
length(pred_glm)
pred_full <-data.frame(pred_glm , credit_Risk$Loan_ID)
colnames(pred_full)[1] <- "Probability"
colnames(pred_full)[2] <- "Loan_ID"

pred_full < arrange(pred_full , desc(Probability))
View(pred_full)
