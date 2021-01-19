install.packages("Boruta")
library(Boruta)

install.packages("mlbench")
library(mlbench)

data("Sonar")

?Sonar

View(Sonar)

str(Sonar)

# Model Building

mdl_bor <- Boruta(Class ~ . , data = Sonar)
mdl_bor$finalDecision

plot(mdl_bor$finalDecision)

plot(mdl_bor$finalDecision)
plot(mdl_bor)

length(mdl_bor$finalDecision[mdl_bor$finalDecision == "Tentative"])
length(mdl_bor$finalDecision[mdl_bor$finalDecision == "Confirmed"])
length(mdl_bor$finalDecision[mdl_bor$finalDecision == "Rejected"])



# Baruta feature selection on credit risk


credit_Risk <- read.csv("CreditRisk.csv",stringsAsFactors = F)
head(credit_Risk) ; dim(credit_Risk)
summary(credit_Risk)

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

credit_Risk1$Loan_Status1 <- factor(credit_Risk1$Loan_Status1)    # we factorised the loan status because it is the target variable
credit_Risk1$Dependents <- as.numeric(credit_Risk1$Dependents)    # we factorised the loan status because it is the target variable


# model building

mdl_cr <- Boruta(Loan_Status1 ~ . , data = credit_Risk1)
mdl_cr$finalDecision

plot(mdl_cr$finalDecision)

plot(mdl_cr)

length(mdl_cr$finalDecision[mdl_cr$finalDecision == "Tentative"])
length(mdl_cr$finalDecision[mdl_cr$finalDecision == "Confirmed"])
length(mdl_cr$finalDecision[mdl_cr$finalDecision == "Rejected"])





