library(MASS)

cr <- read.csv("CreditRisk.csv")

cr <- na.omit(cr)
tab1 <- table(cr$Credit_History, cr$Loan_Status)
chisq.test(tab1)



tab2 <- table(cr$Education, cr$Loan_Status)
chisq.test(tab2)
tab3 <- table(cr$Self_Employed, cr$Loan_Status)
chisq.test(tab3)
tab4 <- table(cr$Property_Area, cr$Loan_Status)
chisq.test(tab4)

cr <- na.omit(cr)
tab5 <- table(cr$Married, cr$Loan_Status)
chisq.test(tab5)
tab6 <- table(cr$Gender, cr$Loan_Status)
chisq.test(tab6)

#__________________________________________________________________________


sal_sat <- read.csv("salary_satisfaction.csv")

View(sal_sat)

sal_tab <- table(sal_sat$Salary, sal_sat$Service)

chisq.test(sal_tab)





