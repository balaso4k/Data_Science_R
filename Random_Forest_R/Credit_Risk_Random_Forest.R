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


summary(credit_Risk1)

dim(credit_Risk1)

# Sampling
set.seed(1111)
crs <- sample( 2, nrow(credit_Risk1), replace = T, prob = c(0.8,0.2))
credit_Risk1_train <- credit_Risk1[crs == 1 , ]
credit_Risk1_test <- credit_Risk1[crs == 2 , ]

dim(credit_Risk1_train)
dim(credit_Risk1_test)
summary(credit_Risk1_train)
summary(credit_Risk1_test)

crs_rf <- randomForest(Loan_Status1 ~ . , data = credit_Risk1_train , ntree = 750)
crs_rf


importance(crs_rf)



crs_pred_rf <- predict( crs_rf , credit_Risk1_test )

crs_tab_rf <- table(crs_pred_rf , credit_Risk1_test$Loan_Status1)
crs_tab_rf

imo



# over sampling 
table(credit_Risk1_train$Loan_Status1)

# do samlping increase the records for class which is under represented 
# (only on the train data)
# do prediction on test data 

aa1 <- credit_Risk1_train[ credit_Risk1_train$Loan_Status1 == 0 , ]   # Contains the records only for the class 3
aa1




credit_Risk1_train1 <- rbind(credit_Risk1_train, aa1,aa1)
table(credit_Risk1_train1$Loan_Status1)

#rf

crs_rf <- randomForest(Loan_Status1 ~ . , data = credit_Risk1_train1 , ntree = 750)
crs_rf

crs_pred_rf <- predict( crs_rf , credit_Risk1_test )

crs_tab_rf <- table(crs_pred_rf , credit_Risk1_test$Loan_Status1)
crs_tab_rf

